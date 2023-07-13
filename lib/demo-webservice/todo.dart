class Todo {
  late int id;
  late String title;

  Todo(this.id, this.title);

  Todo.fromJson(Map<String, dynamic> json){
    this.id = json['id'];
    this.title = json['title'];
  }
}