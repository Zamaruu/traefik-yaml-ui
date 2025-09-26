import 'package:frontend/src/data/objects/config/http/forwardauth.model.dart';

class Http {
  List<Middleware?>? middlewares;
  List<ServersTransport?>? serversTransports;
  List<Service?>? services;
  List<Router?>? routers;

  Http({this.middlewares, this.serversTransports, this.services, this.routers});

  Http.fromJson(Map<String, dynamic> json) {
    if (json['middlewares'] != null) {
      middlewares = <Middleware>[];
      json['middlewares'].forEach((v) {
        middlewares!.add(Middleware.fromJson(v));
      });
    }
    if (json['serversTransports'] != null) {
      serversTransports = <ServersTransport>[];
      json['serversTransports'].forEach((v) {
        serversTransports!.add(ServersTransport.fromJson(v));
      });
    }
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
    data['middlewares'] = middlewares?.map((v) => v?.toJson()).toList();
    data['serversTransports'] = serversTransports?.map((v) => v?.toJson()).toList();
    data['services'] = services?.map((v) => v?.toJson()).toList();
    data['routers'] = routers?.map((v) => v?.toJson()).toList();
    return data;
  }
}

class IpAllowList {
  List<String?>? sourceRange;

  IpAllowList({this.sourceRange});

  IpAllowList.fromJson(Map<String, dynamic> json) {
    if (json['sourceRange'] != null) {
      sourceRange = json['sourceRange'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sourceRange'] = sourceRange?.toList();
    return data;
  }
}

class LoadBalancer {
  List<Server?>? servers;
  String? serversTransport;

  LoadBalancer({this.servers, this.serversTransport});

  LoadBalancer.fromJson(Map<String, dynamic> json) {
    if (json['servers'] != null) {
      servers = <Server>[];
      json['servers'].forEach((v) {
        servers!.add(Server.fromJson(v));
      });
    }
    serversTransport = json['serversTransport'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['servers'] = servers?.map((v) => v?.toJson()).toList();
    data['serversTransport'] = serversTransport;
    return data;
  }
}

class Middleware {
  String? name;
  IpAllowList? ipAllowList;
  ForwardAuth? forwardauth;

  Middleware({this.name, this.ipAllowList, this.forwardauth});

  Middleware.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    ipAllowList = json['ipAllowList'] != null ? IpAllowList?.fromJson(json['ipAllowList']) : null;
    forwardauth = json['forwardauth'] != null ? ForwardAuth?.fromJson(json['forwardauth']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['ipAllowList'] = ipAllowList!.toJson();
    data['forwardauth'] = forwardauth!.toJson();
    return data;
  }
}

class Root {
  Http? http;

  Root({this.http});

  Root.fromJson(Map<String, dynamic> json) {
    http = json['http'] != null ? Http?.fromJson(json['http']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['http'] = http!.toJson();
    return data;
  }
}

class Router {
  String? name;
  String? rule;
  String? service;
  List<String?>? entryPoints;
  List<String?>? middlewares;
  Tls? tls;

  Router({this.name, this.rule, this.service, this.entryPoints, this.middlewares, this.tls});

  Router.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rule = json['rule'];
    service = json['service'];
    if (json['entryPoints'] != null) {
      entryPoints = json['entryPoints'];
    }
    if (json['middlewares'] != null) {
      middlewares = json['middlewares'];
    }
    tls = json['tls'] != null ? Tls?.fromJson(json['tls']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['rule'] = rule;
    data['service'] = service;
    data['entryPoints'] = entryPoints?.toList();
    data['middlewares'] = middlewares?.toList();
    data['tls'] = tls!.toJson();
    return data;
  }
}

class Server {
  String? url;

  Server({this.url});

  Server.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}

class ServersTransport {
  String? name;
  bool? insecureSkipVerify;

  ServersTransport({this.name, this.insecureSkipVerify});

  ServersTransport.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    insecureSkipVerify = json['insecureSkipVerify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['insecureSkipVerify'] = insecureSkipVerify;
    return data;
  }
}

class Service {
  String? name;
  LoadBalancer? loadBalancer;

  Service({this.name, this.loadBalancer});

  Service.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    loadBalancer = json['loadBalancer'] != null ? LoadBalancer?.fromJson(json['loadBalancer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['loadBalancer'] = loadBalancer!.toJson();
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
