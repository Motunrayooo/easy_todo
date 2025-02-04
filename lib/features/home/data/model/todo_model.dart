class TodoModel {
  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    this.isCompleted = false,
  });

  final String? id;
  final String? title;
  final String? description;
  final String? category;
  bool isCompleted;

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      category: json["category"],
      isCompleted: json["isCompleted"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "isCompleted": isCompleted,
      };
}
