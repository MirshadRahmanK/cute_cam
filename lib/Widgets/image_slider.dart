import 'package:camera_selling/Dummy%20Datas/camera_dummy_datas.dart';
import 'package:camera_selling/Widgets/add_to_cart_button.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


CameraDummyData _cameraDummyData = CameraDummyData();
Widget ImageSlider() {
  return CarouselSlider.builder(
    itemCount: _cameraDummyData.cameraDummyImage.length,
    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
        Column(
      children: [
        Image(
          height: 150,
          image: NetworkImage(
              _cameraDummyData.cameraDummyImage[itemIndex]),
          fit: BoxFit.cover,
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                    title: Text(
                      _cameraDummyData.cameraDummyName[itemIndex],
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis, color: Colors.black),
                    ),
                    subtitle: Text(
                      '₹ ${_cameraDummyData.cameraDummyPrice[itemIndex]}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    trailing: AddtocartButton(
                        h: 50, w: 50, iconData: Icons.arrow_forward))),
          ),
        )
      ],
    ),
    options: CarouselOptions(
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlay: true,
        enableInfiniteScroll: true,
        height: 300),
  );
}
