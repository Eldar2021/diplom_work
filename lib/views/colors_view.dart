import 'package:diplom_work/constants/colors.dart';
import 'package:flutter/material.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = Theme.of(context).colorScheme;
    final colors = AppColors.getInstance();
    final pr = colors.pr(s);
    final sc = colors.sc(s);
    final tr = colors.tr(s);
    final er = colors.er(s);
    final bg = colors.bg(s);
    final sr = colors.sr(s);
    final other = colors.other(s);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ColorView(colors: pr),
            ColorView(colors: sc),
            ColorView(colors: tr),
            ColorView(colors: er),
            ColorView(colors: bg),
            ColorView(colors: sr),
            ColorView(colors: other),
          ],
        ),
      ),
    );
  }
}

class ColorView extends StatelessWidget {
  const ColorView({required this.colors, super.key});

  final List<ColorItem> colors;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 15,
      margin: const EdgeInsets.all(15),
      child: Column(
        children: colors
            .map(
              (e) => DecoratedBox(
                decoration: BoxDecoration(
                  color: e.val,
                ),
                child: ListTile(
                  title: Text(
                    e.name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: e.on),
                  ),
                  subtitle: Text(
                    '${e.val}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: e.on),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ColorItem {
  const ColorItem(this.name, this.val, this.on);
  final String name;
  final Color val;
  final Color on;
}
