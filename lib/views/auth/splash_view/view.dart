import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/views/auth/login_view/view.dart';




class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
   Timer(const Duration(seconds: 3), () {
     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginView(),));
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                bottom: -80,
                left: 60,
                child: Image.asset("assets/image/side.png")),
            Image.asset("assets/image/splash_bg.png", color: const Color(0xff4C8613)),
            Center(
                child: FadeInDownBig(
                  child: FadeIn(
                    child: Image.asset(
              "assets/image/logo.png",
              height: 160,
              width: 160,
            ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
