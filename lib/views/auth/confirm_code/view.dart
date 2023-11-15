
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled3/core/logic/help_navigator.dart';

import '../register_view/view.dart';
import 'bloc.dart';
import 'events.dart';

class ConfirmCodeView extends StatefulWidget {
  final bool isActive;
  final String phone;
  const ConfirmCodeView({super.key, required this.isActive, required this.phone});

  @override
  State<ConfirmCodeView> createState() => _ConfirmCodeViewState();
}

class _ConfirmCodeViewState extends State<ConfirmCodeView> {
  
  @override
  Widget build(BuildContext context) {
    ConfirmCodeBloc bloc = BlocProvider.of(context);
    return Scaffold(
      body: SafeArea(
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
              height: 28,
            ),
            Text(widget.isActive?"تفعيل الحساب":
              "نسيت كلمة المرور",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            Row(
              children: [
                Text(
                  "${widget.phone} ",
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "تغيير رقم الجوال",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ))
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            BlocBuilder(
               bloc:bloc ,
              builder:(context, state) => Form(
                key: bloc.formKey,
                child: PinCodeTextField(
                  controller: bloc.codeController,
                  appContext: context,
                  length: 4,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "بارجاء ادخال كود التفعيل";
                    } else if (v.length < 3){
                      "يجب ادخال كود مكون من 4 ارقام";
                    }return null;
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(15),
                    fieldHeight: 60,
                    fieldWidth: 70,
                    activeFillColor: Colors.white,
                    inactiveColor: const Color(0xffF3F3F3),
                    selectedColor: Theme.of(context).primaryColor,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
                
              
            ),
            const SizedBox(
              height: 28,
            ),
            FilledButton(
                onPressed: () {
                  if(widget.isActive) {
                    bloc.add(ConfirmCodeEvent(phone: widget.phone));
                  }else{
                    bloc.add(CheckCodeEvent(phone: widget.phone));

                  }


                },
                child: const Text(
                  "تأكيد الكود",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 27,
            ),
            const Center(
                child: Text("لم تستلم الكود ؟\n يمكنك إعادة إرسال الكود بعد",
                    textAlign: TextAlign.center, style: TextStyle(height: 2))),
            const SizedBox(height: 20,),
            bloc.isTimerFinished
                ? Center(
                    child: OutlinedButton(
                        onPressed: () {
                          bloc.isTimerFinished=false;
                          setState(() {});
                        }, child: const Text("إعادة الإرسال")))
                : CircularCountDownTimer(
                    duration: 10,
                    initialDuration: 0,
                    width: 60,
                    height: 60,
                    ringColor: Theme.of(context).primaryColor,
                    fillColor: const Color(0xffD8D8D8),
                    strokeWidth: 2,
                    strokeCap: StrokeCap.round,
                    textStyle: TextStyle(
                        fontSize: 21,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                    textFormat: CountdownTextFormat.MM_SS,
                    isReverse: true,
                    onComplete: () {
                      bloc.isTimerFinished = true;
                      setState(() {});
                    },
                  ),
            const SizedBox(
              height: 185,
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
}
