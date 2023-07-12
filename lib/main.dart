import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pic_connect/di/service_locator.dart';
import 'package:pic_connect/features/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "",
          appId: "",
          messagingSenderId: "",
          projectId: "",
          storageBucket: ""
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  await setupServiceLocator();
  runApp(const MainApp());
}