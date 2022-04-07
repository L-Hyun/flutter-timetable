class Task {
  int id = 0;
  String start = "";
  String end = "";
  String text = "";

  Task(this.start, this.end, this.text);

  Task.fromJson(Map<String, dynamic> taskMap){
    id = taskMap["id"] ?? 0;
    start = taskMap["start"] ?? "";
    end = taskMap["end"] ?? "";
    text = taskMap["text"] ?? "";
  }

  Map<String, dynamic> toJson (){
    return {
      'id': id,
      'start': start,
      'end': end,
      'text': text
    };
  }
}