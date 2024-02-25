
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  const AppButton({super.key,this.isLoading= false, required this.text,  this.onPressed, });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    if(widget.isLoading)
      {
        return const Center(child: CircularProgressIndicator());
      }
    return    FilledButton(style: ButtonStyle(),
        onPressed:widget.onPressed,
        child: Text(
          widget.text, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ));
  }
}
