import 'package:flutter/material.dart';
import 'package:flutterbase/app/bootstrap/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppWidget());
}
