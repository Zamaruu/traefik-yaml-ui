import 'package:json_annotation/json_annotation.dart';

/// Converter to handle duration strings like "30s" <-> Duration(seconds: 30)
class DurationConverter implements JsonConverter<Duration?, String?> {
  const DurationConverter();

  @override
  Duration? fromJson(String? json) {
    if (json == null) return null;
    final regex = RegExp(r'^(\d+)([smh])$');
    final match = regex.firstMatch(json);
    if (match == null) return null;
    final value = int.parse(match.group(1)!);
    final unit = match.group(2);
    switch (unit) {
      case 's':
        return Duration(seconds: value);
      case 'm':
        return Duration(minutes: value);
      case 'h':
        return Duration(hours: value);
      default:
        return null;
    }
  }

  @override
  String? toJson(Duration? object) {
    if (object == null) return null;
    if (object.inSeconds % 60 == 0 && object.inMinutes < 60) {
      return '${object.inMinutes}m';
    } else if (object.inMinutes % 60 == 0 && object.inHours < 24) {
      return '${object.inHours}h';
    } else {
      return '${object.inSeconds}s';
    }
  }
}
