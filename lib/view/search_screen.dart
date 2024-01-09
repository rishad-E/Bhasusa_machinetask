import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_tasknew/controller/controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(

        child: GetBuilder<ControllerClass>(
          init: ControllerClass(),
          builder: (controller) {
            return Column(
              children: [
                Container(
                  height: 50,
                  width: 300,
                  // color: Colors.red,
                  child: TextField(

                    onChanged: (enterdWord) {
                      controller.runFilter(enterdWord);
                    },
                  ),
                ),
                Expanded(
                    child: controller.showResult() ??
                        const Center(
                          child:  Text('No Data'),
                        ))
              ],
            );
          },
        ),
      ),
    );
  }
}
