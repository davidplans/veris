import 'package:Veris/core/user/user.dart';
import 'package:Veris/features/authentication/bloc/auth_bloc.dart';
import 'package:Veris/features/pat/practice/base_practice_widget.dart';
import 'package:Veris/features/pat/services/firebase_service.dart';
import 'package:Veris/features/pat/view/body_select_page.dart';
import 'package:Veris/features/pat/view/finish_page.dart';
import 'package:Veris/features/pat/view/trial_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfidenceSliderPage extends StatefulWidget {
  final int practiceTrialNumber;
  const ConfidenceSliderPage({super.key, this.practiceTrialNumber = 0});
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
  late UserModel user;
  late final _prefs;
  int _completeTrials = 0;
  List<int> listSelectSteps = [];
  int _currentStep = 1;
  int _configMaxTrials = 20;
  int _configStepBodySelect = 5;
  int _currentTrialNumber = 0;

  @override
  void initState() {
    super.initState();
    _getTrialConfig();
  }

  _getTrialConfig() async {
    _prefs = await SharedPreferences.getInstance();
    if (widget.practiceTrialNumber != 0) return;

    listSelectSteps.add(_currentStep);
    _calculateStep(_configMaxTrials, _configStepBodySelect);
    _completeTrials = await _prefs.getInt('completeTrials') ?? 0;
    _configMaxTrials = await _prefs.getInt('maxTrials') ?? 20;
    _configStepBodySelect = await _prefs.getInt('stepBodySelect') ?? 5;
    _currentTrialNumber = await _getCurrentTrialNumber(_completeTrials);
    setState(() {});
  }

  _changeSlider(double value) {
    setState(() {
      _currentSliderValue = value;
    });
  }

  _calculateStep(int total, int range) {
    while (total >= _currentStep) {
      _currentStep += range;
      if (_currentStep <= total) {
        listSelectSteps.add(_currentStep);
      }
    }
  }

  Future<int> _getCurrentTrialNumber(int completeTrials) async {
    completeTrials++;
    return completeTrials;
  }

  @override
  Widget build(BuildContext context) {
    user = context.select((AuthBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.practiceTrialNumber == 0
              ? 'Veris TRIAL $_currentTrialNumber - CONFIDENCE'
              : 'Veris - PRACTICE TRIAL ${widget.practiceTrialNumber}'),
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
                  FirebaseService.saveDataToFirebase(user, _currentSliderValue);
                  if (_configMaxTrials == _currentTrialNumber) {
                    _prefs.remove('completeTrials');
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
                  } else if (widget.practiceTrialNumber == 0 ||
                      widget.practiceTrialNumber == 2) {
                    (listSelectSteps.contains(_completeTrials))
                        ? Navigator.of(context)
                            .push<void>(BodySelectPage.route())
                        : Navigator.of(context).push<void>(
                            TrialPage.route(),
                          );
                    _prefs.remove('practiceTrialNumber');
                    if (widget.practiceTrialNumber == 2) return;
                    _completeTrials++;
                    await _prefs.setInt('completeTrials', _completeTrials);
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PracticeWidget(),
                      ),
                    );
                  }
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
              const Row(
                children: [
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
