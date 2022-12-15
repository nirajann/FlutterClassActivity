import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget displayCard(String title) {
    return InkWell(
      onTap: () {
        MotionToast.success(description: Text("$title is clicked"))
            .show(context);
      },
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Card(
          elevation: 3,
          color: Colors.amber,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < 100; i++) displayCard("card $i"),
        ],
      ),
    ));
  }
}
