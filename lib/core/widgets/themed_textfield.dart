import 'package:flutter/material.dart';
import 'package:flutter_flash_template/core/theme/app_style.dart';

import '../theme/style.dart';

class _ThemedTextFieldState extends State<ThemedTextField> {
  bool _obscureText = false;
  final _password = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  _ThemedTextFieldState(password) {
    _obscureText = password;
  }

  @override
  void initState() {
    super.initState();

    // Force a repaint whenever focus changes
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /// inputDectoration deals with passing border details
  /// and placeholder details
  inputDecoration(ThemedTextField widget) {
    return InputDecoration(
        filled: true,
        fillColor: AppStyle.colors.cardbg,
        suffixIcon: widget.suffixIcon != null
            ? Container(
                child: FractionallySizedBox(
                    heightFactor: 0.7,
                    child: TextButton(
                        onPressed: _password ? _toggle : null,
                        child: Image(image: widget.suffixIcon!))))
            : null,
        errorBorder: AppStyle.defaultBorder,
        focusedErrorBorder: AppStyle.defaultBorder,
        border: AppStyle.defaultBorder,
        disabledBorder: AppStyle.defaultBorder,
        enabledBorder: AppStyle.defaultBorder,
        focusedBorder: AppStyle.focusedBorder,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: widget.placeholder,
        labelStyle: AppStyle.text.tiny);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: TextFieldContainerHeight,
            child: FractionallySizedBox(
                widthFactor: 0.9,
                heightFactor: 1,
                child: Column(children: [
                  SizedBox(
                      height: TextFieldHeight,
                      child: Form(
                          key: _formKey,
                          child: TextFormField(
                            focusNode: _focusNode,
                            obscureText: _obscureText,
                            enabled: widget.enabled,
                            controller: widget.editingController,
                            onChanged: widget.onChanged,
                            autocorrect: false,
                            keyboardType: widget.keyboardType,
                            decoration: inputDecoration(widget),
                            style: AppStyle.text.small,
                          )))
                ]))));
  }
}

/// Themed form text input field
///
/// Themes a default TextField, allowing various elements to be customised by
/// injecting them into the constructor. This will be used everywhere and
/// it uses a fixed height to allow properly rounding the edges. The height
/// will be defined in style.
class ThemedTextField extends StatefulWidget {
  final String? placeholder;
  final ImageProvider? suffixIcon;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextEditingController? editingController;
  final bool? enabled, password;

  const ThemedTextField(this.placeholder, this.keyboardType,
      {super.key,
      this.suffixIcon,
      this.onChanged,
      this.editingController,
      this.enabled,
      this.password = false,
      TextInputAction? textInputAction});

  @override
  _ThemedTextFieldState createState() => _ThemedTextFieldState(password!);
}
