import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum6/bloc/login/login_cubit.dart';

import '../utils/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
          child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginLoading) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text('Loading..')));
                }
                if (state is LoginFailure) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                      content: Text(state.msg),
                      backgroundColor: Colors.red,
                    ));
                }
                if (state is LoginSuccess) {
                  // context.read<AuthCubit>().loggedIn();
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                      content: Text(state.msg),
                      backgroundColor: Colors.green,
                    ));
                  Navigator.pushNamedAndRemoveUntil(
                      context, rHome, (route) => false);
                }
              },
            child: ListView(
              children: [
                Text("Login", style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xff3D4DE0)
                ),),
                SizedBox(height: 15,),
                Text("Silahkan masukan e-mail dan password anda", style: TextStyle(
                    fontSize: 16,
                ),),
                SizedBox(height: 25,),
                Text("e-mail", style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold
                ),),
                TextFormField(
                  controller: emailEdc,
                ),
                SizedBox(height: 10,),
                Text("password", style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold
                ),),
                TextFormField(
                  controller: passEdc,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(passInvisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          passInvisible = !passInvisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !passInvisible,
                ),
                SizedBox(height: 50,),
                ElevatedButton(onPressed: (){
                  context
                      .read<LoginCubit>()
                      .login(email: emailEdc.text, password: passEdc.text);
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff3D4DE0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Text("Login", style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white
                    ),)),
                SizedBox(height: 25,),
                Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Menengahkan elemen horizontal
                      children: [
                        Text("Belum punya akun ?"),
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context, '/register');
                        },
                            child: Text("Daftar", style: TextStyle(
                                fontWeight: FontWeight.bold,
                              color: Color(0xff3D4DE0)
                            ),))
                      ],
                )

              ],
            ),
          ),
        ),
    );
  }
}
