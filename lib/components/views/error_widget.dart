import 'package:flutter/material.dart';

import 'package:learn_world/l10n/l10n.dart';
import 'package:learn_world/theme/theme.dart';

@immutable
class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(context.l10n.someError, style: context.titleLarge),
          Text(context.l10n.pleaseTryAgain, style: context.bodyLarge),
        ],
      ),
    );
  }
}
