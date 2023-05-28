import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
        child: ListView(
          children: [
            Text("Register", style: TextStyle(
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
                      passInvisible = !passInvisible; // Toggle _isPasswordVisible ketika ikon mata ditekan
                    });
                  },
                ),
              ),
              obscureText: !passInvisible, // Atur obscureText berdasarkan _isPasswordVisible
            ),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff3D4DE0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
                child: Text("Register", style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white
                ),)),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text("Sudah punya akun ?"),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, '/login');
                  },
                      child: Text("Login", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3D4DE0)
                      ),))
                ],
            )
          ],
        ),
      ),
    );
  }
}
