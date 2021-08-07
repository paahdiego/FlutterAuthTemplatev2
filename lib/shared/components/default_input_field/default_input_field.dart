import 'package:auth_template_v2/shared/config/app_sizes.dart';
import 'package:auth_template_v2/theme/theme.dart';
import 'package:auth_template_v2/theme/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DefaultInputField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final Color? backgroundColor;
  final Color? fontColor;

  final EdgeInsets? padding;

  DefaultInputField({
    Key? key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.backgroundColor,
    this.padding,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    final themeController = Provider.of<ThemeController>(context);

    return Container(
      padding: EdgeInsets.only(
        left: sizes.defaultPaddingValue,
        right: sizes.defaultPaddingValue,
        top: 5,
        bottom: 5,
      ),
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor
            : themeController.themeMode == ThemeMode.dark
                ? AppColors.defaultInputBgDark
                : AppColors.defaultInputBgLight,
        borderRadius: sizes.defaultBorderRadius,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: AppColors.primary.withAlpha(150),
            selectionHandleColor: AppColors.primary,
            cursorColor: AppColors.primary,
          ),
        ),
        child: Stack(
          children: [
            TextFormField(
              validator: validator,
              inputFormatters: inputFormatters,
              controller: controller,
              obscureText: obscureText,
              onChanged: onChanged,
              cursorColor: AppColors.primary,
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              keyboardType: keyboardType,
              onFieldSubmitted: onFieldSubmitted,
              textInputAction: textInputAction,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: fontColor != null ? fontColor : null),
              decoration: InputDecoration(
                hintText: hintText,
                counterText: "",
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: fontColor != null ? fontColor : null),
                border: InputBorder.none,
                errorStyle: TextStyle(
                  color: AppColors.primary,
                ),
              ),
            ),
            if (suffixIcon != null)
              Positioned(
                right: 0,
                child: suffixIcon!,
              ),
          ],
        ),
      ),
    );
  }
}
