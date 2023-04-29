import 'package:flutter/material.dart';

import 'package:diplom_work/views/buttons_view.dart';

class ElevationInfo {
  const ElevationInfo(
    this.level,
    this.elevation,
    this.overlayPercent,
    this.vals,
  );
  final int level;
  final double elevation;
  final int overlayPercent;
  final double vals;
}

const elevations = <ElevationInfo>[
  ElevationInfo(0, 0, 0, 0.1),
  ElevationInfo(1, 1, 5, 0.3),
  ElevationInfo(2, 3, 8, 0.5),
  ElevationInfo(3, 6, 11, 0.7),
  ElevationInfo(4, 8, 12, 0.9),
  ElevationInfo(5, 12, 14, 1),
];

class ElevationScreen extends StatelessWidget {
  const ElevationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final tTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Primery Container opasity',
                style: tTheme.bodyLarge,
              ),
              Wrap(
                children: elevations
                    .map(
                      (e) => ElevetionCard(
                        color: scheme.primary,
                        info: e,
                        shadow: Theme.of(context).canvasColor,
                        opasity: e.vals,
                        index: e.level + 1,
                      ),
                    )
                    .toList(),
              ),
              sizeH20,
              Text(
                'Primery Container opasity and Shadow',
                style: tTheme.bodyLarge,
              ),
              Wrap(
                children: elevations
                    .map(
                      (e) => ElevetionCard(
                        color: scheme.primary,
                        info: e,
                        shadow: scheme.shadow,
                        opasity: e.vals,
                        index: e.level + 1,
                        isShadow: true,
                      ),
                    )
                    .toList(),
              ),
              sizeH20,
              Text(
                'Container only Shadow',
                style: tTheme.bodyLarge,
              ),
              Wrap(
                children: elevations
                    .map(
                      (e) => ElevetionCard(
                        color: scheme.primary,
                        info: e,
                        shadow: scheme.shadow,
                        opasity: e.vals,
                        index: e.level + 1,
                        isShadow: true,
                        isColor: false,
                      ),
                    )
                    .toList(),
              ),
              sizeH20,
            ],
          ),
        ),
      ),
    );
  }
}

class ElevetionCard extends StatelessWidget {
  const ElevetionCard({
    required this.color,
    required this.shadow,
    required this.info,
    required this.index,
    this.opasity = 0,
    this.isShadow = false,
    this.isColor = true,
    super.key,
  });

  final Color color;
  final Color shadow;
  final ElevationInfo info;
  final double opasity;
  final int index;
  final bool isShadow;
  final bool isColor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final surface = Theme.of(context).colorScheme.surface;
    final pr = opasity * 100;
    return Padding(
      padding: EdgeInsets.all(width / 100),
      child: SizedBox(
        width: width / 3.42,
        height: width / 3.42,
        child: Material(
          type: MaterialType.card,
          borderRadius: BorderRadius.circular(7),
          color: surface,
          surfaceTintColor: isColor ? color : null,
          shadowColor: isShadow ? shadow : null,
          elevation: info.elevation,
          child: Padding(
            padding: EdgeInsets.all(width / 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Level $index'),
                Text('$index db'),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text('$pr%'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
