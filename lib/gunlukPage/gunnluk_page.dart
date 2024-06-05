import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mindwell/gunlukPage/widget/actions_buttons.dart';
import 'package:mindwell/gunlukPage/widget/back_view.dart';
import 'package:mindwell/gunlukPage/widget/front_view.dart';
import 'package:mindwell/widgets/app_bar.dart';
import 'package:mindwell/widgets/bottom_bar.dart';

class GunlukPage extends StatefulWidget {
  const GunlukPage({Key? key}) : super(key: key);

  @override
  State<GunlukPage> createState() => _MyAppState();
}

String dropdownValue = list.first;
List<String> list = <String>['2024', '2025', '2026', '2027'];

class _MyAppState extends State<GunlukPage> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isFrontView = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      value: 1.0, // Animasyon başlangıç değeri
    );
  }

  @override
  void dispose() {
    controller.dispose(); // Animasyon kontrolcüsünü düzenli olarak temizleyin
    super.dispose();
  }

  void switchView() {
    if (isFrontView) {
      controller.forward(); // Animasyonu ileri doğru çalıştır
    } else {
      controller.reverse(); // Animasyonu tersine çevirerek çalıştır
    }
    setState(() {
      isFrontView = !isFrontView; // FrontView ve BackView arasında geçiş yap
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1(),
      bottomNavigationBar: bottomBar(context),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            DropdownButton(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 30.0),
            Expanded(
              child: Container(
                color: Colors.grey.shade300,
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: PageView.builder(
                  controller: PageController(
                    initialPage: 0,
                    viewportFraction: 0.78,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (_, i) => AnimatedBuilder(
                    animation: controller,
                    builder: (_, child) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(controller.value * pi),
                        alignment: Alignment.center,
                        child: isFrontView
                            ? FrontView(monthIndex: i + 1)
                            : Transform(
                                transform: Matrix4.rotationY(pi),
                                alignment: Alignment.center,
                                child: BackView(monthIndex: i + 1),
                              ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            ActionButtons(change: switchView),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
