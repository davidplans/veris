import 'package:Veris/features/pat/baselines/models/baseline_model.dart';
import 'package:Veris/features/pat/shared/chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BaselineHelper {
  static CurrentBaseLineValue calculateCurrentBMP(List<SensorValue> data) {
    // Bear in mind that the method used to calculate the BPM is very rudimentary
    // feel free to improve it :)

    // Since this function doesn't need to be so "exact" regarding the time it executes,
    // I only used the a Future.delay to repeat it from time to time.
    // Ofc you can also use a Timer object to time the callback of this function
    List<SensorValue> values;
    double avg;
    int n;
    num m;
    double threshold;
    double bpm;
    int counter;
    int previous;

    values = List.from(data); // create a copy of the current data array
    avg = 0;
    n = values.length;
    m = 0;
    for (var item in values) {
      avg += item.value / n;
      if (item.value > m) {
        m = item.value;
      }
    }

    threshold = (m + avg) / 2;
    bpm = 0;
    counter = 0;
    previous = 0;
    for (int i = 1; i < n; i++) {
      if (values[i - 1].value < threshold && values[i].value > threshold) {
        if (previous != 0) {
          counter++;
          bpm += 60 * 1000 / (values[i].time.millisecondsSinceEpoch - previous);
        }
        previous = values[i].time.millisecondsSinceEpoch;
      }
    }

    return CurrentBaseLineValue(counter, bpm);
  }

  static void storeDataToDB(String userId, String studyId, int moduleId,
      String currentModuleResultId, List<double> instantBPMs) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    final baseStudyModuleData = {
      "userId": userId,
      "studyId": studyId,
      "moduleId": moduleId,
      "sectionId": 'none',
      "sectionName": 'none',
      "moduleName": 'none',
      "datetime": DateTime.now(),
      "type": "pat",
      "baselines": instantBPMs
    };

    users
        .doc(userId)
        .collection('studies')
        .doc(currentModuleResultId)
        .set(baseStudyModuleData);
  }
}
