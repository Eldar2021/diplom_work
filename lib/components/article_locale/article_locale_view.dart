import 'package:flutter/material.dart';
import 'package:learn_world/models/models.dart';

@immutable
class ArticleLocale extends StatefulWidget {
  const ArticleLocale({required this.onSelected, super.key});

  final void Function(MyLocale) onSelected;

  @override
  State<ArticleLocale> createState() => _ArticleLocaleState();
}

class _ArticleLocaleState extends State<ArticleLocale> {
  MyLocale myLocale = MyLocale.en;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MyLocale>(
      onSelected: (v) {
        if (myLocale != v) {
          widget.onSelected(v);
          setState(() {
            myLocale = v;
          });
        }
      },
      itemBuilder: (BuildContext context) {
        return MyLocale.values.map((e) => PopupMenuItem(value: e, child: Text(e.name))).toList();
      },
      child: FloatingActionButton.extended(
        onPressed: null,
        label: Text(myLocale.name),
      ),
    );
  }
}
