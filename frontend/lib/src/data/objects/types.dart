import 'package:frontend/src/data/objects/config/http/forwardauth.model.dart';


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
