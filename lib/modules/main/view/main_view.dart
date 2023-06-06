import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:learn_world/l10n/l10n.dart';
import 'package:learn_world/modules/modules.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    context.read<HomeCubit>().getContents();
    context.read<TopicsCubit>().getTopics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: const MainScreen([
        HomeView(),
        TopicsView(),
        SettingsView(),
      ]),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen(this.items, {super.key});

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items[context.watch<MainCubit>().state],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: context.read<MainCubit>().change,
        selectedIndex: context.watch<MainCubit>().state,
        destinations: [
          NavigationDestination(
            icon: const Icon(FontAwesomeIcons.house),
            label: context.l10n.home,
          ),
          NavigationDestination(
            icon: const Icon(FontAwesomeIcons.readme),
            label: context.l10n.subjectCatalog,
          ),
          NavigationDestination(
            icon: const Icon(FontAwesomeIcons.userCheck),
            label: context.l10n.profile,
          ),
        ],
      ),
    );
  }
}
