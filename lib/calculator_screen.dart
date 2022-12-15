import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final controller = TextEditingController();
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  String oparand = "";
  final clear = TextEditingController();

  final List<String> number = [
    "0",
    "c",
    "/",
    "=",
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "x"
  ];

  add(int num1, int num2) {
    int ans = num1 + num2;
    return ans;
  }

  sub(int num1, int num2) {
    int ans = num1 - num2;
    return ans;
  }

  div(int num1, int num2) {
    return num1 / num2;
  }

  mul(int num1, int num2) {
    int ans = num1 * num2;
    return ans;
  }

  @override
  void dispose() {
    controller.clear();
    if (firstController.text == "") {
      firstController.clear();
    }
  }

  void firstdispose() {
    firstController.clear();
  }

  void seconddispose() {
    secondController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Calculator Screen")),
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            children: [
              TextFormField(
                controller: controller,
                enabled: false,
                textAlign: TextAlign.end,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      borderSide: BorderSide(
                        color: Colors.red,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 3,
                  children: [
                    for (int i = 0; i < number.length; i++)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {});
                          if (number[i] == "c") {
                            dispose();
                          } else if (number[i] == "+") {
                            firstController.text = controller.text;

                            oparand = "+";
                            dispose();
                          } else if (number[i] == "-") {
                            firstController.text = controller.text;

                            oparand = "-";
                            dispose();
                          } else if (number[i] == "/") {
                            firstController.text = controller.text;

                            oparand = "/";
                            dispose();
                          } else if (number[i] == "x") {
                            firstController.text = controller.text;

                            oparand = "x";
                            dispose();
                          } else if (number[i] == "=") {
                            if (oparand == "+") {
                              controller.clear();
                              controller.text = add(
                                      int.parse(firstController.text),
                                      int.parse(secondController.text))
                                  .toString();
                              firstdispose();
                              seconddispose();
                            } else if (oparand == "-") {
                              controller.text = sub(
                                      int.parse(firstController.text),
                                      int.parse(secondController.text))
                                  .toString();
                              firstdispose();
                              seconddispose();
                            } else if (oparand == "/") {
                              controller.text = div(
                                      int.parse(firstController.text),
                                      int.parse(secondController.text))
                                  .toString();
                              firstdispose();
                              seconddispose();
                            } else if (oparand == "x") {
                              controller.text = mul(
                                      int.parse(firstController.text),
                                      int.parse(secondController.text))
                                  .toString();
                              firstdispose();
                              seconddispose();
                            }
                          } else {
                            controller.text += number[i];
                            secondController.text = number[i];
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            fixedSize: const Size(150, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60))),
                        child: Text(
                          number[i],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
