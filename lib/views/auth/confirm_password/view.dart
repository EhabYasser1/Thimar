import 'package:flutter/material.dart';
import 'package:untitled3/core/design/app_input.dart';
import 'package:untitled3/core/logic/help_navigator.dart';

import '../register_view/view.dart';

class ConfirmPasswordView extends StatefulWidget {
  const ConfirmPasswordView({super.key});

  @override
  State<ConfirmPasswordView> createState() => _ConfirmPasswordViewState();
}

class _ConfirmPasswordViewState extends State<ConfirmPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsetsDirectional.only(
              bottom: 20, top: 20, end: 16, start: 16),
          children: [
            Image.asset(
              "assets/image/logo.png",
              height: 125,
              width: 130,
            ),
            SizedBox(
              height: 28,
            ),
            Text(
              "نسيت كلمة المرور",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "أدخل كلمة المرور الجديدة",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 28,
            ),
            AppInput(
                validator: (value) {
                  if(value!.toString().isEmpty){
                    return "بارجاء ادخال كلمه المرور";
                  }else if (value!.toString().length<6){
                    "كلمه المرور ضعيفه جدا";
                  }
                  return null;

                },
                labelText: "كلمة المرور",
                icon: "assets/icon/Unlock.png",
                isPassword: true,
                paddingBottom: 16),
            AppInput(
                validator: (value) {
                  if(value!.toString().isEmpty){
                    return "بارجاء ادخال كلمه المرور";
                  }else if (value!.toString().length<6){
                    "كلمه المرور ضعيفه جدا";
                  }
                  return null;

                },
                labelText: "كلمة المرور",
                icon: "assets/icon/Unlock.png",
                isPassword: true,
                paddingBottom: 25),
            FilledButton(
                onPressed: () {},
                child: Text(
                  "تغيير كلمة المرور",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 185,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " لديك حساب بالفعل ؟",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                TextButton(
                    onPressed: () {
                      navigatorTo(RegisterView());
                    },
                    child: Text("تسجيل الدخول",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 19,
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
