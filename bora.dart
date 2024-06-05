import 'package:flutter/material.dart';
import 'package:mindwell/widgets/app_bar.dart';
import 'package:mindwell/widgets/bottom_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // ana part
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EditProfileUI(),
    );
  }
}

class EditProfileUI extends StatefulWidget {
  const EditProfileUI({super.key});

  @override
  _EditProfileUIState createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1(),
      bottomNavigationBar: bottomBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://cdn.pixabay.com/photo/2019/11/03/05/36/portrait-4597853_1280.jpg"))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                              color: Colors.blue),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text("CANCEL",
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text("SAVE",
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.white)),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFild(
      String labelText, String placeholder, bool isPasswordTextFiled) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 30),
    );
  }
}
