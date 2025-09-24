import 'package:frontend/src/models/config/http/services/cookie.model.dart';

class Sticky {
  Cookie? cookie;

  Sticky({ this.cookie });

  factory Sticky.fromJson(Map<String, dynamic> json) => Sticky(
    cookie: json['cookie'] != null ? Cookie.fromJson(json['cookie'] as Map<String, dynamic>) : null,
  );

  Map<String, dynamic> toJson() {
    final m = <String, dynamic>{};
    if (cookie != null) m['cookie'] = cookie!.toJson();
    return m;
  }
}
