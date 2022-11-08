import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Primary text field used through-out the app
class PrimaryTextField extends HookWidget {
  final String? hintTxt;
  final String? initialValue;
  final String? keyName;
  final FormFieldSetter<String>? onSaved;
  final FormFieldSetter<String>? onChanged;
  final TextInputType? textInputType;
  final int? maxLength;
  final int? maxLine;
  final String? label;
  final String? errorText;
  final IconData? prefixIcon;
  final Widget? innerIcon;
  final double? borderRadius;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool? isReadOnly;
  final bool enableBorder;
  final Color? fillColor;
  final TextEditingController? controller;
  final double? labelHeight;
  final bool enable;
  final EdgeInsets? contentPadding;

  // final Function onSaved;

  const PrimaryTextField({
    this.enable = true,
    required this.onSaved,
    this.innerIcon,
    this.label,
    this.maxLine,
    this.initialValue,
    this.borderRadius,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.onChanged,
    this.hintTxt,
    this.keyName,
    this.controller,
    this.fillColor,
    this.labelHeight,
    this.enableBorder = false,
    this.isReadOnly,
    this.isPassword = false,
    this.textInputType,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = useState(isPassword);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    prefixIcon,
                  ),
                ),
              Text(
                '$label',
              ),
            ],
          ),
        if (label != null)
          SizedBox(
            height: labelHeight ?? 10,
          ),
        Container(
          alignment: Alignment.centerLeft,
          child: TextField(
            controller: controller,
            enabled: enable,
            onChanged: onChanged,
            keyboardType: textInputType ?? TextInputType.text,
            obscureText: isPasswordVisible.value,
            style: Theme.of(context).textTheme.bodyText1,
            readOnly: isReadOnly ?? false,
            // enabled: isTextFieldEnabled??true,
            decoration: InputDecoration(
              prefixIcon: innerIcon,
              fillColor: fillColor,
              isDense: true,
              errorText: errorText,
              counterText: "",
              errorMaxLines: 2,
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 10.0),
              // labelText:
              hintText: hintTxt ?? "",
              // hintStyle:Theme.of(context).textTheme.bodyText1 ,
              // "Email or Phone",
              // labelStyle: AppTextStyle.textboxtext,
              filled: true,
              errorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
                borderSide: BorderSide(
                    color: enableBorder
                        ? Theme.of(context).primaryColor
                        : Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
                borderSide: BorderSide(
                  color: enableBorder
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
                borderSide: BorderSide(
                  color: enableBorder
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
                borderSide: BorderSide(
                    color: enableBorder
                        ? Theme.of(context).primaryColor
                        : Colors.transparent),
              ),
              suffixIcon: isPassword
                  ? GestureDetector(
                      onTap: () {
                        isPasswordVisible.value = !isPasswordVisible.value;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Icon(isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ))
                  : Container(
                      padding: const EdgeInsets.all(15),
                      child: suffixIcon ?? const Text('')),
            ),
            maxLines: maxLine ?? 1,
            maxLength: maxLength,
          ),
        ),
      ],
    );
  }
}
