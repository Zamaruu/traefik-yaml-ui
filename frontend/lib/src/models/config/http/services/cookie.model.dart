class Cookie {
  String? name;
  bool? secure;
  bool? httpOnly;
  String? sameSite;

  Cookie({ this.name, this.secure, this.httpOnly, this.sameSite });

  factory Cookie.fromJson(Map<String, dynamic> json) => Cookie(
    name: json['name'] as String?,
    secure: json['secure'] as bool?,
    httpOnly: json['httpOnly'] as bool?,
    sameSite: json['sameSite'] as String?,
  );

  Map<String, dynamic> toJson() {
    final m = <String, dynamic>{};
    if (name != null) m['name'] = name;
    if (secure != null) m['secure'] = secure;
    if (httpOnly != null) m['httpOnly'] = httpOnly;
    if (sameSite != null) m['sameSite'] = sameSite;
    return m;
  }
}
