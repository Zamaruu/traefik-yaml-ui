import 'package:json_annotation/json_annotation.dart';

/// Konvertiert [StackTrace] <-> [String] für JSON-Serialisierung
class StackTraceConverter implements JsonConverter<StackTrace?, String?> {
  const StackTraceConverter();

  @override
  StackTrace? fromJson(String? json) {
    if (json == null) return null;
    // Einfacher Wrapper, StackTrace.fromString() gibt seit Dart 3 ein richtiges Objekt zurück
    return StackTrace.fromString(json);
  }

  @override
  String? toJson(StackTrace? object) {
    return object?.toString();
  }
}
