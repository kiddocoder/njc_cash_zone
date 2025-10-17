import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'features/agencies/agencies_maps.dart';
import 'core/theme/app_theme.dart';
import 'features/loans/loan_details.dart';
import 'features/main_layout.dart';
import 'features/notifications/notifications_screen.dart';
// import 'splash_screen.dart';
import 'features/loans/loan_request/loan_request_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  WidgetsFlutterBinding.ensureInitialized();

  // Android init settings
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // Combine for all platforms
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  // Initialize
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (response) {
      debugPrint("Notification tapped: ${response.payload}");
    },
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NJC Cash Zone',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: AppTheme.themeMode,
      home: const AgenciesMapScreen(),
      routes: {
        '/main': (context) => const MainLayout(),
        '/loans-details': (context) => const LoanDetailsScreen(),
        '/loan-request': (context) => LoanRequestScreen(
          agency: Agency(
            name: 'Agency Johannesburg Central',
            address: '123 Commissioner Street, Johannesburg CBD',
            distance: '2.1 km away',
            status: 'Open Now (closes 17:00)',
            rating: 4.0,
            lat: -26.2041,
            lng: 28.0473,
          ),
        ),
        '/notifications': (context) => const NotificationsScreen(),
      },
    );
  }
}
