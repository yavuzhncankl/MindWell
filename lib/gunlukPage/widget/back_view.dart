import 'package:flutter/material.dart';
import '../constants.dart';

class BackView extends StatefulWidget {
  final int monthIndex;
  const BackView({
    Key? key,
    required this.monthIndex,
  }) : super(key: key);

  @override
  _BackViewState createState() => _BackViewState();
}

class _BackViewState extends State<BackView> {
  TextEditingController _noteController = TextEditingController();
  String? _selectedDate; // _selectedDate değişkenini burada tanımlıyoruz

  Map<String, String> _notes = {};

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _saveNote() {
    String note = _noteController.text;
    String selectedDate = '${widget.monthIndex}/$_selectedDate';
    _notes[selectedDate] = note;
    print('Selected Date: $selectedDate, Note: $note');
    _noteController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                '${widget.monthIndex}',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.grey,
                ),
              ),
              Text(
                months[widget.monthIndex]!.keys.toList()[0],
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: months[widget.monthIndex]!.values.toList()[0],
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: (_, i) {
                    int day = i + 1;
                    String cDay = day < 10 ? '0$day' : '$day';
                    String cMonth = widget.monthIndex < 10
                        ? '0${widget.monthIndex}'
                        : '${widget.monthIndex}';
                    DateTime date = DateTime.parse('2024-$cMonth-$cDay');
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDate = '$day';
                          String selectedDate =
                              '${widget.monthIndex}/$_selectedDate';
                          _noteController.text = _notes[selectedDate] ?? '';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedDate == '$day'
                              ? Colors.blue.withOpacity(0.3)
                              : date.weekday == DateTime.sunday
                                  ? Colors.red.withOpacity(0.3)
                                  : date.weekday == DateTime.saturday
                                      ? Colors.blue.withOpacity(0.3)
                                      : Colors.transparent,
                        ),
                        child: Text(
                          '$day',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedDate == '$day'
                                ? Colors.blue
                                : date.weekday == DateTime.sunday
                                    ? Colors.red
                                    : date.weekday == DateTime.saturday
                                        ? Colors.blue
                                        : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (_selectedDate != null)
                Column(
                  children: [
                    TextField(
                      controller: _noteController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Write your note here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.cyan,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.cyan,
                            width: 2.0,
                          ),
                        ),
                        fillColor: Colors.cyan,
                        filled: true,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _saveNote,
                      child: Text('Save Note'),
                    ),
                  ],
                ),
              if (_selectedDate == null)
                Text(
                  'Select a date to write',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
