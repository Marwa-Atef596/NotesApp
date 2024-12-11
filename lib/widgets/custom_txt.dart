import 'package:flutter/material.dart';

import '../constent/const.dart';

class CustomTextFielf extends StatelessWidget {
  const CustomTextFielf({
    super.key,
    required this.hint,
    this.maxline = 1,
    this.onsaved, this.onchange,
  });
  final String hint;
  final int maxline;
  final void Function(String?)? onsaved;
  final  Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchange,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        } else {
          return null;
        }
      },
      maxLines: maxline,
      cursorColor: KprimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        border: BuildBorder(),
        enabledBorder: BuildBorder(),
        focusedBorder: BuildBorder(KprimaryColor),
      ),
    );
  }

  OutlineInputBorder BuildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
