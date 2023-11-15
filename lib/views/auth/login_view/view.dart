
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/design/app_button.dart';
import 'package:untitled3/core/design/app_input.dart';
import 'package:untitled3/core/logic/help_navigator.dart';


import '../forgot_password/view.dart';

import '../register_view/view.dart';
import 'bloc.dart';
import 'events.dart';
import 'states.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) {
          LoginBloc bloc = BlocProvider.of(context);
          return SafeArea(
            child: Form(
              key:bloc.formKey ,
              child: ListView(
                padding: const EdgeInsetsDirectional.only(
                    bottom: 20, top: 20, end: 16, start: 16),
                children: [
                  Image.asset(
                    "assets/image/logo.png",
                    height: 125,
                    width: 130,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Text(
                    "مرحبا بك مرة أخرى",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "يمكنك تسجيل الدخول الأن",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  AppInput(
                    controller:bloc.phoneController,
                      validator: (value) {
                        if(value!.toString().isEmpty){
                          return "بارجاء ادخال رقم الجوال";
                        }else if (value!.toString().length<9){
                          "يجب ان يكون رقم الهاتف مكون من 9 ارقام";
                        }
                        return null;

                      },
                      labelText: "رقم الجوال",
                      icon: "assets/icon/Phone.png",
                      isPhone: true),
                  const SizedBox(
                    height: 16,
                  ),
                  AppInput(
                     controller:bloc.passwordController,
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
                    paddingBottom: 9,
                  ),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                          onPressed: () {
                            navigatorTo(const ForgotView());
                          },
                          child: const Text(
                            "نسيت كلمة المرور ؟",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Color(0xff707070)),
                          ))),
                  const SizedBox(
                    height: 28,
                  ),
                  BlocBuilder(
                    bloc: bloc,
                    builder: (context, state) => AppButton(
                      isLoading: state is LoginLoadingStates,
                      text: "تسجيل الدخول",
                      onPressed: () {
                        bloc.add(LoginEvent());
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ليس لديك حساب ؟",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      TextButton(
                          onPressed: () {
                            navigatorTo(const RegisterView());
                          },
                          child: const Text("تسجيل الان",
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
      ),
    );
  }
}
