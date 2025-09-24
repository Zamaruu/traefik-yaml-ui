class Server {
  String url;
  int? weight;

  Server({ required this.url, this.weight });

  factory Server.fromJson(Map<String, dynamic> json) => Server(
    url: json['url'] as String,
    weight: json['weight'] as int?,
  );

  Map<String, dynamic> toJson() {
    final m = <String, dynamic>{ 'url': url };
    if (weight != null) m['weight'] = weight;
    return m;
  }
}
