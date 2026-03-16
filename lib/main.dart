import 'package:flutter/material.dart';
import 'package:aashirwad/bootstrap.dart';
import 'package:aashirwad/aashirwad_app.dart';

Future<void> mainApp() async =>
    bootstrap(() => runApp(const AashirwadApp()));

void main() => mainApp();
