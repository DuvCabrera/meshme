import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_mesh/common/light_colors.dart';

class APPTextField extends StatefulWidget {
  const APPTextField({
    required this.fieldName,
    this.hintText,
    this.controller,
    this.isPassword = false,
    this.fieldNameStyle,
    this.hintStyle,
    this.errorText,
    this.errorTextStyle,
    this.fieldNameErrorStyle,
    this.textInputAction,
    this.onChanged,
    this.inputFormatter,
    this.focusNode,
    this.onEditingComplete,
    this.keyboardType,
    this.inputTextStyle,
    super.key,
  });

  final String fieldName;
  final String? hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final TextStyle? fieldNameStyle;
  final TextStyle? fieldNameErrorStyle;
  final TextStyle? hintStyle;
  final String? errorText;
  final TextStyle? errorTextStyle;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final TextInputType? keyboardType;
  final TextStyle? inputTextStyle;

  @override
  State<StatefulWidget> createState() => _IAPTextFieldState();
}

class _IAPTextFieldState extends State<APPTextField> {
  late bool _isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 8,
          ),
          child: Text(
            widget.fieldName,
            style: widget.errorText != null
                ? widget.fieldNameErrorStyle
                : widget.fieldNameStyle,
          ),
        ),
        TextField(
          controller: widget.controller,
          autocorrect: false,
          obscureText: widget.isPassword && !_isPasswordVisible,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          inputFormatters: widget.inputFormatter,
          focusNode: widget.focusNode,
          onEditingComplete: widget.onEditingComplete,
          keyboardType: widget.keyboardType,
          enableSuggestions: !widget.isPassword,
          style: widget.inputTextStyle,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            errorText: widget.errorText,
            errorStyle: widget.errorTextStyle,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: LightColors().textFieldPassVisibilityColor,
                    ),
                  )
                : null,
            fillColor: LightColors().textFieldFillColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: LightColors().appTextFieldBorderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: LightColors().appTextFieldBorderColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: LightColors().appTextFieldBorderColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: LightColors().textFieldErrorColor,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
