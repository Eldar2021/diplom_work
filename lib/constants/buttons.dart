import 'package:flutter/material.dart';

class Buttons {
  const Buttons._init();

  factory Buttons.getInstance() {
    _instance ??= const Buttons._init();
    return _instance!;
  }

  static Buttons? _instance;

  List<Widget> fl() {
    return <Widget>[
      FloatingActionButton.small(
        onPressed: () {},
        heroTag: '1',
        child: const Icon(Icons.add),
      ),
      FloatingActionButton(
        onPressed: () {},
        heroTag: '2',
        child: const Icon(Icons.add),
      ),
      FloatingActionButton.extended(
        onPressed: () {},
        heroTag: '3',
        icon: const Icon(Icons.add),
        label: const Text('Create'),
      ),
    ];
  }

  List<Widget> tx() {
    return [
      TextButton(
        onPressed: () {},
        child: const Text('TextButton'),
      ),
      TextButton.icon(
        icon: const Icon(Icons.add),
        onPressed: () {},
        label: const Text('Icon'),
      ),
      const TextButton(
        onPressed: null,
        child: Text('TextButton'),
      ),
    ];
  }

  List<Widget> ot() {
    return [
      OutlinedButton(
        onPressed: () {},
        child: const Text('Outlined'),
      ),
      OutlinedButton.icon(
        icon: const Icon(Icons.add),
        onPressed: () {},
        label: const Text('Icon'),
      ),
      const OutlinedButton(
        onPressed: null,
        child: Text('Outlined'),
      ),
    ];
  }

  List<Widget> elt(ColorScheme scheme) {
    return [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: scheme.onSecondaryContainer,
          backgroundColor: scheme.secondaryContainer,
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
        onPressed: () {},
        child: const Text('Tonal'),
      ),
      ElevatedButton.icon(
        icon: const Icon(Icons.add),
        style: ElevatedButton.styleFrom(
          foregroundColor: scheme.onSecondaryContainer,
          backgroundColor: scheme.secondaryContainer,
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
        onPressed: () {},
        label: const Text('Icon'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: scheme.onSecondaryContainer,
          backgroundColor: scheme.secondaryContainer,
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
        onPressed: null,
        child: const Text('Tonal'),
      ),
    ];
  }

  List<Widget> elf(ColorScheme scheme) {
    return [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
        ),
        onPressed: () {},
        child: const Text('Filled'),
      ),
      ElevatedButton.icon(
        icon: const Icon(Icons.add),
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
        ),
        onPressed: () {},
        label: const Text('Icon'),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
        ),
        onPressed: null,
        child: const Text('Filled'),
      ),
    ];
  }

  List<Widget> eln() {
    return [
      ElevatedButton(
        onPressed: () {},
        child: const Text('Elevated'),
      ),
      ElevatedButton.icon(
        icon: const Icon(Icons.add),
        onPressed: () {},
        label: const Text('Icon'),
      ),
      const ElevatedButton(
        onPressed: null,
        child: Text('Elevated'),
      ),
    ];
  }
}
