import 'package:flutter/material.dart';
import '../../utils/constants/custom_sizes.dart';
import '../../utils/state/custom_state.dart';

class CustomDropdown<T> extends CustomState {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final String hint;
  final IconData? icon;
  final bool enabled;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
    required this.hint,
    this.icon,
    this.enabled = true,
  });

  @override
  Widget execute(BuildContext context) {
    return SizedBox(
      height: CustomSizes.SPACE_BETWEEN_ITEMS * 3,
      child: DropdownButtonFormField<T>(
        initialValue: value,
        items: items,
        onChanged: enabled ? onChanged : null,
        validator: validator,
        decoration: InputDecoration(
          fillColor: darkDarkLightLightColor(context).withValues(alpha: 0.8),
          filled: true,
          hintText: hint,
          contentPadding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
          hintStyle: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: grayColor(context)),
          prefixIcon: icon == null
              ? null
              : Icon(icon, color: grayColor(context), size: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              CustomSizes.SPACE_BETWEEN_ITEMS / 2,
            ),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              CustomSizes.SPACE_BETWEEN_ITEMS / 2,
            ),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              CustomSizes.SPACE_BETWEEN_ITEMS / 2,
            ),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              CustomSizes.SPACE_BETWEEN_ITEMS / 2,
            ),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              CustomSizes.SPACE_BETWEEN_ITEMS / 2,
            ),
            borderSide: BorderSide.none,
          ),
        ),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 11.0,
          fontFamily: "Manrope-Medium",
        ),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: grayColor(context),
          size: 16.0,
        ),
        dropdownColor: darkDarkLightLightColor(context),
        menuMaxHeight: 200,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
