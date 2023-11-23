class ToDo {
  int? id;
  String? description;
  bool? isDone;

  ToDo({required this.id, required this.description, this.isDone = false});

  static List<ToDo> todoList() {
    return [];
  }
}
