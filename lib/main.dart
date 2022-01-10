import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa_internship/app/app.dart';
import 'package:msa_internship/app/di.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
