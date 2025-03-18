import 'package:flutter/material.dart';

import '../theme/text_styles.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb



class DeviceType {
  // Check if the app is running on mobile
  static bool isMobile(BuildContext context) {
    return  MediaQuery.of(context).size.shortestSide < 600;
  }

  // Check if the app is running on tablet
  static bool isTablet(BuildContext context) {
    return
        MediaQuery.of(context).size.shortestSide >= 600 &&
        MediaQuery.of(context).size.shortestSide < 900;
  }

  // Check if the app is running on desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide >= 900;
  }
}