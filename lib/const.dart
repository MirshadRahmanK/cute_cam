import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

Color themeColor = Colors.white;
// Camera Repair form (POST)
String cameraRepairFormPost =
    'https://cashbes.com/photography/apis/camera_repair_demo';

//Api 2 - Camera Repair Table View (GET)
String cameraRepairViewGet =
    'https://cashbes.com/photography/apis/my_repairs_demo';

//Api 3 - Camera Repair Details View (POST)

String cameraRepairViewPost =
    'https://cashbes.com/photography/apis/repair_details_demo';

TextEditingController postNameController = TextEditingController();
TextEditingController postNumberController = TextEditingController();
TextEditingController postDescriController = TextEditingController();
TextEditingController postAddressController = TextEditingController();
TextEditingController postEnameController = TextEditingController();
TextEditingController postProductId = TextEditingController();
