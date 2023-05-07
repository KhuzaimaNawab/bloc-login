import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onpress,
    required this.btnName,
    required this.btnColor,
    this.height = 0,
    this.width= 0,
  });

  final void Function()? onpress;
  final String btnName;
  final Color btnColor;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: btnColor,
      onPressed: onpress,
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Text(
            btnName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
