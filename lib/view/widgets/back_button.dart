import 'package:flutter/material.dart';

class back_button extends StatelessWidget {
  const back_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.only(top: 16, left: 16),
      decoration: BoxDecoration(color: Colors.black),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded)),
    );
  }
}