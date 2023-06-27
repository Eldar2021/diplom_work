import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markdown_widget/markdown_widget.dart';

import 'package:learn_world/components/components.dart';
import 'package:learn_world/core/core.dart';
import 'package:learn_world/modules/modules.dart';

class TopicDetailView extends StatelessWidget {
  const TopicDetailView(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: BlocBuilder<TopicDetailCubit, TopicDetailState>(
        builder: (context, state) {
          return switch (state.fetchStatus) {
            FetchStatus.initial => const InitialWidget(),
            FetchStatus.loading => const LoadingWidget(),
            FetchStatus.success => TopicDetaiSuccess(state.mdFile ?? ''),
            FetchStatus.fail => const CustomErrorWidget(),
          };
        },
      ),
    );
  }
}

class TopicDetaiSuccess extends StatelessWidget {
  const TopicDetaiSuccess(this.mdFile, {super.key});

  final String mdFile;

  @override
  Widget build(BuildContext context) {
    return MarkdownWidget(
      padding: const EdgeInsets.fromLTRB(14, 20, 14, 40),
      data: mdFile,
    );
  }
}
