import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/todo.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Todo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var todoList = [];
  // var todoList = [
  //   Todo(
  //       sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  //       stime: DateFormat("HH:ss:mm").format(DateTime.now()),
  //       content: "오늘금욜",
  //       complete: false),
  //   Todo(
  //       sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  //       stime: DateFormat("HH:ss:mm").format(DateTime.now()),
  //       content: "Flutter project",
  //       complete: false)
  // ];

  Todo getTodo(String content) => Todo(
      sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      stime: DateFormat("HH:ss:mm").format(DateTime.now()),
      content: content,
      complete: false);

  Widget alerDialog(BuildContext context) => AlertDialog(
        actions: [
          TextField(
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.go,
            onSubmitted: (value) {
              var snackBar = SnackBar(
                content: Text("$value 가 추가되었음"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              var todo = getTodo(value);
              Navigator.of(context).pop();
              setState(() {
                todoList.add(todo);
              });
            },
            decoration: const InputDecoration(hintText: "할일 입력해주세요"),
          )
        ],
      );
  @override
  Widget build(BuildContext context) {
    // List<Todo> todoList = [
    //   getTodo("flutter project"),
    //   getTodo("today friday"),
    // ]
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "images/profile.png",
          fit: BoxFit.fill,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("나의 TodoList"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => alerDialog(context),
                );
              },
              icon: const Icon(Icons.add_alarm_sharp))
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Dismissible(
            key: Key(todoList[index].content),
            onDismissed: (direction) {
              setState(() {
                todoList.removeAt(index);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(todoList[index].sdate),
                      Text(todoList[index].stime),
                    ],
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      todoList[index].content,
                      style: const TextStyle(fontSize: 20, color: Colors.amber),
                    ),
                  )),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
