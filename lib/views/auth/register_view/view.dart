import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/design/app_button.dart';
import 'package:untitled3/core/design/app_input.dart';
import 'package:untitled3/core/logic/help_navigator.dart';


import '../../sheets/cities.dart';
import '../login_view/view.dart';

import 'bloc.dart';
import 'events.dart';
import 'states.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) {
          RegisterBloc bloc = BlocProvider.of(context);
          return SafeArea(
            child: Form(
              key: bloc.formKey,
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
                    "يمكنك تسجيل حساب جديد الأن",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  AppInput(
                    controller: bloc.nameController,
                    validator: (value) {
                      if(value!.toString().isEmpty){
                        return "بارجاء ادخال اسم المستخدم";
                      }return null;

                    },

                    labelText: "اسم المستخدم",
                    icon: "assets/icon/User.png",
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
                  StatefulBuilder(
                    builder: (context, setState) => GestureDetector(
                        onTap: () async {
                          var result = await showModalBottomSheet(
                              context: context,
                              builder: (context) => const CitiesSheet());
                          if (result != null) {
                            bloc.selectedModel = result;
                            setState(() {});
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AbsorbPointer(

                                absorbing: true,

                                child: AppInput(
                                  validator: (value) {
                                    if(bloc.selectedModel==null){
                                    return  "بارجاء اختيار المدينة";
                                    }return null;
                                  },
                                    paddingBottom: 0,
                                    isEnabled: true,
                                    labelText: bloc.selectedModel?.name ?? "المدينه",
                                    icon: "assets/icon/flag.png"),
                              ),

                            ),
                            if (bloc.selectedModel != null)
                              IconButton(
                                onPressed: () {
                                  bloc.selectedModel = null;
                                  setState(() {});
                                },
                                icon: const Icon(Icons.clear, color: Colors.red),
                              )
                          ],
                        )),
                  ),
                  const SizedBox(height: 16),
                  AppInput(
                    controller: bloc.passwordController,
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
                  ),
                  AppInput(
                    controller: bloc.confirmPasswordController,
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
                      paddingBottom: 24),
                  BlocBuilder(
                    bloc: bloc,
                    builder: (context, state) => AppButton(
                      isLoading: state is RegisterLoadingStates,
                        onPressed:() {
                          bloc.add(RegisterEvent());
                        },
                        text: "تسجيل"
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "لديك حساب بالفعل ؟",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      TextButton(
                          onPressed: () {
                            navigatorTo(const LoginView());
                          },
                          child: const Text("تسجيل الدخول",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 19,
                              ))),

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
