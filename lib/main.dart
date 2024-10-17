import 'package:bitsgap_test_app/app.dart';
import 'package:flutter/material.dart';

import 'service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.configureDependencies();

  runApp(const MyApp());
}
