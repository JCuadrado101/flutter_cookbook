import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlatformAlert {
  final String title;
  final String message;

  void _buildCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        )
    );
  }

  void _buildMaterialAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        )
    );
  }


  void show(BuildContext context) {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      _buildCupertinoAlert(context);
    } else {
      _buildMaterialAlert(context);
    }
  }

  PlatformAlert({
    required this.title,
    required this.message
  }) : assert(title != null),
       assert(message != null);
}

