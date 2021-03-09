import 'package:flutter/material.dart';
import 'package:kolisamaj/main.dart';

import './screens/login/Login.dart';
import './screens/login/otp.dart';
import './screens/Register/Register.dart';
import './screens/home/home.dart';
import './screens/Profile/Profile_Screen.dart';
import './screens/members/gridview_user.dart';
import './screens/members/Member_details.dart';
import './screens/Profile/Edit_ProfileScreen.dart';

final routes = {
  '/': (BuildContext context) => new SplashScreen(),
  '/loginScreen': (BuildContext context) => new loginScreen(),
  '/otp': (BuildContext context) => new OTPScreen(),
  '/registrationScreen': (BuildContext context) => new RegistrationScreen(),
  '/HomeScreen': (BuildContext context) => new HomeScreen(),
  '/ProfileScreen': (BuildContext context) => new ProfileScreen(),
  '/UserGridViewScreen': (BuildContext context) => new UserGrideViewScreen(),
  '/MemberdetailsScreen': (BuildContext context) => new MemberDetailsScreen(),
  '/EditProfileScreen': (BuildContext context) => new EditProfileScreen(),
};
