import 'package:traefik_frontend_shared/shared_models.dart';

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
