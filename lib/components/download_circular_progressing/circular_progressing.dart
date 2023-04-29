import 'package:flutter/material.dart';

class LoadingCircular extends StatelessWidget {
  const LoadingCircular(
    this.progress, {
    super.key,
    this.color,
    this.width = 60,
    this.height = 60,
  });

  final double progress;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final prText = (progress * 10).toInt();
    final scheme = Theme.of(context).colorScheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        Text('$prText%'),
        SizedBox(
          width: width,
          height: height,
          child: CircularProgressIndicator(
            backgroundColor: scheme.background,
            value: progress / 10,
            color: color,
            strokeWidth: 3,
          ),
        ),
      ],
    );
  }
}
