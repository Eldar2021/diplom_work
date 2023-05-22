import 'package:flutter/material.dart';
import 'package:learn_world/l10n/l10n.dart';

class InitialWidget extends StatelessWidget {
  const InitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(context.l10n.initialView));
  }
}
