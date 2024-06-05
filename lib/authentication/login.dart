import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mindwell/authentication/auth_controller/authControllerProvider.dart';
import 'package:mindwell/authentication/register_page.dart';
import 'package:mindwell/config/router/get_x.dart';
import 'package:mindwell/homepage/homePage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GenelController genelController = Get.put(GenelController());
  bool sifre_gozukme = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(sifre_gozukme);
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/lrbackgroun.jpg'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 150,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: '   Email',
                        hintStyle: TextStyle(fontSize: 20),
                        icon: Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password is required";
                              }
                              return null;
                            },
                            obscureText: sifre_gozukme,
                            decoration: const InputDecoration(
                              hintText: '   Password',
                              hintStyle: TextStyle(
                                fontSize: 20,
                              ),
                              icon: Icon(
                                Icons.key_outlined,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              sifre_gozukme = !sifre_gozukme;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye,
                              color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ref
                                .read(authControllerProvider)
                                .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then(
                              (value) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                );
                              },
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.black,
                            fixedSize: const Size(200, 20)),
                        child: const Center(child: Text('Login')),
                      );
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: const Text(
                      "or",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RegisterPage())),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.black,
                          fixedSize: const Size(300, 20)),
                      child: const Center(
                          child: Text('Dont have an account?  Sign Up'))),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
