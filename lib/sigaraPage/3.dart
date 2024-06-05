import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mindwell/sigaraPage/2.dart';

class SavedPage extends StatelessWidget {
  final DataModel data;

  const SavedPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          flexibleSpace: Container(
            height: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              gradient: LinearGradient(
                  colors: [Color(0xFFC69C6D), Color(0xFFC69C6D)]),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 160,
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage(
                          'assets/1.png',
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                  //style: const ButtonStyle(iconColor: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white70,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFE0B822),
                  ),
                  width: 500,
                  height: 30,
                  child: Text(
                    'Quit Date: ${data.quitDate}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFE0B822),
                  ),
                  width: 500,
                  height: 30,
                  child: Text(
                    'Quit Time: ${data.quitTime}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFE0B822),
                  ),
                  width: 500,
                  height: 30,
                  child: Text(
                    'Cigarettes per Day: ${data.cigarettesPerDay}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFE0B822),
                  ),
                  width: 500,
                  height: 30,
                  child: Text(
                    'Price Of a Packet Of Cigarettes: ${data.priceOfaPacketOfCigarettes}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFE0B822),
                  ),
                  width: 500,
                  height: 30,
                  child: Text(
                    'Number of cigarettes per pack: ${data.numberofcigarettesperpack}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFE0B822),
                  ),
                  width: 500,
                  height: 30,
                  child: Text(
                    'The time of you smoke one cigarette: ${data.thelengthoftimeyousmokeonecigarette}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                // Display other data similarly
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                            0xFFE0B822), // Change the color to your desired color
                      ),
                      child: const Text('Delete'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
