import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/app/data/SubjectData.dart';
import 'package:quiz/constant/strings.dart';

int createUniqueId([int? milliseconds]) {
  milliseconds = milliseconds ?? DateTime.now().millisecondsSinceEpoch;
  return milliseconds.remainder(100000);
}

class NotificationUtils {
  static void sendNotification({required SubjectData subjectList}) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      // This is just a basic example. For real apps, you must show some
      // friendly dialog box before call the request method.
      // This is very important to not harm the user experience
      AwesomeNotifications().requestPermissionToSendNotifications();
    } else {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          // id: createUniqueId(),
          id: createUniqueId(subjectList.timeInMilliseconds),
          channelKey: kChannelKey,
          title: "Remember Your ${subjectList.testName} exam",
          body: "Check your exam time",
          icon: 'resource://drawable/app_icon',
          backgroundColor: Colors.amber,

        ),
        schedule: NotificationCalendar.fromDate(
          preciseAlarm: true,
          allowWhileIdle: true,
          date: DateTime.fromMillisecondsSinceEpoch(
              subjectList.timeInMilliseconds),
        ),
      );
    }
  }
}
