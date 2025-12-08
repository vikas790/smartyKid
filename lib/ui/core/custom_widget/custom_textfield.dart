import 'package:flutter/material.dart';
import 'package:smartykids/ui/core/base/base_widget.dart';
import 'package:smartykids/ui/core/themes/app_color.dart';
import 'package:smartykids/utils/custom_screen_util.dart';
import 'package:smartykids/utils/padding_extension.dart';



class CustomTextField extends BaseWidget {
  TextEditingController controller;
  TextInputType keyboardType = TextInputType.text;
  TextInputAction textInputAction = TextInputAction.done;
  String title;
  Widget? suffixIcon;
  Widget? prefixIcon;
  Function(String)? onChanged;
  bool readOnly;
  int maxLength;
  int minLines;
  int maxLines;
  bool isObscure;
  bool isPhoneNumber;
  bool isEmailAndPhoneBoth;
  Function(String)? onSelectCountryCode;
  String? initialCountryCode;
  VoidCallback? onTap;
  FocusNode? focusNode;
  VoidCallback? onSubmitted;
  Color? textColor;

  CustomTextField({
    super.key,
    required this.controller,
    required this.title,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.readOnly = false,
    this.maxLength = 50,
    this.minLines = 1,
    this.maxLines = 1,
    this.suffixIcon,
    this.prefixIcon,
    this.isObscure = false,
    this.isPhoneNumber = false,
    this.isEmailAndPhoneBoth = false,
    this.onSelectCountryCode,
    this.initialCountryCode,
    this.onTap,
    this.focusNode,
    this.onSubmitted,
    this.textColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPhoneNumber = false;

  @override
  void didUpdateWidget(CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Force rebuild if textColor or initialCountryCode changes
    if (oldWidget.textColor != widget.textColor ||
        oldWidget.initialCountryCode != widget.initialCountryCode) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = widget.textColor ?? AppColorsData.black050506.value;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColorsData.gray9197A1.value, width: 1.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: TextField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: widget.isObscure,
          readOnly: widget.readOnly || widget.onTap != null,
          cursorHeight: widget.onTap != null ? 0 : 16.h,
          cursorColor: Colors.black,
          maxLength: widget.maxLength,
          enabled: !widget.readOnly && widget.onTap == null,
          onChanged: (value) {
            widget.onChanged?.call(value);
            if (widget.isEmailAndPhoneBoth) {
              checkIsEmailOrPhone(value);
            }
          },
          onSubmitted: (value) {
            if (widget.textInputAction == TextInputAction.next) {
              // Move to next field
              FocusScope.of(context).nextFocus();
            } else if (widget.textInputAction == TextInputAction.done) {
              // Hide keyboard and call onSubmitted callback if provided
              FocusScope.of(context).unfocus();
              widget.onSubmitted?.call();
            }
          },
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          style: widget.setFont(widget.poppinsTightRegular400, fontSize: 14, color: textColor),
          decoration: InputDecoration(
            labelText: widget.title,
            // labelStyle: widget.setFont(widget.poppinsTightRegular400, fontSize: 12, color: AppColorsData.gray464B53.value),
            labelStyle: widget.setFont(widget.poppinsTightRegular400, fontSize: 14, color: AppColorsData.black050506.value),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            suffixIconConstraints: BoxConstraints(minHeight: 24.h, minWidth: 24.w),
            prefixIconConstraints: BoxConstraints(minHeight: 24.h, minWidth: 24.w),
            counterText: '',
            suffixIcon: widget.suffixIcon?.withPadding(EdgeInsets.symmetric(horizontal: 12.w)),
            prefixIcon: getPrefixIcon(),
          ),
        ),
      ),
    );
  }

  void checkIsEmailOrPhone(String value) {
    final emailPattern = RegExp(r'^[\w\.\-]+@[\w\-]+\.[a-zA-Z]{2,}$');
    final phonePattern = RegExp(r'^\d{0,15}$'); // digits only

    if (value.isEmpty) {
      _isPhoneNumber = false;
      setState(() {});
      return;
    }

    if (emailPattern.hasMatch(value)) {
      _isPhoneNumber = false;
    } else if (phonePattern.hasMatch(value)) {
      _isPhoneNumber = true;
    } else {
      _isPhoneNumber = false;
    }

    setState(() {});
  }

  Widget? getPrefixIcon() {
    if (widget.isPhoneNumber || _isPhoneNumber) {
      // return CountryCodeSelectionView(
      //   key: ValueKey(widget.initialCountryCode ?? 'no_country'),
      //   onSelectCountryCode: (countryCode) {
      //     widget.onSelectCountryCode?.call(countryCode);
      //   },
      //   initialCountryCode: widget.initialCountryCode,
      // ).withSymmetricPadding(horizontal: 8.w);
    } else if (widget.prefixIcon != null) {
      return widget.prefixIcon!.withSymmetricPadding(horizontal: 12.w);
    } else {
      return null;
    }
  }
}