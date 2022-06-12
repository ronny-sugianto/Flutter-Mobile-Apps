import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'launch_url_service.dart';

abstract class BaseLaunchUrlService {
  Future<bool> open(String url);

  Future<void> openWhatsApp(
    String phone, {
    String? message,
    Function? onError,
  });
}
