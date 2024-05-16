import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// HINT: Creator
abstract class CustomFooterDialog {
  const CustomFooterDialog();
  String getTitle();

  // HINT: create() is a factory method
  Widget create(BuildContext context);

  Future<void> show(BuildContext context) => showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: create,
      );
}

// HINT: 1 trong các Concrete Creator
class CoUDialog extends CustomFooterDialog {
  const CoUDialog();

  @override
  String getTitle() => 'Conditions of Use Dialog';

  @override
  Widget create(BuildContext context) {
    // HINT: 1 trong các Concrete Product được sử dụng
    return AlertDialog(
      title: Text(getTitle()),
      content:
          const Text('This is the material-style Conditions of Use Dialog!'),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.yellow[800],
            backgroundColor: Colors.red,
          ),
          onPressed: Navigator.of(context).pop,
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class PrivacyNoticeDialog extends CustomFooterDialog {
  const PrivacyNoticeDialog();

  @override
  String getTitle() => 'Privacy Notice Dialog';

  @override
  Widget create(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(getTitle()),
      content: const Text('This is the material-style Privacy Notice Dialog!'),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.red,
          ),
          onPressed: Navigator.of(context).pop,
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class HelpDialog extends CustomFooterDialog {
  const HelpDialog();

  @override
  String getTitle() => 'Help Dialog';

  @override
  Widget create(BuildContext context) {
    return SimpleDialog(
      title: Text(getTitle()),
      children: <Widget>[
        const Text('    This is the material-style Help Dialog!'),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Close',
            style: TextStyle(color: Colors.red, fontSize: 18.0),
          ),
        ),
      ],
    );
  }
}
