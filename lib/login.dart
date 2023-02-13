import 'package:cashrich/button.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final Function(User?) onsingIn;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginPage({super.key, required this.onsingIn});
  void firebaseauth() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    onsingIn(userCredential.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.currency_bitcoin_sharp,
                  size: 80,
                  color: Colors.yellow,
                ),
                const SizedBox(height: 25),
                const Text(
                  'Hello Again!',
                  style: TextStyle(
                    // color: Colors.red,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 34,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome Back , you\'ve been missed !',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                        ),
                        controller: _emailController,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                signInButton(context, () {
                  // FirebaseAuth.instance
                  //     .signInWithEmailAndPassword(
                  //   email: _emailController.text,
                  //   password: _passwordController.text,
                  // )
                  firebaseauth();
                  //     .then((value) {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => CryptoPage()));
                  // });
                }, 'SignIn'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member ? ',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Register Now',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
