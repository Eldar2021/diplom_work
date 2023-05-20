import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:learn_world/components/components.dart';
import 'package:learn_world/core/core.dart';
import 'package:learn_world/models/models.dart';
import 'package:learn_world/modules/modules.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.fetchStatus) {
            case FetchStatus.initial:
              return const InitialWidget();
            case FetchStatus.loading:
              return const LoadingWidget();
            case FetchStatus.success:
              return HomeSuccesView(state.contents ?? []);
            case FetchStatus.fail:
              return const CustomErrorWidget();
          }
        },
      ),
    );
  }
}

class HomeSuccesView extends StatelessWidget {
  const HomeSuccesView(this.contents, {super.key});

  final List<Content> contents;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: contents.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          bottom: TabBar(
            isScrollable: true,
            tabs: contents
                .map((e) => Tab(
                      child: Row(
                        children: [
                          if (e.svgUrl != null) SvgPicture.network(e.svgUrl!, width: 35, height: 35),
                          const SizedBox(width: 10),
                          Text(e.name),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: contents
              .map(
                (e) => ListView.builder(
                  padding: const EdgeInsets.fromLTRB(14, 25, 14, 40),
                  itemCount: e.articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    final article = e.articles[index];
                    return Card(
                      child: ListTile(
                        leading: Text(article.id),
                        title: Text(article.name),
                        trailing: Text(article.locale),
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
