import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_tasknew/model/model.dart';
import 'package:machine_tasknew/service/service.dart';
import 'package:machine_tasknew/utils/widgets/widgets.dart';

class ControllerClass extends GetxController {
  List<ResponseModel>? data;
  List<ResponseModel> foundData = [];
  late List<ResponseModel> allData;

  final TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    ServiceClass().getData().then(
          (value) => {
            data = value,
          },
        );
    update();
  }

  Future assingingAll() async {
    allData = await ServiceClass().getData() as List<ResponseModel>;
    foundData = allData;
    update();
  }

  void runFilter(String enterdWord) {
    List<ResponseModel> result = [];
    if (enterdWord.isEmpty) {
      allData = result;
      update();
    } else {
      result = allData
          .where((element) => element.column1!
              .toLowerCase()
              .contains(enterdWord.toLowerCase().trimRight()))
          .toList();
      foundData = result;
      update();
    }
    update();
  }

  Widget? showResult() {
    if (foundData.isNotEmpty) {
      return ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.grey,
              leading: CircleAvatar(
                radius: 25,
                child: Text(foundData[index].id.toString()),
              ),
              title: Text(foundData[index].column1.toString()),
            );
          },
          separatorBuilder: (context, index) => hBox,
          itemCount: foundData.length);
    }
    return null;
  }
}
