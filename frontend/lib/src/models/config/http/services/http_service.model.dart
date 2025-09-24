// Services & Middlewares definieren ähnlich wie Typescript
import 'package:frontend/src/models/config/http/services/loadbalancer.model.dart';

class HTTPService {
  LoadBalancer loadBalancer;

  HTTPService({ required this.loadBalancer });

  factory HTTPService.fromJson(Map<String, dynamic> json) => HTTPService(
    loadBalancer: LoadBalancer.fromJson(json['loadBalancer'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => { 'loadBalancer': loadBalancer.toJson() };
}
