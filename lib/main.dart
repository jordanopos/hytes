import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hytes_edition/app.dart';
import 'package:hytes_edition/src/services/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await sharedPrefs.init();
  runApp(MyApp());
}
