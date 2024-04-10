import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomProfileEditField extends StatefulWidget {
  final String label;
  final Function() onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Icon prefixIcon;

  const CustomProfileEditField({
    super.key,
    required this.label,
    required this.onChanged,
    required this.controller,
    required this.validator,
    required this.prefixIcon,
  });

  @override
  State<CustomProfileEditField> createState() => _CustomProfileEditFieldState();
}

class _CustomProfileEditFieldState extends State<CustomProfileEditField> {
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
            style: MyAppFontStyles.openSans15W400BlueColor            // const TextStyle(fontWeight: FontWeight.bold),
            ),
        const SizedBox(height: 8.0),
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
                color: isClick ? myButtonBlueColor : myprofileTextFieldBorderGrayColor),
            borderRadius: BorderRadius.circular(5),
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
            decoration: InputDecoration(
                prefixIconColor: myEmailLockIconGrayColor,
                prefixIcon: widget.prefixIcon,
                suffixIconColor: myEyeIconGrayColor,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 12.0),
                border: InputBorder.none,
                hintStyle: MyAppFontStyles.openSans12W600),
          ),
        ),
      ],
    );
  }
}
