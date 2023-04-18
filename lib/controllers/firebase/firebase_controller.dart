import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  void saveTask(
      {required String titulo, required String task, required bool finished}) {
    final taskSave = <String, dynamic>{
      "titulo": titulo,
      "task": task,
      "finished": finished
    };
    db
        .collection("tasks")
        .doc(titulo)
        .set(taskSave)
        .onError((e, _) => print("Error writing document: $e"));
  }

  void finishTask({required String titulo, required bool status}) {
    db.collection("tasks").doc(titulo).update({"finished": status});
  }

  void deleteTask({required String titulo}) {
    db.collection("tasks").doc(titulo).delete();
  }
}
