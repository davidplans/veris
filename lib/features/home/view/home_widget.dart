import 'dart:io';

import 'package:Veris/core/utils/notification_service.dart';
import 'package:Veris/core/utils/study_protocol_helper.dart';
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

  List<ModuleForHomePage> _modules = [];
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final studyProtocolHelper = StudyProtocolHelper();
  String _bannerUrl = '';

  bool _notificationsEnabled = false;

  @override
  initState() {
    getModules();

    notificationService = NotificationService();
    notificationService.setupLocalNotifications();
    notificationService.configureDidReceiveLocalNotificationSubject(context);
    _isAndroidPermissionGranted();
    _requestPermissions();
    _configureSelectNotificationSubject();

    super.initState();
  }

  Future<void> getModules() async {
    final prefs = await SharedPreferences.getInstance();

    final modules =
        await studyProtocolHelper.getAllAvailableModulesWithSections();

    setState(() {
      _modules = modules;
      _bannerUrl = prefs.getString('banner_url') ?? '';
    });
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

      final bool? granted = await androidImplementation?.requestNotificationsPermission();
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
          Expanded(
            flex: 4,
            child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: _modules.length,
                itemBuilder: (BuildContext context, int indexModule) {
                  final module = _modules[indexModule];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ModuleWidget(
                      module: module,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
