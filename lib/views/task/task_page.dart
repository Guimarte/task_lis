import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list/controllers/firebase/firebase_controller.dart';
import 'package:task_list/controllers/home_controller/home_controller_getx.dart';

class TaskPage extends StatelessWidget {
  TaskPage({super.key});
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  FirebaseController firebaseController = FirebaseController();
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.purple.shade100),
        body: Column(children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: tituloController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Título")),
                maxLength: 20,
              ),
            ),
          ),
          TextField(controller: descricaoController),
          ElevatedButton(
              onPressed: () {
                firebaseController.saveTask(
                    titulo: tituloController.text,
                    task: descricaoController.text,
                    finished: false);
                homeController.loadTasks();
                Get.back();
              },
              child: const Text("Enviar"))
        ]),
      ),
    );
  }
}
