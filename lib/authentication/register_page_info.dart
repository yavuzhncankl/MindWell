import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindwell/authentication/auth_controller/authControllerProvider.dart';
import 'package:mindwell/authentication/login.dart';
import 'package:mindwell/homepage/homePage.dart';
import 'package:mindwell/models/user_model.dart';

class RegisterPageInfo extends StatelessWidget {
  const RegisterPageInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterFormInfo(email: ''),
    );
  }
}

class RegisterFormInfo extends StatefulWidget {
  const RegisterFormInfo({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;

  @override
  State<RegisterFormInfo> createState() => _RegisterFormInfoState();
}

class _RegisterFormInfoState extends State<RegisterFormInfo> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _birthDayController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _birthDayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 30,
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/logo.png')),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 55, color: Colors.white),
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
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "name is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: '   Name',
                        hintStyle: TextStyle(fontSize: 20)),
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
                  child: TextFormField(
                    controller: _surnameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "surname is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: '   Surname',
                        hintStyle: TextStyle(fontSize: 20)),
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
                  child: TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "username is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: '   username',
                        hintStyle: TextStyle(fontSize: 20)),
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
                  child: TextFormField(
                    controller: _birthDayController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "birth day is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: '   Date Of Birth',
                        hintStyle: TextStyle(fontSize: 20)),
                  ),
                ),
                Container(
                  height: 30,
                ),
                Consumer(builder: (context, ref, child) {
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        UserModel userModel = UserModel(
                            name: _nameController.text,
                            surname: _surnameController.text,
                            email: widget.email,
                            username: _usernameController.text,
                            birthDay: _birthDayController.text);
                        ref
                            .read(authControllerProvider)
                            .storeUserInfoToFirebase(userModel)
                            .then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                )));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 154, 139, 224),
                        foregroundColor: Colors.black,
                        fixedSize: const Size(200, 20)),
                    child: const Text('CREATE'),
                  );
                }),
                const Text('Do you have an account'),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      )),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 154, 139, 224),
                      foregroundColor: Colors.black,
                      fixedSize: const Size(200, 20)),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
