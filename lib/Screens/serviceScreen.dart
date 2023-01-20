import 'dart:convert';

import 'package:camera_selling/Api/Model%20Class/getRepairTableview_model.dart';
import 'package:camera_selling/Screens/complaints_screen.dart';
import 'package:camera_selling/Widgets/headding_txt.dart';
import 'package:camera_selling/const.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

FilePickerResult? result;

class _ServiceScreenState extends State<ServiceScreen> {
  AllDatum _allDatum = AllDatum();
  bool isLoaded = false;
  getTableView() async {
    var response = await http.get(Uri.parse(cameraRepairViewGet));
    _allDatum = AllDatum.fromJson(jsonDecode(response.body));
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTableView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: isLoaded
            ? Scaffold(
              appBar: AppBar(
                backgroundColor: themeColor,
                title: headdingTxt('Complaints'),centerTitle: true,),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.yellow,
                  child: Center(
                    child: Icon(
                      Icons.electrical_services_rounded,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Complaint Registration Form'),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: postNameController,
                                    decoration: InputDecoration(
                                        hintText: 'Name',
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: postNumberController,
                                    decoration: InputDecoration(
                                        hintText: 'phone',
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: postDescriController,
                                    decoration: InputDecoration(
                                        hintText: 'descri',
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: postAddressController,
                                    decoration: InputDecoration(
                                        hintText: 'address',
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: postEnameController,
                                    decoration: InputDecoration(
                                        hintText: 'equipment_name',
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    result =
                                        await FilePicker.platform.pickFiles(
                                      type: FileType.image,
                                    );
                                  },
                                  child: Text("Get Photos"),
                                )
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                postNameController.clear();
                                postNumberController.clear();
                                postDescriController.clear();
                                postAddressController.clear();
                                postEnameController.clear();
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                                child: const Text('Submit'),
                                onPressed: () async {
                                  var headers = {
                                    'Cookie':
                                        'ci_session=dabad6cb0e93ea1ec13ee8a005fc0796356ab393'
                                  };
                                  var request = http.MultipartRequest(
                                      'POST',
                                      Uri.parse(
                                          'https://cashbes.com/photography/apis/camera_repair_demo'));
                                  request.fields.addAll({
                                    'name': postNameController.text,
                                    'phone': postNumberController.text,
                                    'descri': postDescriController.text,
                                    'address': postAddressController.text,
                                    'equipment_name': postEnameController.text
                                  });
                                  request.files.add(
                                      await http.MultipartFile.fromPath(
                                          'image[]',
                                          result!.files.first.path!));
                                  request.headers.addAll(headers);

                                  http.StreamedResponse response =
                                      await request.send();

                                  if (response.statusCode == 200) {
                                    print(
                                        await response.stream.bytesToString());
                                    Fluttertoast.showToast(
                                        msg: "Complaint Submites",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.yellow,
                                        textColor: Colors.black,
                                        fontSize: 16.0);
                                  } else {
                                  

                                  postNameController.clear();
                                  postNumberController.clear();
                                  postDescriController.clear();
                                  postAddressController.clear();
                                  postEnameController.clear();
                                    Fluttertoast.showToast(
                                        msg: "Complaint Submite faild",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.yellow,
                                        textColor: Colors.black,
                                        fontSize: 16.0);
                                  }
                                })
                          ],
                        );
                      },
                    );
                  },
                ),
                body: ListView.builder(
                  itemCount: _allDatum.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        var reponsepost = await http
                            .post(Uri.parse(cameraRepairViewPost), body: {
                          'repair_id': _allDatum.data![index].repairId,
                        });
                        var decodee = jsonDecode(reponsepost.body);

                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ComplintsScreen(
                              number: decodee['data'][0]['phone'].toString(),
                              address: decodee['data'][0]['address'],
                              date: decodee['data'][0]['date'],
                              desrc: decodee['data'][0]['descri'],
                              equipment: decodee['data'][0]['equipment_name'],
                              name: decodee['data'][0]['name'].toString());
                        }));
                      },
                      child: ListTile(
                        title: Text(
                          _allDatum.data![index].name!,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          _allDatum.data![index].equipmentName!,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    );
                  },
                ),
              )
            : Scaffold(
                body: Center(
                  child: CircularProgressIndicator(color: Colors.yellow,),
                ),
              ));
  }
}
