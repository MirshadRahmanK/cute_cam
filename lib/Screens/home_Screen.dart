import 'package:camera_selling/Dummy%20Datas/camera_dummy_datas.dart';
import 'package:camera_selling/Dummy%20Datas/dummy_data.dart';
import 'package:camera_selling/Widgets/add_to_cart_button.dart';
import 'package:camera_selling/Widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Widgets/headding_txt.dart';
import '../const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Datas _datas = Datas();
CameraDummyData _cameraDummyData = CameraDummyData();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeColor,
        appBar: AppBar(
          backgroundColor: themeColor,
          elevation: 0,
          leading: Icon(
            Icons.list_outlined,
            color: Colors.black,
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
            SizedBox(
              width: 25,
            ),
            Icon(
              Icons.card_travel,
              color: Colors.black,
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [headdingTxt('Never lose a')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    headdingTxt('moment again'),
                    Text(
                      '.',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ImageSlider(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    headdingTxt('Accessories'),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'See All',
                          style: TextStyle(color: Colors.grey),
                        ))
                  ],
                ),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                    height: 100,
                                    width: 100,
                                    image:
                                        AssetImage('assets/Camera${index}.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    _datas.namedummyDatas[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "₹ ${_datas.PricedummyDatas[index]}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  subtitle: Text(
                                    "Include tax",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  trailing: AddtocartButton(
                                      h: 50,
                                      w: 50,
                                      iconData: Icons.card_travel),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
