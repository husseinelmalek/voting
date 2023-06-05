import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blueGrey,
  required Function() function,
  bool isUpperCase = true,
  required String text,
  Color? textColor,
}) =>
    Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            spreadRadius: 5,
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        color: background,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        onPressed: function,
        child: Text(isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(color: textColor)),
      ),
    );

Widget defaultTextFormField({
  required TextEditingController controller,
  required String hint,
  required IconData prefixIcon,
  IconData? suffixIcon,
  Function()? onSuffixPressed,
  Function()? onTap,
  Function(dynamic)? onSubmit,
  ValueChanged? onChanged,
  required FormFieldValidator validate,
  bool isPassword = false,
  Color? hintColor,
  int? maxChar,
  required TextInputType keyboardType,
  Color? textColor,
}) =>
    TextFormField(
      controller: controller,
      maxLength: maxChar,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: onSuffixPressed, icon: Icon(suffixIcon))
            : null,
        hintStyle: TextStyle(
          color: hintColor,
        ),
      ),
      obscureText: isPassword,
      keyboardType: keyboardType,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      validator: validate,
      style: TextStyle(
        color: textColor,
      ),
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);

void showToast({
  required String text,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      textColor: Colors.white,
      backgroundColor: chooseColor(state),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      fontSize: 16.0,
    );

enum ToastState { error, warning, success }

Color chooseColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.success:
      color = Colors.green;
      break;
    case ToastState.error:
      color = Colors.red;
      break;
    case ToastState.warning:
      color = Colors.amber;
      break;
  }
  return color;
}
