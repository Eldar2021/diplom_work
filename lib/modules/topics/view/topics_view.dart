import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn_world/components/components.dart';
import 'package:learn_world/core/core.dart';
import 'package:learn_world/models/models.dart';
import 'package:learn_world/modules/modules.dart';

class TopicsView extends StatelessWidget {
  const TopicsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TopicsView'),
      ),
      body: BlocBuilder<TopicsCubit, TopicsState>(
        builder: (context, state) {
          switch (state.fetchStatus) {
            case FetchStatus.initial:
              return const InitialWidget();
            case FetchStatus.loading:
              return const LoadingWidget();
            case FetchStatus.success:
              return TopicsListView(state.topics ?? []);
            case FetchStatus.fail:
              return const CustomErrorWidget();
          }
        },
      ),
    );
  }
}

class TopicsListView extends StatelessWidget {
  const TopicsListView(this.topics, {super.key});

  final List<Topic> topics;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(14, 25, 14, 90),
      itemCount: topics.length,
      itemBuilder: (BuildContext context, int index) {
        final topic = topics[index];
        return Card(
          child: ListTile(
            title: Text(topic.title),
            onTap: () {
              // Navigator.push<void>(
              //   context,
              //   MaterialPageRoute<void>(
              //     builder: (BuildContext context) => BlocProvider(
              //       create: (context) => DetailCubit(
              //         context.read<ApiService>(),
              //         article.ids[context.read<HomeCubit>().state.myLocale.index],
              //         context.read<HomeCubit>().state.myLocale,
              //       )..getData(),
              //       child: const HomeDetailView(),
              //     ),
              //   ),
              // );
            },
          ),
        );
      },
    );
  }
}
