
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget{
  final String text;
  const CustomAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 32.h,
          width: 32.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.r),
            color: Theme.of(context).primaryColor.withOpacity(.14),
          ),
          child: IconButton(
            padding: EdgeInsetsDirectional.only(
              bottom: 2,
            ),
            icon: Image.asset("assets/icon/arrowR.png"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      title: Text(text),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
