import 'package:flutter/material.dart';
import 'package:frontend/src/models/interfaces/core/argument.interface.dart';

abstract interface class IRoutableScreen<A extends IRouterArgument> extends Widget {
  A get argument;

  const IRoutableScreen({super.key});
}
