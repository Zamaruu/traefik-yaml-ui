class Observability {
  bool? accessLogs;
  bool? metrics;
  bool? tracing;

  Observability({ this.accessLogs, this.metrics, this.tracing });

  factory Observability.fromJson(Map<String, dynamic> json) => Observability(
    accessLogs: json['accessLogs'] as bool?,
    metrics: json['metrics'] as bool?,
    tracing: json['tracing'] as bool?,
  );

  Map<String, dynamic> toJson() {
    final m = <String, dynamic>{};
    if (accessLogs != null) m['accessLogs'] = accessLogs;
    if (metrics != null) m['metrics'] = metrics;
    if (tracing != null) m['tracing'] = tracing;
    return m;
  }
}
