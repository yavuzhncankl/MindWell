import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mindwell/sigaraPage/2.dart';
import 'package:mindwell/sigaraPage/3.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final _formKey = GlobalKey<FormState>();
  DataModel? _data;
  DateTime? _quitDate;
  TimeOfDay? _quitTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: const Text('Quit Smoking', style: TextStyle(fontSize: 15)),
          flexibleSpace: Container(
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              gradient: LinearGradient(colors: [
                Color(0xFFC69C6D),
                Color(0xFFC69C6D),
              ]),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 75, vertical: 15),
                      backgroundColor: const Color(0xFFE0B822),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          setState(() {
                            _quitDate = selectedDate;
                          });
                        }
                      });
                    },
                    child: Text(_quitDate != null
                        ? DateFormat.yMMMd().format(_quitDate!)
                        : 'Select Quit Date'),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 75, vertical: 15),
                      backgroundColor: const Color(0xFFE0B822),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((selectedTime) {
                        if (selectedTime != null) {
                          setState(() {
                            _quitTime = selectedTime;
                          });
                        }
                      });
                    },
                    child: Text(_quitTime != null
                        ? _quitTime!.format(context)
                        : 'Select Quit Time'),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Cigarettes per Day'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter number of cigarettes';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _data = DataModel(
                        quitTime: _quitTime!,
                        quitDate: _quitDate!,
                        cigarettesPerDay: int.parse(value!),
                        priceOfaPacketOfCigarettes: int.parse(value),
                        numberofcigarettesperpack: int.parse(value),
                        thelengthoftimeyousmokeonecigarette: int.parse(value),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Price of a packet of cigarettes'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter price of a packet of cigarettes';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _data = DataModel(
                        quitTime: _quitTime!,
                        quitDate: _quitDate!,
                        cigarettesPerDay: int.parse(value!),
                        priceOfaPacketOfCigarettes: int.parse(value),
                        numberofcigarettesperpack: int.parse(value),
                        thelengthoftimeyousmokeonecigarette: int.parse(value),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Number of cigarettes per pack'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter number of cigarettes per pack';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _data = DataModel(
                        quitTime: _quitTime!,
                        quitDate: _quitDate!,
                        cigarettesPerDay: int.parse(value!),
                        priceOfaPacketOfCigarettes: int.parse(value),
                        numberofcigarettesperpack: int.parse(value),
                        thelengthoftimeyousmokeonecigarette: int.parse(value),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText:
                            'The length of time you smoke one cigarette'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the length of time you smoke one cigarette';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _data = DataModel(
                        quitTime: _quitTime!,
                        quitDate: _quitDate!,
                        cigarettesPerDay: int.parse(value!),
                        priceOfaPacketOfCigarettes: int.parse(value),
                        numberofcigarettesperpack: int.parse(value),
                        thelengthoftimeyousmokeonecigarette: int.parse(value),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 80),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      backgroundColor: const Color(0xFFE0B822),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _data!.quitDate = _quitDate!;
                        _data!.quitTime = _quitTime!;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SavedPage(data: _data!),
                          ),
                        );
                      }
                    },
                    child: const Text('Save', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
