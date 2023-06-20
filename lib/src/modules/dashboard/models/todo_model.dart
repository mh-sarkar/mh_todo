class TodoModel {
  String? id;
  String? title;
  String? details;
  String? type;
  String? todoDate;
  String? completeStatus;
  String? createdAt;
  String? updatedAt;

  TodoModel(
      {this.id,
        this.title,
        this.details,
        this.type,
        this.todoDate,
        this.completeStatus,
        this.createdAt,
        this.updatedAt});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    details = json['details'];
    type = json['type'];
    todoDate = json['todo_date'];
    completeStatus = json['complete_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['details'] = details;
    data['type'] = type;
    data['todo_date'] = todoDate;
    data['complete_status'] = completeStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
