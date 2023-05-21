import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_world/constants/constants.dart';
import 'package:learn_world/core/core.dart';
import 'package:markdown_widget/widget/all.dart';

class HomeDetailView extends StatelessWidget {
  const HomeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeDetailView'),
      ),
      body: FutureBuilder(
        future: context.read<ApiService>().getMDFile('${ApiConst.eldarApiBase}/learn_world/001/001.md'),
        builder: (ctx, snapshots) {
          if (snapshots.hasData && snapshots.data != null) {
            return MarkdownWidget(
              padding: const EdgeInsets.fromLTRB(14, 20, 14, 40),
              data: snapshots.data!.$1!,
            );
          }
          return Text('$snapshots');
        },
      ),
    );
  }
}
