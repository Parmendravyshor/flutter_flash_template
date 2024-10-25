import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flash_template/core/theme/app_style.dart';
import 'package:kiwi/kiwi.dart';

class CustomDialogBox extends StatefulWidget {
  final String? title, descriptions, text;
  final Image? img;

  const CustomDialogBox(
      {super.key, this.title, required this.descriptions, this.text, this.img});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding:
              const EdgeInsets.only(left: 10, top: 30, right: 10, bottom: 10),
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppStyle.colors.cardbg,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.title!, style: AppStyle.text.small),
              const SizedBox(
                height: 15,
              ),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: TextField(
                  onChanged: (val) {},
                  textAlign: TextAlign.start,
                  controller: _controller,
                  maxLines: null,
                  style: AppStyle.text.small,
                  decoration: InputDecoration(
                    hintText: 'Endpoint without https://',
                    hintStyle: AppStyle.text.small,
                    border: AppStyle.defaultBorder,
                    enabledBorder: AppStyle.defaultBorder,
                    focusedBorder: AppStyle.defaultBorder,
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      widget.text!,
                      style: const TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
