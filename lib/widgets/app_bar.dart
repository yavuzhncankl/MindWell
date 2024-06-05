import 'package:flutter/material.dart';

PreferredSize appBar1() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70.0),
    child: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor:
          const Color.fromRGBO(130, 158, 178, 1), // AppBar'ın rengini güncelle
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
          color: Colors.black,
          iconSize: 40,
        ),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(left: 50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/zyro-image (2).png',
                      height: 90,
                      width: 90,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
