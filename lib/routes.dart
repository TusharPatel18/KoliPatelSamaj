import 'package:flutter/material.dart';
import 'package:kolisamaj/main.dart';

import './screens/login/Login.dart';
import './screens/Register/Register.dart';
import './screens/home/home.dart';

final routes = {
  '/': (BuildContext context) => new SplashScreen(),
  '/loginScreen': (BuildContext context) => new loginScreen(),
  '/registrationScreen': (BuildContext context) => new RegistrationScreen(),
  '/HomeScreen': (BuildContext context) => new HomeScreen(),
};
