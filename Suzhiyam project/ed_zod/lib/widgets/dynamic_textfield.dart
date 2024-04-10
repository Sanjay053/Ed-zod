import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String? hintText;
  final Function(String) onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? isPrefix;
  final bool isLableStyle;
  final double height;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.hintText,
    required this.onChanged,
    required this.controller,
    required this.validator,
    this.isLableStyle = false,
    this.isPrefix,
    this.height = 39,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;
  bool isObscure = true;
  bool isClick = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isClick = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, // lable
            style: widget.isLableStyle
                ? MyAppFontStyles.openSans15W400BlueColor
                : MyAppFontStyles.openSans14W600
            // const TextStyle(fontWeight: FontWeight.bold),
            ),
        const SizedBox(height: 8.0),
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            border: Border.all(
                color: isClick ? myButtonBlueColor : myButtonGrayColor),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextFormField(
            focusNode: _focusNode,
            onTap: () {
              // Set focus when the text field is tapped
              FocusScope.of(context).requestFocus(_focusNode);
            },
            onChanged: (value) {},
            controller: widget.controller, // controller
            validator: widget.validator, // validator
            obscureText: (widget.label == 'Password' ||
                    widget.label == 'Confirm password')
                ? isObscure
                : false,
            decoration: InputDecoration(
                prefixIconColor: myEmailLockIconGrayColor,
                prefixIcon: (widget.label == 'Email Address' &&
                        widget.isPrefix == true)
                    ? const Icon(Icons.email_outlined)
                    : ((widget.label == 'New Password' ||
                                widget.label == 'Confirm Password') &&
                            widget.isPrefix == true)
                        ? const Icon(Icons.lock_outline)
                        : null,
                suffixIconColor: myEyeIconGrayColor,
                suffixIcon: (widget.label == 'Password' ||
                        widget.label == 'Confirm password')
                    ? IconButton(
                        icon: Icon(
                          isObscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            // Toggle visibility when the eye icon is pressed
                            isObscure = !isObscure;
                          });
                        },
                      )
                    : null,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 12.0),
                border: InputBorder.none,
                hintText: widget.hintText, // hint text
                hintStyle: MyAppFontStyles.openSans12W600),
          ),
        ),
      ],
    );
  }
}
