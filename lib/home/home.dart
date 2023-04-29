import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diplom_work/theme/theme_cubit.dart';
import 'package:diplom_work/views/buttons_view.dart';
import 'package:diplom_work/views/colors_view.dart';
import 'package:diplom_work/views/elevation_view.dart';
import 'package:diplom_work/views/typography_view.dart';
import 'package:diplom_work/home/home_cubit.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  static const pages = [
    ButtonsScreen(),
    ColorsScreen(),
    TypograpScreen(),
    ElevationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => HomeCubit(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            appBar: AppBar(
              title: const AppBarTitle(),
              actions: const [
                M2M3(),
                SizedBox(width: 20),
                SwithTheme(),
                SizedBox(width: 20),
                AppBarPopup(),
                SizedBox(width: 20),
              ],
            ),
            body: const Body(pages: pages),
            bottomNavigationBar: const MyNavigationBar(),
          );
        },
      ),
    );
  }
}

class AppBarPopup extends StatelessWidget {
  const AppBarPopup({super.key});

  static const colorOptions = [
    Color(0xff6750a4),
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.pink
  ];

  static const colorText = [
    'M3 Baseline',
    'Blue',
    'Teal',
    'Green',
    'Yellow',
    'Orange',
    'Pink',
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Color>(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) {
        return List.generate(
          colorOptions.length,
          (i) => PopupMenuItem<Color>(
            onTap: () => context.read<ThemeCubit>().changeColor(colorOptions[i]),
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: BlocBuilder<ThemeCubit, ThemeData>(
                    builder: (context, state) {
                      return Icon(
                        state.colorScheme.primary == colorOptions[i] ? Icons.color_lens : Icons.color_lens_outlined,
                        color: colorOptions[i],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(colorText[i]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SwithTheme extends StatelessWidget {
  const SwithTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<ThemeCubit>().changeBr(
              Theme.of(context).brightness == Brightness.light ? Brightness.dark : Brightness.light,
            );
      },
      icon: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return Icon(
            state.brightness == Brightness.light ? Icons.wb_sunny_outlined : Icons.wb_sunny,
          );
        },
      ),
    );
  }
}

class M2M3 extends StatelessWidget {
  const M2M3({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<ThemeCubit>().changeM3(val: !Theme.of(context).useMaterial3);
      },
      icon: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return Icon(state.useMaterial3 ? Icons.filter_3 : Icons.filter_2);
        },
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, state) {
        return Text(state.useMaterial3 ? 'Material 3' : 'Material 2');
      },
    );
  }
}

class Body extends StatelessWidget {
  const Body({required this.pages, super.key});

  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (context, state) {
        return pages[state];
      },
    );
  }
}

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  static const destinations = <NavigationDestination>[
    NavigationDestination(
      tooltip: '',
      icon: Icon(Icons.widgets_outlined),
      label: 'Components',
      selectedIcon: Icon(Icons.widgets),
    ),
    NavigationDestination(
      tooltip: '',
      icon: Icon(Icons.format_paint_outlined),
      label: 'Color',
      selectedIcon: Icon(Icons.format_paint),
    ),
    NavigationDestination(
      tooltip: '',
      icon: Icon(Icons.text_snippet_outlined),
      label: 'Typography',
      selectedIcon: Icon(Icons.text_snippet),
    ),
    NavigationDestination(
      tooltip: '',
      icon: Icon(Icons.invert_colors_on_outlined),
      label: 'Elevation',
      selectedIcon: Icon(Icons.opacity),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (context, state) {
        return NavigationBar(
          selectedIndex: state,
          onDestinationSelected: context.read<HomeCubit>().change,
          destinations: destinations,
        );
      },
    );
  }
}
