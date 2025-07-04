class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });
  static List<ToDo> todoList() {
    return [
      ToDo(
        id: '03',
        todoText: 'Check Emails',
      ),
      ToDo(
        id: '04',
        todoText: 'Change the button in home page',
      ),
      ToDo(
        id: '05',
        todoText: 'Fix the notifications',
      ),
      ToDo(
        id: '06',
        todoText: ' meeting sunday for testing',
      ),
    ];
  }
}
