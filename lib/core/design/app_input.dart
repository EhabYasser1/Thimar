import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final String? labelText, icon;
  final bool isPhone, isPassword, isEnabled;
  final double paddingBottom;
  final FormFieldValidator? validator;
  final TextEditingController? controller;

  const AppInput(
      {super.key,
      required this.labelText,
      required this.icon,
      this.isPhone = false,
      this.isPassword = false,
      this.paddingBottom = 16,
      this.isEnabled = true,
      this.validator,
      this.controller});

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool passwordIsHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.paddingBottom),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        enabled: widget.isEnabled,
        obscureText: passwordIsHidden && widget.isPassword,
        decoration: InputDecoration(
          labelText: widget.labelText,
          icon: widget.isPhone
              ? Container(
                  height: 60,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xff707070))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/image/sudia.png",
                          width: 32, height: 20),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "+966",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                )
              : null,
          prefixIcon: Image.asset(widget.icon!),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    passwordIsHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    passwordIsHidden = !passwordIsHidden;
                    setState(() {});
                  },
                )
              : null,
        ),
      ),
    );
  }
}
