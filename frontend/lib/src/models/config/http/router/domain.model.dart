class Domain {
  String main;
  List<String>? sans;

  Domain({ required this.main, this.sans });

  factory Domain.fromJson(Map<String, dynamic> json) => Domain(
    main: json['main'] as String,
    sans: (json['sans'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );

  Map<String, dynamic> toJson() {
    final m = <String, dynamic>{ 'main': main };
    if (sans != null) m['sans'] = sans;
    return m;
  }
}
