import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:developer' as developer;

class LocalNotificationService{
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {

    //@Todo
    //notification logo for android
    const AndroidInitializationSettings androidInitializationSettings 
                            = AndroidInitializationSettings('');

    DarwinInitializationSettings darwinInitializationSettings 
                            = DarwinInitializationSettings(
                              requestAlertPermission: true,
                              requestBadgePermission: true,
                              requestSoundPermission: true,
                              onDidReceiveLocalNotification: onDidRecieveLocalNotification,
                            );

    final InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings
    );

    await _localNotificationService.initialize(settings);
  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails 
                            = AndroidNotificationDetails('channelId',
                                                         'channelName',
                                                         channelDescription: 'description',
                                                         importance: Importance.max,
                                                         priority: Priority.max,
                                                         playSound: true);

   const DarwinNotificationDetails iosNotificationDetails 
                            = DarwinNotificationDetails();
  
  return const NotificationDetails(android: androidNotificationDetails, iOS: iosNotificationDetails);
  }

  Future<void> showNotifications(
    {
      required int id,
      required String title,
      required String body
    }
  ) async{

    final details = await _notificationDetails();
    
    await _localNotificationService.show(id, title, body, details);

  }

  void onDidRecieveLocalNotification(int id, String? title, String? body, String? payload){
    developer.log("id: $id");
  }
}