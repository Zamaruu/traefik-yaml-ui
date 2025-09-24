





// Middlewares in Dart


class HTTPMiddleware {
  // Primitive Werte / einfache Listen
  String? addPrefix;
  String? addSuffix;
  List<String>? stripPrefix;
  List<String>? stripPrefixRegex;
  String? replacePath;
  List<String>? basicAuthUsers;
  List<String>? digestAuthUsers;
  List<String>? ipWhiteList;
  List<String>? chain;

  // Komplexere Objekte
  ReplacePathRegex? replacePathRegex;
  RedirectScheme? redirectScheme;
  RedirectRegex? redirectRegex;
  HeadersMiddleware? headers;
  ForwardAuthMiddleware? forwardAuth;
  CompressMiddleware? compress;
  BufferingMiddleware? buffering;
  RateLimitMiddleware? rateLimit;
  CircuitBreakerMiddleware? circuitBreaker;
  RetryMiddleware? retry;
  ErrorsMiddleware? errors;

  HTTPMiddleware({
    this.addPrefix,
    this.addSuffix,
    this.stripPrefix,
    this.stripPrefixRegex,
    this.replacePath,
    this.basicAuthUsers,
    this.digestAuthUsers,
    this.ipWhiteList,
    this.chain,
    this.replacePathRegex,
    this.redirectScheme,
    this.redirectRegex,
    this.headers,
    this.forwardAuth,
    this.compress,
    this.buffering,
    this.rateLimit,
    this.circuitBreaker,
    this.retry,
    this.errors,
  });

  factory HTTPMiddleware.fromJson(Map<String, dynamic> json) {
    return HTTPMiddleware(
      addPrefix: json['addPrefix'],
      addSuffix: json['addSuffix'],
      stripPrefix: (json['stripPrefix'] as List?)?.cast<String>(),
      stripPrefixRegex: (json['stripPrefixRegex'] as List?)?.cast<String>(),
      replacePath: json['replacePath'],
      basicAuthUsers: (json['basicAuthUsers'] as List?)?.cast<String>(),
      digestAuthUsers: (json['digestAuthUsers'] as List?)?.cast<String>(),
      ipWhiteList: (json['ipWhiteList'] as List?)?.cast<String>(),
      chain: (json['chain'] as List?)?.cast<String>(),
      replacePathRegex: json['replacePathRegex'] != null
          ? ReplacePathRegex.fromJson(json['replacePathRegex'])
          : null,
      redirectScheme: json['redirectScheme'] != null
          ? RedirectScheme.fromJson(json['redirectScheme'])
          : null,
      redirectRegex: json['redirectRegex'] != null
          ? RedirectRegex.fromJson(json['redirectRegex'])
          : null,
      headers: json['headers'] != null
          ? HeadersMiddleware.fromJson(json['headers'])
          : null,
      forwardAuth: json['forwardAuth'] != null
          ? ForwardAuthMiddleware.fromJson(json['forwardAuth'])
          : null,
      compress: json['compress'] != null
          ? CompressMiddleware.fromJson(json['compress'])
          : null,
      buffering: json['buffering'] != null
          ? BufferingMiddleware.fromJson(json['buffering'])
          : null,
      rateLimit: json['rateLimit'] != null
          ? RateLimitMiddleware.fromJson(json['rateLimit'])
          : null,
      circuitBreaker: json['circuitBreaker'] != null
          ? CircuitBreakerMiddleware.fromJson(json['circuitBreaker'])
          : null,
      retry: json['retry'] != null
          ? RetryMiddleware.fromJson(json['retry'])
          : null,
      errors: json['errors'] != null
          ? ErrorsMiddleware.fromJson(json['errors'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (addPrefix != null) 'addPrefix': addPrefix,
      if (addSuffix != null) 'addSuffix': addSuffix,
      if (stripPrefix != null) 'stripPrefix': stripPrefix,
      if (stripPrefixRegex != null) 'stripPrefixRegex': stripPrefixRegex,
      if (replacePath != null) 'replacePath': replacePath,
      if (basicAuthUsers != null) 'basicAuthUsers': basicAuthUsers,
      if (digestAuthUsers != null) 'digestAuthUsers': digestAuthUsers,
      if (ipWhiteList != null) 'ipWhiteList': ipWhiteList,
      if (chain != null) 'chain': chain,
      if (replacePathRegex != null) 'replacePathRegex': replacePathRegex!.toJson(),
      if (redirectScheme != null) 'redirectScheme': redirectScheme!.toJson(),
      if (redirectRegex != null) 'redirectRegex': redirectRegex!.toJson(),
      if (headers != null) 'headers': headers!.toJson(),
      if (forwardAuth != null) 'forwardAuth': forwardAuth!.toJson(),
      if (compress != null) 'compress': compress!.toJson(),
      if (buffering != null) 'buffering': buffering!.toJson(),
      if (rateLimit != null) 'rateLimit': rateLimit!.toJson(),
      if (circuitBreaker != null) 'circuitBreaker': circuitBreaker!.toJson(),
      if (retry != null) 'retry': retry!.toJson(),
      if (errors != null) 'errors': errors!.toJson(),
    };
  }
}

class ReplacePathRegex {
  final String regex;
  final String replacement;

  ReplacePathRegex({required this.regex, required this.replacement});

  factory ReplacePathRegex.fromJson(Map<String, dynamic> json) =>
      ReplacePathRegex(
        regex: json['regex'],
        replacement: json['replacement'],
      );

  Map<String, dynamic> toJson() => {
    'regex': regex,
    'replacement': replacement,
  };
}

class RedirectScheme {
  final String scheme;
  final String? port;
  final bool? permanent;

  RedirectScheme({required this.scheme, this.port, this.permanent});

  factory RedirectScheme.fromJson(Map<String, dynamic> json) => RedirectScheme(
    scheme: json['scheme'],
    port: json['port'],
    permanent: json['permanent'],
  );

  Map<String, dynamic> toJson() => {
    'scheme': scheme,
    if (port != null) 'port': port,
    if (permanent != null) 'permanent': permanent,
  };
}

class RedirectRegex {
  final String regex;
  final String replacement;
  final bool? permanent;

  RedirectRegex({
    required this.regex,
    required this.replacement,
    this.permanent,
  });

  factory RedirectRegex.fromJson(Map<String, dynamic> json) => RedirectRegex(
    regex: json['regex'],
    replacement: json['replacement'],
    permanent: json['permanent'],
  );

  Map<String, dynamic> toJson() => {
    'regex': regex,
    'replacement': replacement,
    if (permanent != null) 'permanent': permanent,
  };
}

class HeadersMiddleware {
  final Map<String, String>? customRequestHeaders;
  final Map<String, String>? customResponseHeaders;
  final bool? frameDeny;
  final bool? contentTypeNosniff;
  final bool? browserXSSFilter;
  final bool? sslRedirect;
  final int? stsSeconds;
  final bool? stsIncludeSubdomains;
  final bool? stsPreload;

  HeadersMiddleware({
    this.customRequestHeaders,
    this.customResponseHeaders,
    this.frameDeny,
    this.contentTypeNosniff,
    this.browserXSSFilter,
    this.sslRedirect,
    this.stsSeconds,
    this.stsIncludeSubdomains,
    this.stsPreload,
  });

  factory HeadersMiddleware.fromJson(Map<String, dynamic> json) =>
      HeadersMiddleware(
        customRequestHeaders:
        (json['customRequestHeaders'] as Map?)?.cast<String, String>(),
        customResponseHeaders:
        (json['customResponseHeaders'] as Map?)?.cast<String, String>(),
        frameDeny: json['frameDeny'],
        contentTypeNosniff: json['contentTypeNosniff'],
        browserXSSFilter: json['browserXSSFilter'],
        sslRedirect: json['sslRedirect'],
        stsSeconds: json['stsSeconds'],
        stsIncludeSubdomains: json['stsIncludeSubdomains'],
        stsPreload: json['stsPreload'],
      );

  Map<String, dynamic> toJson() => {
    if (customRequestHeaders != null)
      'customRequestHeaders': customRequestHeaders,
    if (customResponseHeaders != null)
      'customResponseHeaders': customResponseHeaders,
    if (frameDeny != null) 'frameDeny': frameDeny,
    if (contentTypeNosniff != null) 'contentTypeNosniff': contentTypeNosniff,
    if (browserXSSFilter != null) 'browserXSSFilter': browserXSSFilter,
    if (sslRedirect != null) 'sslRedirect': sslRedirect,
    if (stsSeconds != null) 'stsSeconds': stsSeconds,
    if (stsIncludeSubdomains != null)
      'stsIncludeSubdomains': stsIncludeSubdomains,
    if (stsPreload != null) 'stsPreload': stsPreload,
  };
}

class ForwardAuthMiddleware {
  final String address;
  final bool? trustForwardHeader;
  final List<String>? authResponseHeaders;

  ForwardAuthMiddleware({
    required this.address,
    this.trustForwardHeader,
    this.authResponseHeaders,
  });

  factory ForwardAuthMiddleware.fromJson(Map<String, dynamic> json) =>
      ForwardAuthMiddleware(
        address: json['address'],
        trustForwardHeader: json['trustForwardHeader'],
        authResponseHeaders:
        (json['authResponseHeaders'] as List?)?.cast<String>(),
      );

  Map<String, dynamic> toJson() => {
    'address': address,
    if (trustForwardHeader != null) 'trustForwardHeader': trustForwardHeader,
    if (authResponseHeaders != null)
      'authResponseHeaders': authResponseHeaders,
  };
}

class CompressMiddleware {
  final int? minResponseBodyBytes;
  final List<String>? excludedContentTypes;

  CompressMiddleware({this.minResponseBodyBytes, this.excludedContentTypes});

  factory CompressMiddleware.fromJson(Map<String, dynamic> json) =>
      CompressMiddleware(
        minResponseBodyBytes: json['minResponseBodyBytes'],
        excludedContentTypes:
        (json['excludedContentTypes'] as List?)?.cast<String>(),
      );

  Map<String, dynamic> toJson() => {
    if (minResponseBodyBytes != null)
      'minResponseBodyBytes': minResponseBodyBytes,
    if (excludedContentTypes != null)
      'excludedContentTypes': excludedContentTypes,
  };
}

class BufferingMiddleware {
  final String? maxRequestBodyBytes;
  final String? maxResponseBodyBytes;
  final String? memRequestBodyBytes;
  final String? memResponseBodyBytes;

  BufferingMiddleware({
    this.maxRequestBodyBytes,
    this.maxResponseBodyBytes,
    this.memRequestBodyBytes,
    this.memResponseBodyBytes,
  });

  factory BufferingMiddleware.fromJson(Map<String, dynamic> json) =>
      BufferingMiddleware(
        maxRequestBodyBytes: json['maxRequestBodyBytes'],
        maxResponseBodyBytes: json['maxResponseBodyBytes'],
        memRequestBodyBytes: json['memRequestBodyBytes'],
        memResponseBodyBytes: json['memResponseBodyBytes'],
      );

  Map<String, dynamic> toJson() => {
    if (maxRequestBodyBytes != null)
      'maxRequestBodyBytes': maxRequestBodyBytes,
    if (maxResponseBodyBytes != null)
      'maxResponseBodyBytes': maxResponseBodyBytes,
    if (memRequestBodyBytes != null)
      'memRequestBodyBytes': memRequestBodyBytes,
    if (memResponseBodyBytes != null)
      'memResponseBodyBytes': memResponseBodyBytes,
  };
}

class RateLimitMiddleware {
  final int average;
  final int burst;

  RateLimitMiddleware({required this.average, required this.burst});

  factory RateLimitMiddleware.fromJson(Map<String, dynamic> json) =>
      RateLimitMiddleware(
        average: json['average'],
        burst: json['burst'],
      );

  Map<String, dynamic> toJson() => {
    'average': average,
    'burst': burst,
  };
}

class CircuitBreakerMiddleware {
  final String expression;

  CircuitBreakerMiddleware({required this.expression});

  factory CircuitBreakerMiddleware.fromJson(Map<String, dynamic> json) =>
      CircuitBreakerMiddleware(expression: json['expression']);

  Map<String, dynamic> toJson() => {
    'expression': expression,
  };
}

class RetryMiddleware {
  final int attempts;
  final String? initialInterval;
  final String? maxInterval;

  RetryMiddleware({required this.attempts, this.initialInterval, this.maxInterval});

  factory RetryMiddleware.fromJson(Map<String, dynamic> json) => RetryMiddleware(
    attempts: json['attempts'],
    initialInterval: json['initialInterval'],
    maxInterval: json['maxInterval'],
  );

  Map<String, dynamic> toJson() => {
    'attempts': attempts,
    if (initialInterval != null) 'initialInterval': initialInterval,
    if (maxInterval != null) 'maxInterval': maxInterval,
  };
}

class ErrorsMiddleware {
  final List<String> status;
  final String service;
  final String query;

  ErrorsMiddleware({
    required this.status,
    required this.service,
    required this.query,
  });

  factory ErrorsMiddleware.fromJson(Map<String, dynamic> json) =>
      ErrorsMiddleware(
        status: (json['status'] as List).cast<String>(),
        service: json['service'],
        query: json['query'],
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'service': service,
    'query': query,
  };
}

// Und die unterstützenden Klassen wie AddPrefix, HeadersMiddleware, etc., analog zu TypeScript

// Beispiel:
class AddPrefix {
  String prefix;

  AddPrefix({ required this.prefix });

  factory AddPrefix.fromJson(Map<String, dynamic> json) => AddPrefix(
      prefix: json['prefix'] as String
  );

  Map<String, dynamic> toJson() => { 'prefix': prefix };
}


class TCPConfig {
  Map<String, RouterTCP>? routers;
  Map<String, TCPService>? services;
  Map<String, TCPMiddleware>? middlewares;

  TCPConfig({this.routers, this.services, this.middlewares});

  factory TCPConfig.fromJson(Map<String, dynamic> json) {
    return TCPConfig(
      routers: json['routers'] != null
          ? (json['routers'] as Map<String, dynamic>).map(
            (k, v) => MapEntry(k, RouterTCP.fromJson(v as Map<String, dynamic>)),
      )
          : null,
      services: json['services'] != null
          ? (json['services'] as Map<String, dynamic>).map(
            (k, v) => MapEntry(k, TCPService.fromJson(v as Map<String, dynamic>)),
      )
          : null,
      middlewares: json['middlewares'] != null
          ? (json['middlewares'] as Map<String, dynamic>).map(
            (k, v) => MapEntry(k, TCPMiddleware.fromJson(v as Map<String, dynamic>)),
      )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final m = <String, dynamic>{};
    if (routers != null) {
      m['routers'] = routers!.map((k, v) => MapEntry(k, v.toJson()));
    }
    if (services != null) {
      m['services'] = services!.map((k, v) => MapEntry(k, v.toJson()));
    }
    if (middlewares != null) {
      m['middlewares'] = middlewares!.map((k, v) => MapEntry(k, v.toJson()));
    }
    return m;
  }
}

class RouterTCP {
  List<String>? entryPoints;
  String rule; // z. B. "HostSNI(`*`)"
  String service;
  List<String>? middlewares;
  int? priority;
  RouterTLSConfig? tls;

  RouterTCP({
    this.entryPoints,
    required this.rule,
    required this.service,
    this.middlewares,
    this.priority,
    this.tls,
  });

  factory RouterTCP.fromJson(Map<String, dynamic> json) => RouterTCP(
    entryPoints: (json['entryPoints'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    rule: json['rule'] as String,
    service: json['service'] as String,
    middlewares: (json['middlewares'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    priority: json['priority'] as int?,
    tls: json['tls'] != null
        ? RouterTLSConfig.fromJson(json['tls'] as Map<String, dynamic>)
        : null,
  );

  Map<String, dynamic> toJson() {
    final m = <String, dynamic>{
      'rule': rule,
      'service': service,
    };
    if (entryPoints != null) m['entryPoints'] = entryPoints;
    if (middlewares != null) m['middlewares'] = middlewares;
    if (priority != null) m['priority'] = priority;
    if (tls != null) m['tls'] = tls!.toJson();
    return m;
  }
}

class TCPService {
  TCPLoadBalancer loadBalancer;

  TCPService({required this.loadBalancer});

  factory TCPService.fromJson(Map<String, dynamic> json) => TCPService(
    loadBalancer:
    TCPLoadBalancer.fromJson(json['loadBalancer'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {'loadBalancer': loadBalancer.toJson()};
}

class TCPLoadBalancer {
  List<ServerTCP> servers;

  TCPLoadBalancer({required this.servers});

  factory TCPLoadBalancer.fromJson(Map<String, dynamic> json) => TCPLoadBalancer(
    servers: (json['servers'] as List<dynamic>)
        .map((e) => ServerTCP.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() =>
      {'servers': servers.map((s) => s.toJson()).toList()};
}

class ServerTCP {
  String address; // z. B. "10.0.0.1:3306"
  int? weight;

  ServerTCP({required this.address, this.weight});

  factory ServerTCP.fromJson(Map<String, dynamic> json) => ServerTCP(
    address: json['address'] as String,
    weight: json['weight'] as int?,
  );

  Map<String, dynamic> toJson() {
    final m = <String, dynamic>{'address': address};
    if (weight != null) m['weight'] = weight;
    return m;
  }
}

class TCPMiddleware {
  IPWhiteListMiddleware? ipWhiteList;
  // Hier ggf. weitere TCP-Middleware-Typen ergänzen

  TCPMiddleware({this.ipWhiteList});

  factory TCPMiddleware.fromJson(Map<String, dynamic> json) => TCPMiddleware(
    ipWhiteList: json['ipWhiteList'] != null
        ? IPWhiteListMiddleware.fromJson(
        json['ipWhiteList'] as Map<String, dynamic>)
        : null,
  );

  Map<String, dynamic> toJson() {
    final m = <String, dynamic>{};
    if (ipWhiteList != null) m['ipWhiteList'] = ipWhiteList!.toJson();
    return m;
  }
}


class IPWhiteListMiddleware {
  /// Liste von CIDR/IP-Strings, z. B. ["10.0.0.0/8", "192.168.1.5"]
  final List<String> sourceRange;

  /// Optionale IP-Strategie (z. B. depth, excludedIPs)
  final IPStrategy? ipStrategy;

  IPWhiteListMiddleware({
    required this.sourceRange,
    this.ipStrategy,
  });

  factory IPWhiteListMiddleware.fromJson(Map<String, dynamic> json) {
    return IPWhiteListMiddleware(
      sourceRange: (json['sourceRange'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
          <String>[],
      ipStrategy: json['ipStrategy'] != null
          ? IPStrategy.fromJson(json['ipStrategy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final m = <String, dynamic>{'sourceRange': sourceRange};
    if (ipStrategy != null) m['ipStrategy'] = ipStrategy!.toJson();
    return m;
  }
}

class IPStrategy {
  /// Anzahl der Proxy-Header-Level, die beim Ermitteln der Client-IP übersprungen werden.
  final int? depth;

  /// Auszuschließende IPs (werden nicht als Client-IP zugelassen)
  final List<String>? excludedIPs;

  IPStrategy({this.depth, this.excludedIPs});

  factory IPStrategy.fromJson(Map<String, dynamic> json) {
    return IPStrategy(
      depth: json['depth'] as int?,
      excludedIPs: (json['excludedIPs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final m = <String, dynamic>{};
    if (depth != null) m['depth'] = depth;
    if (excludedIPs != null) m['excludedIPs'] = excludedIPs;
    return m;
  }
}
