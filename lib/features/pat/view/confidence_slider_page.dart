import 'package:Veris/core/user/user.dart';
import 'package:Veris/features/authentication/bloc/auth_bloc.dart';
import 'package:Veris/features/pat/view/finish_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'trial_page.dart';

class ConfidenceSliderPage extends StatefulWidget {
  const ConfidenceSliderPage({super.key});
  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const ConfidenceSliderPage());
  }

  @override
  State<ConfidenceSliderPage> createState() => _ConfidenceSliderPageState();
}

class _ConfidenceSliderPageState extends State<ConfidenceSliderPage> {
  double _currentSliderValue = 5;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late User user;
  late String currentModuleResultId;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int _completeTrials = 0;
  late String studyId;

  @override
  void initState() {
    super.initState();
    _prefs.then((SharedPreferences p) {
      _completeTrials = p.getInt('completeTrials') ?? 0;
      currentModuleResultId = p.getString('currentModuleResultId') ?? '';
      _completeTrials++;
      studyId = p.getString('studyId') ?? "";
      setState(() {});
    });
    // _playBeep(_currentValue);
  }

  _changeSlider(double value) {
    setState(() {
      _currentSliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    user = context.select((AuthBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
          title: Text('Veris TRIAL $_completeTrials - CONFIDENCE'),
          automaticallyImplyLeading: false),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 1,
              child: FloatingActionButton.extended(
                backgroundColor: const Color(0XFF0F2042),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  final maxTrials = prefs.getInt('maxTrials');
                  final selectedBody = prefs.getString('selectedBody');
                  final numRuns = prefs.getInt('numRuns');
                  final knobScales = prefs.getStringList('knobScales');
                  final instantBPMs = prefs.getStringList('instantBPMs');
                  final instantPeriods = prefs.getStringList('instantPeriods');
                  final averagePeriods = prefs.getStringList('averagePeriods');
                  final instantErrs = prefs.getStringList('instantErrs');
                  final currentDelays = prefs.getStringList('currentDelays');
                  prefs.setInt('completeTrials', numRuns ?? 0);
                  DateTime formatDateTrial = DateTime.now();

                  List<double> doubleInstantBPMs = [];
                  if (instantBPMs != null) {
                    doubleInstantBPMs = instantBPMs.map(double.parse).toList();
                  }

                  List<double> doubleInstantPeriods = [];
                  if (instantPeriods != null) {
                    doubleInstantPeriods =
                        instantPeriods.map(double.parse).toList();
                  }

                  List<double> doubleAveragePeriods = [];
                  if (averagePeriods != null) {
                    doubleAveragePeriods =
                        averagePeriods.map(double.parse).toList();
                  }

                  List<double> doubleInstantErrs = [];
                  if (instantErrs != null) {
                    doubleInstantErrs = instantErrs.map(double.parse).toList();
                  }

                  List<double> doubleCurrentDelays = [];
                  if (currentDelays != null) {
                    doubleCurrentDelays =
                        currentDelays.map(double.parse).toList();
                  }

                  List<double> doubleKnobScales = [];
                  if (knobScales != null) {
                    doubleKnobScales = knobScales.map(double.parse).toList();
                  }

                  final trialData = {
                    "numRuns": numRuns,
                    "startTrial": formatDateTrial,
                    "selectedBody": selectedBody,
                    "confidence": _currentSliderValue,
                    "endDate": DateTime.now(),
                    "instantBPMs": doubleInstantBPMs,
                    "recordedHR": doubleAveragePeriods,
                    "knobScales": doubleKnobScales,
                    "currentDelays": doubleCurrentDelays,
                    "instantPeriods": doubleInstantPeriods,
                    "averagePeriods": doubleAveragePeriods,
                    "instantErrs": doubleInstantErrs,
                  };

                  users
                      .doc(user.id)
                      .collection('studies')
                      .doc(currentModuleResultId)
                      .collection('trials')
                      .add(trialData)
                      .then((_) {
                    if (maxTrials == numRuns) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 5),
                          content: Text("Data stored! \n Thank you."),
                        ),
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FinishPage(),
                        ),
                      );
                    } else {
                      Navigator.of(context).push<void>(
                        TrialPage.route(),
                      );
                    }
                  });
                },
                label: const Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "How confident are you that the tone matched you heart-beat?",
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 100.0,
              ),
              Slider(
                value: _currentSliderValue,
                max: 10,
                divisions: 10,
                onChanged: (double value) {
                  _changeSlider(value);
                },
              ),
              Row(
                children: const [
                  Expanded(child: Text("Not at all \nconfident")),
                  Expanded(
                      child: Text(
                    "Extremely \nconfident",
                    textAlign: TextAlign.end,
                  )),
                ],
              )
            ],
          )),
    );
  }
}
