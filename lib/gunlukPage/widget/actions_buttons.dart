import 'package:flutter/material.dart';

class ActionButtons extends StatefulWidget {
  final Function change;
  const ActionButtons({super.key, required this.change});

  @override
  State<ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  bool isFront = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Container(
              width: 160,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30)),
              alignment: Alignment.center,
              child: const Row(
                children: [
                  Icon(Icons.wb_sunny_rounded),
                  SizedBox(width: 10),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bugün',
                        style: TextStyle(
                            color: Colors.pink, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '15 MART 2024',
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ))
                ],
              )),
          const Spacer(),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.pink,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.edit_attributes_outlined,
              color: Colors.white,
            ),
          ),
           SizedBox(
            width: 80,
          ),
          GestureDetector(
            onTap: () {
              widget.change();
              setState(() {
                isFront = !isFront;
              });
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isFront ? Colors.pink : Colors.cyan,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isFront ? Icons.calendar_month_rounded : Icons.undo_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
