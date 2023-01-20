// To parse this JSON data, do
//
//     final alldataService = alldataServiceFromJson(jsonString);

import 'dart:convert';

AlldataService alldataServiceFromJson(String str) => AlldataService.fromJson(json.decode(str));

String alldataServiceToJson(AlldataService data) => json.encode(data.toJson());

class AlldataService {
    AlldataService({
        this.message,
        this.data,
        this.status,
    });

    String? message;
    List<AlldataServiceDatum>? data;
    String? status;

    factory AlldataService.fromJson(Map<String, dynamic> json) => AlldataService(
        message: json["message"],
        data: List<AlldataServiceDatum>.from(json["data"].map((x) => AlldataServiceDatum.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
    };
}

class AlldataServiceDatum {
    AlldataServiceDatum({
        this.id,
        this.name,
        this.phone,
        this.descri,
        this.address,
        this.equipmentName,
        this.date,
        this.image,
    });

    String? id;
    String? name;
    String? phone;
    String? descri;
    String? address;
    String? equipmentName;
    DateTime? date;
    Image? image;

    factory AlldataServiceDatum.fromJson(Map<String, dynamic> json) => AlldataServiceDatum(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        descri: json["descri"],
        address: json["address"],
        equipmentName: json["equipment_name"],
        date: DateTime.parse(json["date"]),
        image: Image.fromJson(json["image"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "descri": descri,
        "address": address,
        "equipment_name": equipmentName,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "image": image!.toJson(),
    };
}

class Image {
    Image({
        this.data,
    });

    List<ImageDatum>? data;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        data: List<ImageDatum>.from(json["data"].map((x) => ImageDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ImageDatum {
    ImageDatum({
        this.id,
        this.image,
    });

    String? id;
    String? image;

    factory ImageDatum.fromJson(Map<String, dynamic> json) => ImageDatum(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
    };
}
