import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:students/studentsData.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  List<Student> lstStudent = [];

  @override
  void didChangeDependencies() {
    lstStudent = ModalRoute.of(context)!.settings.arguments as List<Student>;
    super.didChangeDependencies();
  }

  @override
  Widget displayCard(String fname, String lname, String address) {
    return InkWell(
      onTap: () {
        MotionToast.success(description: Text("$fname is clicked"))
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
          child: Column(
            children: [
              Center(
                  child: Text(
                '$fname +" "+ $lname',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
              Center(
                  child: Text(
                address,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Center(child: Text("Student Data")),
          // leading: Builder(
          //   builder: (BuildContext context) {
          //     return IconButton(
          //       icon: const Icon(Icons.menu),
          //       onPressed: () {
          //         Scaffold.of(context).openDrawer();
          //       },
          //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          //     );
          //   },
          // ),
        ),
        body: lstStudent.isNotEmpty
            ? ListView.builder(
                itemCount: lstStudent.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      MotionToast.success(
                              description: Text(
                                  "${lstStudent[index].fname!} is clicked"))
                          .show(context);
                    },
                    child: SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Card(
                        elevation: 20,
                        color: Colors.lightBlue,
                        child: ListTile(
                          leading: const Icon(
                            Icons.verified_user,
                            color: Colors.white,
                          ),
                          title: Text(
                            "${lstStudent[index].fname!} ${lstStudent[index].lname!}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(lstStudent[index].address!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          trailing: Wrap(
                            spacing: 8,
                            children: [
                              Card(
                                elevation: 20,
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: IconButton(
                                    onPressed: () {},
                                    color: Colors.white,
                                    icon: const Icon(Icons.delete)),
                              ),
                              SizedBox(
                                child: Card(
                                  elevation: 20,
                                  color: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: IconButton(
                                      onPressed: () {},
                                      color: Colors.white,
                                      icon: const Icon(Icons.add)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                // ListTile(
                //   leading: const Icon(Icons.female),
                //   title: const Text("Nitesh yadav"),
                //   subtitle: const Text("Kathmandu, nepal"),
                //   trailing: Wrap(
                //     spacing: 8,
                //     children: [
                //       IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                //       IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                //     ],
                //   ),
                // ),
                // ListTile(
                //   leading: const Icon(Icons.girl),
                //   title: const Text("Shooobham Gadtaula"),
                //   subtitle: const Text("Kathmandu, nepal"),
                //   trailing: Wrap(
                //     spacing: 8,
                //     children: [
                //       IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                //       IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                //     ],
                //   ),
                // ),
              )
            : const Center(
                child: Text("no data"),
              ));
  }
}
