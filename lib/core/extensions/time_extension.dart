import 'package:easy_localization/easy_localization.dart';

extension DateTimeSince on DateTime {
  String get formattedDate => DateFormat('dd/MM/yyyy', 'en').format(this);
  String get formattedDateAndTime => DateFormat('dd-MM-yyyy - HH:mm', 'en').format(this);
  String get formattedTime => DateFormat('hh:mm a', 'en').format(this);

  String get asId => DateFormat('ddMMyy', 'en').format(this);

  String since() {
    final now = DateTime.now();
    final difference = now.difference(this).abs();

    final hours = difference.inHours;
    final remainingMinutes = difference.inMinutes % 60;

    if (hours > 0) {
      if (remainingMinutes > 0) {
        return '${hours.toString().padLeft(2, '0')}:${remainingMinutes.toString().padLeft(2, '0')}';
      } else {
        return '${hours.toString().padLeft(2, '0')}:00';
      }
    } else if (remainingMinutes > 0) {
      return '00:${remainingMinutes.toString().padLeft(2, '0')}';
    } else {
      return '00:00';
    }
  }

  DateTime get onlyDay => copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);

  String get weekdayName => switch (weekday) {
        1 => 'monday',
        2 => 'tuesday',
        3 => 'wednesday',
        4 => 'thursday',
        5 => 'friday',
        6 => 'saturday',
        7 => 'sunday',
        _ => 'error',
      };
}

extension DurationExt on Duration {
  String get _hours => _twoDigits(inHours).toString();
  String get _minutes => _twoDigits(inMinutes.remainder(60).abs()).toString();
  String get _seconds => _twoDigits(inSeconds.remainder(60).abs()).toString();

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  String formatWithSeconds() => '$_hours:$_minutes:$_seconds';
  String formatWithMinutes() => '$_hours:$_minutes';

  Duration clampSeconds(int lowerLimit, int upperLimit) {
    final clampedSeconds = inSeconds.clamp(lowerLimit, upperLimit).toInt();
    return Duration(seconds: clampedSeconds);
  }
}
