// To parse this JSON data, do
// //
// //     final responseModel = responseModelFromJson(jsonString);

// import 'dart:convert';

// List<ResponseModel> responseModelFromJson(String str) => List<ResponseModel>.from(json.decode(str).map((x) => ResponseModel.fromJson(x)));

// String responseModelToJson(List<ResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseModel {
    final int? id;
    final String? column1;

    ResponseModel({
        this.id,
        this.column1,
    });

    factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        id: json["id"],
        column1: json["Column 1"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Column 1": column1,
    };
}
