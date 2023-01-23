import 'package:flutter/services.dart';

class SystemOverlayService {
  static final SystemOverlayService instance = SystemOverlayService._internal();

  factory SystemOverlayService() {
    return instance;
  }

  SystemOverlayService._internal();

  Future<void> hideStatusBar() async =>
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.bottom]);

  Future<void> statusBarTransparent() async =>
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

  Future<void> showStatusBar() async =>
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
}
