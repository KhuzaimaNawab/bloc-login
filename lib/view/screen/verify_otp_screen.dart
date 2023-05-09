import 'package:bloc_login/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../blocs/internet/internet_bloc.dart';
import '../widgets/build_OTP_box.dart';

class VerifyOTP extends StatelessWidget {
  const VerifyOTP({super.key});
  final Color color = const Color.fromARGB(255, 242, 120, 107);

  @override
  Widget build(BuildContext context) {
    final keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: BlocListener<InternetBloc, InternetState>(
        listener: (context, state) {
          bool didDisconnected = false;
          if (state is InternetNotAvailableState) {
            didDisconnected = true;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('You are not connected to internet'),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is InternetAvailableState &&
              didDisconnected == true) {
            didDisconnected = false;
            print('true');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('You are connected to internet'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Verification Code',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'We have sent the code verification to',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      '+91 9876543210',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Change phone Number?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BuildOTPBox(color: color),
                        BuildOTPBox(color: color),
                        BuildOTPBox(color: color),
                        BuildOTPBox(color: color),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        height: 20,
                        width: 100,
                        onpress: () {},
                        btnName: 'Resend',
                        btnColor: color,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomButton(
                        height: 20,
                        width: 100,
                        onpress: () {},
                        btnName: 'Confirm',
                        btnColor: color,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
