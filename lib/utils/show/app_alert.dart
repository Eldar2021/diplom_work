import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_world/l10n/l10n.dart';

import 'package:learn_world/theme/theme.dart';

class AppAlert {
  static Future<T?> showDialog<T>(
    BuildContext context, {
    Widget? title,
    Widget? content,
    List<Widget> actions = const <Widget>[],
  }) {
    return showCupertinoDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: title,
          content: content,
          actions: actions,
        );
      },
    );
  }

  static Future<T?> showLoading<T>(BuildContext context) {
    return showCupertinoDialog<T>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: CupertinoActivityIndicator(color: context.colors.primary, radius: 16),
            ),
          ),
          content: const Text(
            'context.l10n.pleaseWait',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  static Future<T?> showConfirmDialog<T>({
    required BuildContext context,
    required VoidCallback onOK,
    VoidCallback? onCancel,
    Widget? title,
    Widget? content,
  }) {
    return showCupertinoDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: title,
          content: content,
          actions: <Widget>[
            CupertinoButton(
              onPressed: onCancel ?? () => Navigator.pop(context),
              child: Text(context.l10n.next),
            ),
            CupertinoButton(
              onPressed: onOK,
              child: Text(context.l10n.ok),
            ),
          ],
        );
      },
    );
  }

  static void showErrorDialog(
    BuildContext context, {
    required String errorText,
    required String buttontext,
    Widget? title,
    void Function()? onPressed,
  }) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: title,
          content: Text(errorText),
          actions: <Widget>[
            CupertinoButton(
              onPressed: onPressed ?? () => Navigator.of(context).pop(),
              child: Text(buttontext),
            ),
          ],
        );
      },
    );
  }
}
