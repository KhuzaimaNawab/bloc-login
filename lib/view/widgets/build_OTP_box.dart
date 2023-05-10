import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildOTPBox extends StatelessWidget {
  const BuildOTPBox({
    super.key,
    required this.color, required this.controller,
  });

  final Color color;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 64,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: color),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Center(
        child: TextField(
          controller: controller,
          onChanged: (val) {
            if (val.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.titleLarge,
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: '',
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    );
  }
}
