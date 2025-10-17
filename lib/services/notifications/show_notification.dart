import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> showPaymentNotification() async {
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'payment_channel', // Unique channel ID
    'Payments', // Channel name
    channelDescription: 'Payment notifications',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    playSound: true,
    color: Colors.green,
    styleInformation: BigTextStyleInformation(''), // expands long text
  );

  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidDetails,
  );

  await FlutterLocalNotificationsPlugin().show(
    1,
    'Payment Successful 💰',
    'Loan #8347 has been paid successfully. Your balance has been updated.',
    notificationDetails,
    payload: 'payment_success',
  );
}
