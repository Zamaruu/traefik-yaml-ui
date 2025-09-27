import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/data/interfaces/core/argument.interface.dart';
import 'package:frontend/src/data/interfaces/core/routable_screen.interface.dart';

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

abstract class ConsumerScreenWidget<A extends IRouterArgument> extends ConsumerWidget implements IRoutableScreen<A> {
  @override
  final A argument;

  const ConsumerScreenWidget({super.key, required this.argument});
}

abstract class ConsumerStatefulScreenWidget<A extends IRouterArgument> extends ConsumerStatefulWidget implements IRoutableScreen<A> {
  @override
  final A argument;

  const ConsumerStatefulScreenWidget({super.key, required this.argument});
}
