import 'package:bloc_login/blocs/auth_email/auth_email_bloc.dart';
import 'package:bloc_login/blocs/auth_gmail/auth_gmail_bloc.dart';
import 'package:bloc_login/blocs/auth_phone/auth_phone_bloc.dart';
import 'package:bloc_login/blocs/internet/internet_bloc.dart';
import 'package:bloc_login/view/screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetBloc>(
          create: (_) => InternetBloc(),
        ),
        BlocProvider<AuthEmailBloc>(
          create: (_) => AuthEmailBloc(),
        ),
        BlocProvider<AuthGmailBloc>(
          create: (_) => AuthGmailBloc(),
        ),
        BlocProvider<AuthPhoneBloc>(
          create: (_) => AuthPhoneBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Login',
        home: HomePage(),
      ),
    );
  }
}
