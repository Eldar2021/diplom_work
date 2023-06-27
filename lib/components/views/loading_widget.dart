import 'package:flutter/cupertino.dart';

@immutable
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CupertinoActivityIndicator());
  }
}
