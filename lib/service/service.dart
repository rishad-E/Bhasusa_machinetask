import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:machine_tasknew/model/model.dart';
import 'package:machine_tasknew/utils/const/api.dart';

class ServiceClass {
  Dio dio = Dio();
  String path = Apis().baseUrl;

  Future<List<ResponseModel>?> getData() async {
    try {
      
      Response response = await dio.get(path);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        log(data.toString());
        final res = data.map((e) => ResponseModel.fromJson(e)).toList();
        return res;
      }


    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
