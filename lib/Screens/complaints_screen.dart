import 'package:camera_selling/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ComplintsScreen extends StatefulWidget {
  String name;
  String number;
  String desrc;
  String address;
  String equipment;
  String date;
  ComplintsScreen({required this.name,required this.number,required this.desrc,required this.address,required this.equipment,required this.date});

  @override
  State<ComplintsScreen> createState() => _ComplintsScreenState();
}

class _ComplintsScreenState extends State<ComplintsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: themeColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Name :${widget.name}'),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Phone Number :${widget.number}'),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Description :${widget.desrc}'),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Address :${widget.address}'),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Equipment :${widget.equipment}'),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Date :${widget.date}'),
              ),
            ],
          ),
        ));
  }
}
