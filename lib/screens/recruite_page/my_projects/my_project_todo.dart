import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/widgets/todo_item.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/model/todo.dart';

class MyProjectTodo extends StatefulWidget {
  final String projectId;
  final String projectTitle;
  final Freelancer freelancer;
  final VoidCallback onProjectFinished;

  const MyProjectTodo({
    super.key,
    required this.projectId,
    required this.projectTitle,
    required this.freelancer,
    required this.onProjectFinished,
  });

  @override
  State<MyProjectTodo> createState() => _HomeStates();
}

class _HomeStates extends State<MyProjectTodo> {
  static final Map<String, List<ToDo>> _projectTodos = {
    '0': ToDo.todoList(),
    '1': [],
    '2': [],
    '3': [],
  };

  late List<ToDo> todosList;
  late List<ToDo> _foundToDo;
  final _todoController = TextEditingController();
  bool _allCompleted = false;
  bool _isFinished = false;

  @override
  void initState() {
    todosList = _projectTodos[widget.projectId] ?? [];
    _foundToDo = List.from(todosList);
    _checkAllCompleted();
    super.initState();
  }

  void _checkAllCompleted() {
    setState(() {
      _allCompleted =
          todosList.isNotEmpty && todosList.every((todo) => todo.isDone);
    });
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
      _checkAllCompleted();
    });
  }

  void _finishProject() {
    setState(() {
      _isFinished = true;
    });
    widget.onProjectFinished();
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Project successfully completed!'),
        backgroundColor: Colors.red[400],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        title: const Text(''),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                // Navigate to freelancer profile if needed
              },
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
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                _buildSearchBox(),
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
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_allCompleted && !_isFinished)
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: _finishProject,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 3,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text(
                        'FINISH PROJECT',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                if (_isFinished)
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[700],
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.white, size: 24),
                          SizedBox(width: 10),
                          Text(
                            'PROJECT COMPLETED',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                _buildAddTodoSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: _runFilter,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, color: tdBlack, size: 20),
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

  Widget _buildAddTodoSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _todoController,
              decoration: const InputDecoration(
                hintText: 'Add a new todo item',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20, right: 20),
          child: ElevatedButton(
            onPressed: _addToDoItem,
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.primary,
              minimumSize: const Size(60, 60),
              elevation: 10,
            ),
            child: const Text(
              '+',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  void _addToDoItem() {
    final text = _todoController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      final newToDo = ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: text,
      );
      todosList.add(newToDo);
      _projectTodos[widget.projectId] = todosList;
      _foundToDo = List.from(todosList);
      _checkAllCompleted();
    });
    _todoController.clear();
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
      _projectTodos[widget.projectId] = todosList;
      _foundToDo = List.from(todosList);
      _checkAllCompleted();
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
}
