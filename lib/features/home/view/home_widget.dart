import 'dart:io';

import 'package:Veris/common/widgets/ui_components/colored_badge_container.dart';
import 'package:Veris/core/utils/notification_service.dart';
import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/home/view/partials/module_widget.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late final NotificationService notificationService;

  List<ModuleForHomePage> _modules = [];
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

      final bool? granted =
          await androidImplementation?.requestNotificationsPermission();
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
    return Stack(
      children: <Widget>[
        // _bannerUrl != "" ? Image.network(_bannerUrl) : Container(),
        SvgPicture.asset(
          'assets/images/blue_circles.svg',
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 330.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('Tests'),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 1.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const Text('Pat Test'),
                              const SizedBox(
                                width: 8.0,
                              ),
                              const ColoredBadgeContainer(
                                containerColor:
                                    ColorConstants.badgeBackgroundGreenColor,
                                containerTextColor:
                                    ColorConstants.badgeTextGreenColor,
                                containerText: '1/1 today',
                              ),
                              const Spacer(),
                              SvgPicture.asset('assets/icons/arrow-forward.svg')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('Questionnaires '),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 1.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const Text('About You'),
                              const SizedBox(
                                width: 8.0,
                              ),
                              const ColoredBadgeContainer(
                                containerColor:
                                    ColorConstants.badgeBackgroundOrangeColor,
                                containerTextColor:
                                    ColorConstants.badgeTextOrangeColor,
                                containerText: '0/1 today',
                              ),
                              const Spacer(),
                              SvgPicture.asset('assets/icons/arrow-forward.svg')
                            ],
                          ),
                        ),
                        const Divider(
                          height: 1.0,
                        ),
                        Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Text('Questionnaire 1 '),
                            const Spacer(),
                            SvgPicture.asset('assets/icons/arrow-forward.svg')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                        SizedBox(
            height: 150,
            child: ListView.builder(
                itemCount: _modules.length,
                itemBuilder: (BuildContext context, int indexModule) {
                  final module = _modules[indexModule];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: ModuleWidget(
                      module: module,
                    ),
                  );
                }),
                    ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
