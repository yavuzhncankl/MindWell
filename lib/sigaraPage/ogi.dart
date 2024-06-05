import 'package:flutter/material.dart';
import 'package:mindwell/homepage/homePage.dart';
import 'package:mindwell/sigaraPage/1.dart';
import 'package:mindwell/widgets/bottom_bar.dart';

// ignore: camel_case_types
class SigaraPage extends StatefulWidget {
  const SigaraPage({super.key});

  @override
  State<SigaraPage> createState() => _SigaraPageState();
}

class _SigaraPageState extends State<SigaraPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: SizedBox(
            height: 200,
            child: Row(
              children: [
                const SizedBox(
                  width: 160,
                ),
                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('assets/1.png'))),
                )
              ],
            ),
          ),
          backgroundColor: const Color(0xFFC69C6D),
        ),
        bottomNavigationBar: bottomBar(context),
        backgroundColor: const Color(0xFFC69C6D),
        body: Center(
          child: Column(
            children: [
              Container(
                width: 250,
                height: 530,
                decoration: const BoxDecoration(
                  color: Color(0xFFC69C6D),
                  image: DecorationImage(
                    image: AssetImage('assets/bg_image.jpeg'),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          width: 47,
          height: 47,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage1()));
            },
            backgroundColor: const Color(0xFFE0B822),
            child: const Icon(
              Icons.settings,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
