import 'package:vibration/vibration.dart';

class Vibrator {
  const Vibrator._();

  static Future<bool> get _willVibrate async => (await Vibration.hasVibrator()) ?? false;

  static errorVibrate() async {
    if (await _willVibrate) Vibration.vibrate(duration: 150);
  }

  static warningVibrate() async {
    if (await _willVibrate) Vibration.vibrate(duration: 150);
  }

  static buttonVibrate() async {
    if (await _willVibrate) Vibration.vibrate(duration: 40);
  }
}
