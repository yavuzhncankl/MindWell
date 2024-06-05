import 'package:flutter/material.dart';
import 'package:mindwell/widgets/app_bar.dart';
import 'package:mindwell/widgets/bottom_bar.dart';

class BlogePage extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  BlogePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar1(),
        bottomNavigationBar: bottomBar(context),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Image.asset('assets/logo.png'),
                const SizedBox(height: 20),
                const Text(
                  '"Başarının sırrı, pes etmeden önce tekrar tekrar denemektir." - Thomas A. Edison',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Beğen'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Paylaş'),
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
