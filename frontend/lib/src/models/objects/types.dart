class DynamicConfig {
  Http? http;

  DynamicConfig({this.http});

  DynamicConfig.fromJson(Map<String, dynamic> json) {
    http = json['http'] != null ? Http.fromJson(json['http']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (http != null) {
      data['http'] = http!.toJson();
    }
    return data;
  }
}

class Http {
  List<Service>? services;
  List<Router>? routers;
  Middlewares? middlewares;
  ServersTransports? serversTransports;

  Http({this.middlewares, this.serversTransports, this.services, this.routers});

  Http.fromJson(Map<String, dynamic> json) {
    middlewares = json['middlewares'] != null ? Middlewares.fromJson(json['middlewares']) : null;
    serversTransports = json['serversTransports'] != null ? ServersTransports.fromJson(json['serversTransports']) : null;

    if (json['services'] != null) {
      services = <Service>[];
      json['services'].forEach((v) {
        services!.add(Service.fromJson(v));
      });
    }

    if (json['routers'] != null) {
      routers = <Router>[];
      json['routers'].forEach((v) {
        routers!.add(Router.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (middlewares != null) {
      data['middlewares'] = middlewares!.toJson();
    }
    if (serversTransports != null) {
      data['serversTransports'] = serversTransports!.toJson();
    }
    if (services != null) {
      data['servers'] = services!.map((v) => v.toJson()).toList();
    }
    if (routers != null) {
      data['routers'] = routers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Middlewares {
  Ipallow? ipAllow;
  CrowdsecBouncer? crowdsecBouncer;

  Middlewares({this.ipAllow, this.crowdsecBouncer});

  Middlewares.fromJson(Map<String, dynamic> json) {
    ipAllow = json['ipallow'] != null ? Ipallow.fromJson(json['ipallow']) : null;
    crowdsecBouncer = json['crowdsec-bouncer'] != null ? CrowdsecBouncer.fromJson(json['crowdsec-bouncer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ipAllow != null) {
      data['ipallow'] = ipAllow!.toJson();
    }
    if (crowdsecBouncer != null) {
      data['crowdsec-bouncer'] = crowdsecBouncer!.toJson();
    }
    return data;
  }
}

class Ipallow {
  IpAllowList? ipAllowList;

  Ipallow({this.ipAllowList});

  Ipallow.fromJson(Map<String, dynamic> json) {
    ipAllowList = json['ipAllowList'] != null ? IpAllowList.fromJson(json['ipAllowList']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ipAllowList != null) {
      data['ipAllowList'] = ipAllowList!.toJson();
    }
    return data;
  }
}

class IpAllowList {
  List<String>? sourceRange;

  IpAllowList({this.sourceRange});

  IpAllowList.fromJson(Map<String, dynamic> json) {
    sourceRange = json['sourceRange'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sourceRange'] = sourceRange;
    return data;
  }
}

class CrowdsecBouncer {
  Forwardauth? forwardauth;

  CrowdsecBouncer({this.forwardauth});

  CrowdsecBouncer.fromJson(Map<String, dynamic> json) {
    forwardauth = json['forwardauth'] != null ? Forwardauth.fromJson(json['forwardauth']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (forwardauth != null) {
      data['forwardauth'] = forwardauth!.toJson();
    }
    return data;
  }
}

class Forwardauth {
  String? address;
  bool? trustForwardHeader;

  Forwardauth({this.address, this.trustForwardHeader});

  Forwardauth.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    trustForwardHeader = json['trustForwardHeader'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['trustForwardHeader'] = trustForwardHeader;
    return data;
  }
}

class ServersTransports {
  InsecureTransport? insecureTransport;

  ServersTransports({this.insecureTransport});

  ServersTransports.fromJson(Map<String, dynamic> json) {
    insecureTransport = json['insecureTransport'] != null ? InsecureTransport.fromJson(json['insecureTransport']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (insecureTransport != null) {
      data['insecureTransport'] = insecureTransport!.toJson();
    }
    return data;
  }
}

class InsecureTransport {
  bool? insecureSkipVerify;

  InsecureTransport({this.insecureSkipVerify});

  InsecureTransport.fromJson(Map<String, dynamic> json) {
    insecureSkipVerify = json['insecureSkipVerify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['insecureSkipVerify'] = insecureSkipVerify;
    return data;
  }
}

class Service {
  LoadBalancer? loadBalancer;

  Service({this.loadBalancer});

  Service.fromJson(Map<String, dynamic> json) {
    loadBalancer = json['loadBalancer'] != null ? LoadBalancer.fromJson(json['loadBalancer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (loadBalancer != null) {
      data['loadBalancer'] = loadBalancer!.toJson();
    }
    return data;
  }
}

class LoadBalancer {
  List<Servers>? servers;

  LoadBalancer({this.servers});

  LoadBalancer.fromJson(Map<String, dynamic> json) {
    if (json['servers'] != null) {
      servers = <Servers>[];
      json['servers'].forEach((v) {
        servers!.add(Servers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (servers != null) {
      data['servers'] = servers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Servers {
  String? url;

  Servers({this.url});

  Servers.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}

class Tls {
  String? certresolver;

  Tls({this.certresolver});

  Tls.fromJson(Map<String, dynamic> json) {
    certresolver = json['certresolver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['certresolver'] = certresolver;
    return data;
  }
}

class Router {
  String? rule;
  String? service;
  List<String>? entryPoints;
  List<String>? middlewares;
  Tls? tls;

  Router({this.rule, this.service, this.entryPoints, this.tls});

  Router.fromJson(Map<String, dynamic> json) {
    rule = json['rule'];
    service = json['service'];
    entryPoints = json['entryPoints'].cast<String>();
    tls = json['tls'] != null ? Tls.fromJson(json['tls']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rule'] = rule;
    data['service'] = service;
    data['entryPoints'] = entryPoints;
    if (tls != null) {
      data['tls'] = tls!.toJson();
    }
    return data;
  }
}
