import 'package:flutter/material.dart';
import 'package:students/Grid_screen.dart';
import 'package:students/StudentDetail.dart';
import 'package:students/calculator_screen.dart';
import 'package:students/card_student.dart';
import 'package:students/data.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Nothing App",
      initialRoute: "/",
      routes: {
        "/card": (context) => const CardScreen(),
        "/": (context) => const CalculatorScreen(),
        "/student": (context) => const StudentDetailsScreen(),
        "/grid": (context) => const GridScreen(),
        "/datascreen": (context) => const DataScreen(),
      },
    ),
  );
}

// class Studentsdata extends StatefulWidget {
//   const Studentsdata({super.key});

//   @override
//   State<Studentsdata> createState() => _StudentsdataState();
// }

// class _StudentsdataState extends State<Studentsdata> {
//   final _fnameController = TextEditingController();
//   final _lnameController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _addressController = TextEditingController();

//   String? gender = "Male";
//   final _dropdownController = DropdownEditingController(value: 'Kathmandu');
//   // String? gender;
//   String dropdownvalue = 'Baktapur';

//   // List of items in our dropdown menu
//   var cities = [
//     "Kathmandu",
//     "Pokhara",
//     "Chitwan",
//     "Bhaktapur",
//   ];

//   List<Student>? lstStudents = [];

//   void _addStudentToList(Student student) {
//     lstStudents!.add(student);
//   }

//   final formGlobalKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text("Students data"),
//         ),
//         backgroundColor: Colors.red,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(10, 30, 10, 8),
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 controller: _fnameController,
//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(20.0),
//                         ),
//                         borderSide: BorderSide(
//                           color: Colors.red,
//                         )),
//                      labelText: 'First Name',
//                     hintText: 'First Name',),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter first name';
//                   } else {
//                     return null;
//                   }
//                 },
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 controller: _lnameController,
//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(20.0),
//                         ),
//                         borderSide: BorderSide(
//                           color: Colors.red,
//                         )),
//                     labelText: "lastname"),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter last name';
//                   } else {
//                     return null;
//                   }
//                 },
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.number,
//                 controller: _ageController,
//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(20.0),
//                         ),
//                         borderSide: BorderSide(
//                           color: Colors.red,
//                         )),
//                     labelText: "age"),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter age';
//                   } else {
//                     return null;
//                   }
//                 },
//               ),

//               const SizedBox(
//                 height: 10,
//               ),
//               ListTile(
//                 title: const Text('Male'),
//                 leading: Radio<String>(
//                   value: 'Male',
//                   groupValue: gender,
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value;
//                     });
//                   },
//                 ),
//               ),
//               ListTile(
//                 title: const Text('Female'),
//                 leading: Radio<String>(
//                   value: 'Female',
//                   groupValue: gender,
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value;
//                     });
//                   },
//                 ),
//               ),
//               ListTile(
//                 title: const Text('Others'),
//                 leading: Radio<String>(
//                   value: 'Others',
//                   groupValue: gender,
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value;
//                     });
//                   },
//                 ),
//               ),
//               TextFormField(

//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(20.0),
//                         ),
//                         borderSide: BorderSide(
//                           color: Colors.red,
//                         )),
//                     labelText: "Description"),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               TextDropdownFormField(
//                 controller: _dropdownController,
//                 options: cities,
//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     suffixIcon: Icon(Icons.arrow_drop_down),
//                     labelText: "Select your city"),
//               ),
//               // DropdownButton(
//               //   // Initial Value
//               //   value: dropdownvalue,

//               //   // Down Arrow Icon
//               //   icon: const Icon(Icons.keyboard_arrow_down),

//               //   // Array list of items
//               //   items: items.map((String items) {
//               //     return DropdownMenuItem(
//               //       value: items,
//               //       child: Text(items),
//               //     );
//               //   }).toList(),
//               //   // After selecting the desired option,it will
//               //   // change button value to selected value
//               //   onChanged: (String? newValue) {
//               //     setState(() {
//               //       dropdownvalue = newValue!;
//               //     });
//               //   },
//               // ),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                     onPressed: () {
//                       if (formGlobalKey.currentState!.validate()) {
//                         Student student = Student(
//                           fname: _fnameController.text,
//                           lname: _lnameController.text,
//                           age: int.parse(_ageController.text),
//                           address: _addressController.text,
//                           gender: gender,
//                           city: _dropdownController.value,
//                         );

//                         _addStudentToList(student);
//                         debugPrint(lstStudents!.length.toString());
//                         print("nirajan");
//                       }
//                     },
//                     child: const Text("Save Students")),
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                     onPressed: () {
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => const DataScreen()),
//                       // );
//                       Navigator.pushNamed(context, '/datascreen',
//                           arguments: lstStudents);
//                     },
//                     child: const Text("Display Students")),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
