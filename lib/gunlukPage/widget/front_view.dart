import 'package:flutter/material.dart';
import '../constants.dart';

class FrontView extends StatelessWidget {
  final int monthIndex;
  const FrontView({
    super.key,
    required this.monthIndex,
  });
   


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 8.0),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$monthIndex',
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
            Text(
              months[monthIndex]!.keys.toList()[0],
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '15/${months[monthIndex]!.values.toList()[0]}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      width: double.infinity,
                      height: 3,
                      color: Colors.white30,
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 03 / 15,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DailyJournal extends StatefulWidget {
  @override
  _DailyJournalState createState() => _DailyJournalState();
}

class _DailyJournalState extends State<DailyJournal> {
  TextEditingController _journalController = TextEditingController();
  List<String> _entries = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _entries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_entries[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _entries.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          TextField(
            controller: _journalController,
            decoration: InputDecoration(
              labelText: 'Merhaba bugün nasılsın bakalım.',
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _entries.insert(0, _journalController.text);
                _journalController.clear();
              });
            },
            style: ElevatedButton.styleFrom(
              primary:
                  Colors.blue.shade300, // Butonun arka plan rengini mavi yap
            ),
            child: Text(
              'Kaydet',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
