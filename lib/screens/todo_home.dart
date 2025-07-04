import 'package:flutter/material.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import '../../model/todo.dart';
import '../../constants/widgets/todo_item.dart';
import '../../constants/colors.dart';

class TodoHomeScreen extends StatefulWidget {
  final String projectId;
  final String projectTitle;
  final Freelancer freelancer;

  const TodoHomeScreen({
    super.key,
    required this.projectId,
    required this.projectTitle,
    required this.freelancer,
  });

  @override
  State<TodoHomeScreen> createState() => _HomeState();
}

class _HomeState extends State<TodoHomeScreen> {
  static final Map<String, List<ToDo>> _projectTodos = {
    '0': ToDo.todoList(),
    '1': [],
    '2': [],
    '3': [],
  };

  late List<ToDo> todosList;
  late List<ToDo> _foundToDo;

  @override
  void initState() {
    todosList = _projectTodos[widget.projectId] ?? [];
    _foundToDo = List.from(todosList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          '${widget.projectTitle} ToDos',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: (_) {},
                          isDeletable: false,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _allTodosCompleted()
                ? Container(
                    margin: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Project marked as finished!")),
                        );
                        Navigator.pop(context); // or Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttounColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Finished',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  bool _allTodosCompleted() {
    return _foundToDo.isNotEmpty && _foundToDo.every((todo) => todo.isDone);
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: const Text(''),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/avatar.jpg',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
