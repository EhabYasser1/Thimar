import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/design/app_input.dart';
import 'package:untitled3/core/logic/help_navigator.dart';


import '../register_view/view.dart';
import 'bloc.dart';
import 'events.dart';
import 'states.dart';

class ForgotView extends StatefulWidget {
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) {
          ForgotBloc bloc =BlocProvider.of(context);
          return SafeArea(
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
                  "أدخل رقم الجوال المرتبط بحسابك",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 28,
                ),
                Form(
                  key: bloc.formKey,
                  child: AppInput(
                    controller: bloc.phoneController,
                    validator: (value) {
                      if(
                      value.toString().isEmpty
                      ){
                        return"ادخل رقم الهاتف";
                      }
                      return null;
                    },
                      labelText: "رقم الجوال", icon: "assets/icon/Phone.png",isPhone: true),
                ),
                BlocBuilder<ForgotBloc,ForgotStates>(
                  builder: (context, state) => FilledButton(
                      onPressed: () {
                        bloc.add(ForgotPasswordEvent());
                      },
                      child: Text(
                        "تأكيد رقم الجوال",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(height: 185,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ليس لديك حساب ؟",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                    TextButton(
                        onPressed: () {
                          navigatorTo(RegisterView());
                        },
                        child: Text(
                            "تسجيل الان",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 19,

                            )))
                  ],
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
