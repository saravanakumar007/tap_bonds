import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tap_bonds/app.dart';
import 'package:tap_bonds/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const App());
}
