
import '../../Export/export_dev.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const String currency = "\$";

// void main() => runApp(
//   DevicePreview(
//     enabled: !kReleaseMode,
//     builder: (context) => const MyApp(), // Wrap your app
//   ),//
// );
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides(); // Set up HTTP overrides
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Enable DevicePreview in non-release mode
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavouriteItems()),
        ChangeNotifierProvider(create: (_) => DataProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => CheckOutProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: const AppBarTheme(color: AppColor.primaryColor),
          iconTheme: const IconThemeData(color: AppColor.bgColor),
          useMaterial3: true,
        ),
        // home: const BottomNavigation(),
        home: const SignUpScreen(),
      ),
    );
  }
}
