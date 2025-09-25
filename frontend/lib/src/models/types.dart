// traefik_config.dart

class TraefikConfig {
  final HttpConfig http;

  TraefikConfig({required this.http});

  factory TraefikConfig.fromJson(Map<String, dynamic> json) {
    return TraefikConfig(
      http: HttpConfig.fromJson(json['http']),
    );
  }
}

class HttpConfig {
  final Map<String, Middleware>? middlewares;
  final Map<String, ServersTransport>? serversTransports;
  final Map<String, Service>? services;
  final Map<String, Router>? routers;

  HttpConfig({
    this.middlewares,
    this.serversTransports,
    this.services,
    this.routers,
  });

  factory HttpConfig.fromJson(Map<String, dynamic> json) {
    return HttpConfig(
      middlewares: (json['middlewares'] as Map?)?.map(
            (k, v) => MapEntry(k as String, Middleware.fromJson(v)),
      ),
      serversTransports: (json['serversTransports'] as Map?)?.map(
            (k, v) => MapEntry(k as String, ServersTransport.fromJson(v)),
      ),
      services: (json['services'] as Map?)?.map(
            (k, v) => MapEntry(k as String, Service.fromJson(v)),
      ),
      routers: (json['routers'] as Map?)?.map(
            (k, v) => MapEntry(k as String, Router.fromJson(v)),
      ),
    );
  }
}

class Middleware {
  final List<String>? sourceRange;
  final String? address;
  final bool? trustForwardHeader;

  Middleware({this.sourceRange, this.address, this.trustForwardHeader});

  factory Middleware.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('ipAllowList')) {
      return Middleware(
        sourceRange:
        (json['ipAllowList']['sourceRange'] as List).cast<String>(),
      );
    } else if (json.containsKey('forwardauth')) {
      return Middleware(
        address: json['forwardauth']['address'],
        trustForwardHeader: json['forwardauth']['trustForwardHeader'],
      );
    }
    return Middleware();
  }
}

class ServersTransport {
  final bool? insecureSkipVerify;

  ServersTransport({this.insecureSkipVerify});

  factory ServersTransport.fromJson(Map<String, dynamic> json) {
    return ServersTransport(
      insecureSkipVerify: json['insecureSkipVerify'],
    );
  }
}

class Service {
  final List<Server> servers;
  final String? serversTransport;

  Service({required this.servers, this.serversTransport});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      servers: (json['loadBalancer']['servers'] as List)
          .map((s) => Server.fromJson(s))
          .toList(),
      serversTransport: json['loadBalancer']['serversTransport'],
    );
  }
}

class Server {
  final String url;

  Server({required this.url});

  factory Server.fromJson(Map<String, dynamic> json) {
    return Server(url: json['url']);
  }
}

class Router {
  final String rule;
  final String service;
  final List<String> entryPoints;
  final List<String>? middlewares;
  final String? certresolver;

  Router({
    required this.rule,
    required this.service,
    required this.entryPoints,
    this.middlewares,
    this.certresolver,
  });

  factory Router.fromJson(Map<String, dynamic> json) {
    return Router(
      rule: json['rule'],
      service: json['service'],
      entryPoints: (json['entryPoints'] as List).cast<String>(),
      middlewares:
      (json['middlewares'] as List?)?.map((e) => e.toString()).toList(),
      certresolver: json['tls']?['certresolver'],
    );
  }
}
