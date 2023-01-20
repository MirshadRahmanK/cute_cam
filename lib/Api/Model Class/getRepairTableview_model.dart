// To parse this JSON data, do
//
//     final allDatum = allDatumFromJson(jsonString);

import 'dart:convert';

AllDatum allDatumFromJson(String str) => AllDatum.fromJson(json.decode(str));

String allDatumToJson(AllDatum data) => json.encode(data.toJson());

class AllDatum {
    AllDatum({
        this.message,
        this.data,
        this.status,
    });

    String? message;
    List<Datum>? data;
    String? status;

    factory AllDatum.fromJson(Map<String, dynamic> json) => AllDatum(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
    };
}

class Datum {
    Datum({
        this.repairId,
        this.name,
        this.phone,
        this.descri,
        this.address,
        this.equipmentName,
        this.date,
    });

    String? repairId;
    String? name;
    String? phone;
    String? descri;
    String? address;
    String? equipmentName;
    DateTime? date;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        repairId: json["repair_id"],
        name: json["name"],
        phone: json["phone"],
        descri: json["descri"],
        address: json["address"],
        equipmentName: json["equipment_name"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "repair_id": repairId,
        "name": name,
        "phone": phone,
        "descri": descri,
        "address": address,
        "equipment_name": equipmentName,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    };
}
