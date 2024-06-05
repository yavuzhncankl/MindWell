// ignore_for_file: must_be_immutable, non_constant_identifier_names, unnecessary_nullable_for_final_variable_declarations, unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindwell/authentication/login.dart';
import 'package:mindwell/models/user_model.dart';
import 'package:mindwell/profilePage/controller/profile_controller.dart';
import 'package:mindwell/profilePage/extra/controller/more_controller.dart';
import 'package:mindwell/widgets/app_bar.dart';
import 'package:mindwell/widgets/bottom_bar.dart';

class ProfilePage extends ConsumerWidget {
  ProfilePage({super.key});

  bool sifre_gozukme = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SafeArea(
        child: FutureBuilder<UserModel>(
            future: ref.read(ProfileControllerProvider).getUser(),
            builder: (context, Snapshot) {
              if (Snapshot.hasData) {
                final UserModel = Snapshot.data!;

                return Scaffold(
                    bottomNavigationBar: bottomBar(context),
                    appBar: appBar1(),
                    body: ListView(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 400,
                            height: 50,
                            margin: const EdgeInsets.all(10),
                            child: const Center(
                              child: Text(
                                'Profile',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 31),
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 50,
                          child: CircleAvatar(
                            radius: 48,
                            backgroundImage: CachedNetworkImageProvider(
                                UserModel.profilePhoto!),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "@${UserModel.username}",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "${UserModel.name} ${UserModel.surname}",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 154, 139, 224),
                                  foregroundColor: Colors.black,
                                  fixedSize: const Size(200, 20)),
                              child: const Center(child: Text('Edit Account')),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(MoreControllerProvider)
                                    .signOut()
                                    .whenComplete(
                                        () => Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage(),
                                            ),
                                            (route) => false));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 222, 61, 36),
                                  foregroundColor: Colors.black,
                                  fixedSize: const Size(200, 20)),
                              child: const Center(child: Text('Sign Out')),
                            ),
                          ],
                        )
                      ],
                    ));
              } else if (Snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text("something went wrong"),
                );
              }
            }),
      ),
    );
  }
}
