import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'task.dart';

class SpHelper{
  static late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future writePerformance(Task task) async {
    prefs.setString(
      task.id.toString(), json.encode(task.toJson())
    );
  }

  List<Task> getTasks() {
    List<Task> tasks = [];
    Set<String> keys = prefs.getKeys();
    keys.forEach((String k) {
      Task task = Task.fromJson(json.decode(prefs.getString(k) ?? ''));
      tasks.add(task);
    });
    return tasks;
  }
}