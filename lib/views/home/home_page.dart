import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list/controllers/firebase/firebase_controller.dart';
import 'package:task_list/controllers/home_controller/home_controller_getx.dart';
import 'package:task_list/views/task/task_page.dart';
import 'package:task_list/widgets/change_theme_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final FirebaseController firebaseController = Get.put(FirebaseController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Task List"),
          actions: [ChangeThemeButton()],
        ),
        body: Obx(() {
          if (homeController.tasks.value == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.black,
                      );
                    },
                    itemCount: homeController.tasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 8,
                                child:
                                    Text(homeController.tasks[index].titulo)),
                            IconButton(
                                onPressed: () {
                                  firebaseController.finishTask(
                                      status:
                                          !homeController.tasks[index].finished,
                                      titulo:
                                          homeController.tasks[index].titulo);
                                  homeController.loadTasks();
                                },
                                icon: Icon(
                                  Icons.check_box,
                                  color: homeController.tasks[index].finished ==
                                          false
                                      ? Colors.red
                                      : Colors.green,
                                )),
                            IconButton(
                                onPressed: () {
                                  firebaseController.deleteTask(
                                      titulo:
                                          homeController.tasks[index].titulo);
                                  homeController.loadTasks();
                                },
                                icon: const Icon(
                                  Icons.delete_forever,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                        subtitle: Text(homeController.tasks[index].task),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(TaskPage());
                  },
                  child: const Text("Add"),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
