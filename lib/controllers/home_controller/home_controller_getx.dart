import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:task_list/models/task_model.dart';

class HomeController extends GetxController {
  late RxList<TaskModel> tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  Future<void> loadTasks() async {
    final tasksCollection = FirebaseFirestore.instance.collection('tasks');
    final snapshot = await tasksCollection.get();
    tasks.value =
        snapshot.docs.map((doc) => TaskModel.fromMap(doc.data())).toList();
  }
}
