import 'dart:convert';
import 'dart:io';

import 'package:Veris/app.dart';
import 'package:Veris/core/user/auth_repository.dart';
import 'package:Veris/core/utils/notification_service.dart';
import 'package:Veris/features/home/view/partials/module_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomeWidget());

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late final NotificationService notificationService;

  List<dynamic> _modules = [];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _bannerUrl = '';

  bool _notificationsEnabled = false;

  @override
  initState() {
    getFile();

    notificationService = NotificationService();
    notificationService.setupLocalNotifications();
    notificationService.configureDidReceiveLocalNotificationSubject(context);
    notificationService.zonedScheduleNotification();
    _isAndroidPermissionGranted();
    _requestPermissions();
    _configureSelectNotificationSubject();

    super.initState();
  }

  Future<void> getFile() async {
    _prefs.then((SharedPreferences p) {
      Map parsedJson = jsonDecode(p.getString('json_file') ?? '');
      Map<String, dynamic> prop = parsedJson['properties'];

      p.setString('study_name', prop['study_name']);
      p.setString('study_id', prop['study_id']);
      p.setString('created_by', prop['created_by']);
      p.setString('instructions', prop['instructions']);
      p.setString('empty_msg', prop['empty_msg']);
      p.setString('support_url', prop['support_url']);
      p.setString('support_email', prop['support_email']);
      p.setString('ethics', prop['ethics']);
      p.setString('pls', prop['pls']);

      setState(() {
        _modules = List.from((parsedJson['modules']));
        _bannerUrl = prop['banner_url'] ?? '';
      });
    });
  }

  void startWithNewStudyProtocol(BuildContext context) {
    final authenticationRepository = AuthenticationRepository();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HealthApp(
          authenticationRepository: authenticationRepository,
        ),
      ),
    );
  }

  Future<void> _isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;

      setState(() {
        _notificationsEnabled = granted;
      });
    }
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? granted = await androidImplementation?.requestPermission();
      setState(() {
        _notificationsEnabled = granted ?? false;
      });
    }
  }

  void _configureSelectNotificationSubject() {
    selectNotificationStream.stream.listen((String? payload) async {
      // TODO: implement routing to current module and section
      // await Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const StartPatPage()),
      // );
    });
  }

  @override
  void dispose() {
    didReceiveLocalNotificationStream.close();
    selectNotificationStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _bannerUrl != "" ? Image.network(_bannerUrl) : Container(),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: const Color.fromARGB(255, 49, 56, 71),
              child: Row(children: [
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () {
                          startWithNewStudyProtocol(context);
                        },
                        child: const Text('Use other JSON')))
              ])),
          Expanded(
            flex: 4,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _modules.length,
                itemBuilder: (BuildContext context, int indexModule) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ModuleWidget(
                        module: _modules[indexModule],
                        indexModule: indexModule,
                        prefs: _prefs),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
