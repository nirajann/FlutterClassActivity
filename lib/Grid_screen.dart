import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({super.key});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Gridview")),
        backgroundColor: Colors.red,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.red,
            width: double.infinity,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.red,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.red,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.red,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < 5; i++)
                  SizedBox(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        MotionToast.success(description: Text("$i is clicked"))
                            .show(context);
                      },
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: Text('Button $i'),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
