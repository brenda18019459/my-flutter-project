import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';

import 'app/modules/home/controllers/notification_Service.dart';
import 'app/routes/app_pages.dart';
import 'constant/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initLocalNotifications();
  // NotificationService().initNotification();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

void initLocalNotifications() {
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
          channelGroupKey: 'Quiz_Group',
          channelKey: kChannelKey,
          channelName: 'Alerts',
          channelDescription: 'Notification channel for quiz alerts',
          // defaultColor: Color(0xFF9D50DD),
          // ledColor: Colors.white,
        )
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: kDebugMode);

  AwesomeNotifications()
      .actionStream
      .listen((ReceivedNotification receivedNotification) {
    print('Received local notification ${receivedNotification.title}');
    // Navigator.of(context).pushNamed('/NotificationPage', arguments: {
    //   // your page params. I recommend you to pass the
    //   // entire *receivedNotification* object
    //   id: receivedNotification.id
    // });
  });
}
