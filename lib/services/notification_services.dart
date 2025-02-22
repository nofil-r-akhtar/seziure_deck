import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
    const AndroidInitializationSettings('slogo');

    var initializationSetting = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await notificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
            'channelId', 'channelName', importance: Importance.max,
        icon: 'slogo')
    );
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }

  Future<void> showOngoingNotification({
    int id = 1,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    const NotificationDetails ongoingNotificationDetails =
    NotificationDetails(
      android: AndroidNotificationDetails(
        'ongoingChannelId',
        'ongoingChannelName',
        importance: Importance.max,
        ongoing: true,
        icon: 'slogo',
      ),
    );

    return notificationsPlugin.show(
      id,
      title,
      body,
      ongoingNotificationDetails,
    );
  }

}

