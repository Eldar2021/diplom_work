import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diplom_work/components/components.dart';

class CircularPrPage extends StatelessWidget {
  const CircularPrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CircularPrPage')),
      body: Center(
        child: BlocProvider(
          create: (context) => CircularPrCubit(),
          child: const CircularPrWidget(),
        ),
      ),
    );
  }
}

class CircularPrWidget extends StatelessWidget {
  const CircularPrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CircularPrCubit, CircularPrState>(
      builder: (context, state) {
        if (state is CircularPrInit) {
          return IconButton(
            onPressed: () => context.read<CircularPrCubit>().downLoad(),
            icon: const Icon(Icons.download),
          );
        } else if (state is CircularPrPg) {
          return LoadingCircular(state.val);
        } else {
          return const Icon(Icons.check);
        }
      },
    );
  }
}
