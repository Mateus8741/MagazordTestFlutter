class ToDo {
  int? id;
  String? description;
  bool? isDone;

  ToDo({required this.id, required this.description, this.isDone = false});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'isDone': isDone,
    };
  }

  static List<ToDo> todoList() {
    return [];
  }

  static ToDo fromJson(Map<String, dynamic> model) {
    return ToDo(
      id: model['id'],
      description: model['description'],
      isDone: model['isDone'],
    );
  }
}
