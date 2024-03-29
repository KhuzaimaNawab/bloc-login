import 'package:bloc_login/blocs/auth_phone/auth_phone_bloc.dart';
import 'package:bloc_login/blocs/internet/internet_bloc.dart';
import 'package:bloc_login/view/screen/register_screen.dart';
import 'package:bloc_login/view/screen/verify_otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_button.dart';

class LoginPhone extends StatelessWidget {
  LoginPhone({super.key});
  final Color color = const Color.fromARGB(255, 242, 120, 107);

  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(CupertinoIcons.person, color: Colors.black),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome to Login Page',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'assets/main.png',
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Enter Your Mobile Number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: color,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Change Number?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: BlocBuilder<AuthPhoneBloc, AuthPhoneState>(
                    builder: (context, state) {
                      return CustomButton(
                          onpress: () {
                            final a = _phoneController.text;
                            final phoneNumber = "+92$a";
                            print(phoneNumber);
                            BlocProvider.of<AuthPhoneBloc>(context)
                                .sendOtp(phoneNumber);
                          },
                          btnName: 'Login',
                          btnColor: color,
                          height: 40,
                          width: size.width);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 36,
                      ),
                    ),
                    Text(
                      '  Or Login with  ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 36,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.network(
                              'https://i.stack.imgur.com/aZqAl.png',
                              fit: BoxFit.cover),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Google',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You Don't have an account? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ));
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
