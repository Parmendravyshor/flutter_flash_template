import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key, String message) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        const CircularProgressIndicator(),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          message,
                          style: const TextStyle(color: Colors.blueAccent),
                        )
                      ]),
                    )
                  ]));
        });
  }
}
