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
      padding: const EdgeInsets.fromLTRB(14, 15, 14, 90),
      itemCount: topics.length,
      itemBuilder: (BuildContext context, int index) {
        final topic = topics[index];
        return Card(
          margin: const EdgeInsets.only(top: 20),
          child: ListTile(
            isThreeLine: true,
            minVerticalPadding: 10,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text(topic.title)),
                const SizedBox(width: 10),
                Text(topic.locale),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\n${topic.authorName}'),
                const SizedBox(width: 10),
                Text('\n${topic.displayDateTime}'),
              ],
            ),
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
