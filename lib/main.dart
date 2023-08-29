import 'package:flutter/material.dart';
import 'package:qr_scanner/qr_scanner_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.deepPurple,
          titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const QrScannerView(),
    );
  }
}

