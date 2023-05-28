import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum6/bloc/login/login_cubit.dart';
import 'package:praktikum6/ui/splash.dart';
import 'package:praktikum6/utils/routes.dart';
import 'bloc/register/register_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit())
      ],
      child: MaterialApp(
        title: "Praktikum 6",
        debugShowCheckedModeBanner: false,
        navigatorKey: NAV_KEY,
        onGenerateRoute: generateRoute,
        home: SplashScreen(),
      ),
    );
  }
}
