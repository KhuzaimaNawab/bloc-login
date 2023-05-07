import 'package:bloc_login/view/screen/login_email_screen.dart';
import 'package:bloc_login/view/screen/login_phone_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final Color color = const Color.fromARGB(255, 242, 120, 107);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
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
                  Icon(CupertinoIcons.home, color: Colors.black),
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
                    'Welcome to home Page',
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
              'Select the Following Options',
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                onpress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginEmail()),
                  );
                },
                btnName: 'Login with Email/Password',
                btnColor: color,
                height: 40,
                width: size.width,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                onpress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginPhone()),
                  );
                },
                btnName: 'Login with Phone Number',
                btnColor: color,
                height: 40,
                width: size.width,
              ),
            ),
            const SizedBox(
              height: 30,
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
          ],
        ),
      ),
    );
  }
}
