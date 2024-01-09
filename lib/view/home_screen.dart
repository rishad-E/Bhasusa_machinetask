import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_tasknew/controller/controller.dart';
import 'package:machine_tasknew/utils/widgets/widgets.dart';
import 'package:machine_tasknew/view/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const SearchScreen());
              },
              icon: const Icon(
                Icons.search,
                size: 40,
              )),
          wBox
        ],
      ),
      body: SafeArea(
        child: GetBuilder<ControllerClass>(
          init: ControllerClass(),
          builder: (controller) {
            if (controller.data == null || controller.data!.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.separated(
              itemBuilder: (context, index) {
                final data = controller.data![index];
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: Colors.grey,
                    leading: CircleAvatar(
                      radius: 25,
                      child: Text(data.id.toString()),
                    ),
                    title: Text(data.column1.toString()),
                  ),
                );
              },
              itemCount: controller.data!.length,
              separatorBuilder: (context, index) => hBox,
            );
          },
        ),
      ),
    );
  }
}
