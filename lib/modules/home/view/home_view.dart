import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:learn_world/components/components.dart';
import 'package:learn_world/core/core.dart';
import 'package:learn_world/l10n/l10n.dart';
import 'package:learn_world/models/models.dart';
import 'package:learn_world/modules/modules.dart';
import 'package:learn_world/theme/theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return switch (state.fetchStatus) {
            FetchStatus.initial => const InitialWidget(),
            FetchStatus.loading => const LoadingWidget(),
            FetchStatus.success => HomeSuccesView(state.contents ?? []),
            FetchStatus.fail => const CustomErrorWidget(),
          };
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
    final homeCubit = context.watch<HomeCubit>();
    return DefaultTabController(
      length: contents.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.home),
          bottom: TabBar(
            isScrollable: true,
            indicatorWeight: 2.5,
            indicatorColor: context.colors.primary,
            labelColor: context.colors.onSurfaceVariant,
            labelStyle: context.titleMedium!.copyWith(fontWeight: FontWeight.bold),
            tabs: contents
                .map(
                  (e) => Tab(
                    child: Row(
                      children: [
                        if (e.svgUrl != null) SvgPicture.network(e.svgUrl!, width: 35, height: 35),
                        const SizedBox(width: 10),
                        Text(e.getName(homeCubit.state.myLocale)),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        body: TabBarView(
          children: contents
              .map(
                (e) => ListView.builder(
                  padding: const EdgeInsets.fromLTRB(14, 25, 14, 90),
                  itemCount: e.articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    final article = e.articles[index];
                    return Card(
                      child: ListTile(
                        title: Text(article.getName(homeCubit.state.myLocale)),
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => BlocProvider(
                                create: (context) => DetailCubit(
                                  context.read<ApiService>(),
                                  article.ids[context.read<HomeCubit>().state.myLocale.index],
                                  context.read<HomeCubit>().state.myLocale,
                                )..getData(),
                                child: HomeDetailView(article.getName(homeCubit.state.myLocale)),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ),
        floatingActionButton: ArticleLocale(
          onSelected: (v) => context.read<HomeCubit>().changeLocale(v),
        ),
      ),
    );
  }
}
