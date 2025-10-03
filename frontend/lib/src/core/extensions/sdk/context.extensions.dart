import 'package:flutter/material.dart';
import 'package:frontend/src/data/interfaces/core/argument.interface.dart';
import 'package:go_router/go_router.dart';

extension ContextRoutingExtensions on BuildContext {
  void pushRoute(String path, {IRouterArgument? argument}) {
    final pathWithQueryParams = _mergePathAndParams(path, argument);

    go(pathWithQueryParams);
  }

  String _mergePathAndParams(String path, IRouterArgument? argument) {
    if (argument == null || argument.queryParameters.isEmpty) return path;

    final basePath = "$path?";
    final concattedParams = argument.queryParameters.entries.map((entry) => "${entry.key}=${entry.value}").toList().join("&");
    final concattedPath = basePath + concattedParams;

    return concattedPath;
  }
}
