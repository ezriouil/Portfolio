import 'package:flutter/material.dart';

import '../../utils/constants/custom_sizes.dart';
import '../../utils/state/custom_state.dart';

class CustomTextField extends CustomState{

  final String? Function(String? value)? validator;
  final TextEditingController controller;
  final String hint;
  final IconData? icon;
  final Widget? trailing;
  final int? maxLength;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool enabled, obscureText, readOnly;

  const CustomTextField(
      {
        super.key,
        required this.controller,
        required this.hint,
        this.icon,
        this.keyboardType = TextInputType.text,
        this.textInputAction = TextInputAction.next,
        this.enabled = true,
        this.maxLength,
        this.onChanged,
        this.obscureText = false,
        this.readOnly = false,
        this.validator,
        this.trailing
      });

  @override
  Widget execute(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      cursorColor: darkLightColor(context),
      cursorOpacityAnimates: true,
      cursorRadius: const Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
      decoration: InputDecoration(
        fillColor: grayColor(context).withValues(alpha: 0.1),
        filled: true,
        hintText: hint,
        contentPadding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS * 1.25),
        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: grayColor(context)),
        prefixIcon: Icon(icon, color: grayColor(context), size: 16.0),
        counterStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 8),
        suffixIcon: trailing,
      ),
      minLines: 1,
      maxLines: 1,
      maxLength: maxLength,
      enabled: enabled,
      readOnly: readOnly,
      autocorrect: false,
      obscureText: obscureText,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}