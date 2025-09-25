import 'package:flutter/material.dart';
import 'package:frontend/src/models/interfaces/core/argument.interface.dart';
import 'package:frontend/src/models/interfaces/core/routable_screen.interface.dart';
import 'package:frontend/src/models/objects/core/router/router_argument.abstract.dart';

abstract class StatelessScreenWidget<A extends IRouterArgument> extends StatelessWidget implements IRoutableScreen<A> {
  @override
  final A argument;

  const StatelessScreenWidget({super.key, required this.argument});
}

abstract class StatefulScreenWidget<A extends IRouterArgument> extends StatefulWidget implements IRoutableScreen<A> {
  @override
  final A argument;

  const StatefulScreenWidget({super.key, required this.argument});
}
