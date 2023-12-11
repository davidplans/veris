import 'package:Veris/core/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseService {
  static Future<void> saveDataToFirebase(
      User user, double currentSliderValue) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final prefs = await SharedPreferences.getInstance();
    final selectedBody = prefs.getString('selectedBody');
    final numRuns = prefs.getInt('numRuns');
    final currentModuleResultId =
        prefs.getString('currentModuleResultId') ?? '';
    final knobScales = prefs.getStringList('knobScales');
    final instantBPMs = prefs.getStringList('instantBPMs');
    final instantPeriods = prefs.getStringList('instantPeriods');
    final averagePeriods = prefs.getStringList('averagePeriods');
    final instantErrs = prefs.getStringList('instantErrs');
    final currentDelays = prefs.getStringList('currentDelays');

    DateTime startFormatedTrialDate = DateTime.now();

    List<double> doubleInstantBPMs = [];
    if (instantBPMs != null) {
      doubleInstantBPMs = instantBPMs.map(double.parse).toList();
    }

    List<double> doubleInstantPeriods = [];
    if (instantPeriods != null) {
      doubleInstantPeriods = instantPeriods.map(double.parse).toList();
    }

    List<double> doubleAveragePeriods = [];
    if (averagePeriods != null) {
      doubleAveragePeriods = averagePeriods.map(double.parse).toList();
    }

    List<double> doubleInstantErrs = [];
    if (instantErrs != null) {
      doubleInstantErrs = instantErrs.map(double.parse).toList();
    }

    List<double> doubleCurrentDelays = [];
    if (currentDelays != null) {
      doubleCurrentDelays = currentDelays.map(double.parse).toList();
    }

    List<double> doubleKnobScales = [];
    if (knobScales != null) {
      doubleKnobScales = knobScales.map(double.parse).toList();
    }

    final trialData = {
      "numRuns": numRuns,
      "startTrial": startFormatedTrialDate,
      "selectedBody": selectedBody,
      "confidence": currentSliderValue,
      "endDate": DateTime.now(),
      "instantBPMs": doubleInstantBPMs,
      "recordedHR": doubleAveragePeriods,
      "knobScales": doubleKnobScales,
      "currentDelays": doubleCurrentDelays,
      "instantPeriods": doubleInstantPeriods,
      "averagePeriods": doubleAveragePeriods,
      "instantErrs": doubleInstantErrs,
    };
    try {
     await users
          .doc(user.id)
          .collection('studies')
          .doc(currentModuleResultId)
          .collection('trials')
          .add(trialData);
    } catch (e) {
      print(e.toString());
    }
  }
}
