import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppNotifier with ChangeNotifier {
  AppNotifier(BuildContext context) {
//    init(context);
  }

  BuildContext _context;

  BuildContext get context => _context;

  set context(BuildContext value) {
    _context = value;
  }
}
