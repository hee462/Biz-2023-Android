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
  /// **Controller
  /// flutter의 대부분의 Widget에는 위젯Controller 라는 객체가 있다
  /// HTML에 id 속성에 해당하는 객체이다
  var inputController = TextEditingController();
  var todoContent = "";
  var todoList = [];

  Todo getTodo(String content) => Todo(
      sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      stime: DateFormat("HH:ss:mm").format(DateTime.now()),
      content: content,
      complete: false);

  /// Scaffold
  /// 처음 화면의 layout을 꾸밀때 사용하는 Widget이다
  /// appBar, body, bottomSheet 가 있는데
  /// appBar는 화면의 머릿글에 해당하는 부분
  /// body는 본문(중앙)에 해당하는 부분
  /// bottomSheet 는 화면의 footer(꼬릿글)에 해당하는 부분
  /// body는 보통 데이터를 표현하는 부분, 여기는 Scroll이 일어나는 부분
  /// appBar, bottomSheet는 body가 변화되더라고 Scroll이 되지 않는 부분
  /// bottomSheet는 입력화면에서 소프트 키보드가 나타나면 키보드 위에 표현되는 부분
  @override
  Widget build(BuildContext context) {
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
      bottomSheet: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  /// TextFiled에 id(Controller )설정
                  controller: inputController,
                  onChanged: (value) => setState(
                    () {
                      todoContent = value;
                    },
                  ),
                  decoration: InputDecoration(
                    prefix: const SizedBox(
                      width: 20,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => inputController.clear(),
                      icon: const Icon(Icons.clear_outlined),
                    ),
                    hintText: "할일을 입력해주세요",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    var todo = getTodo(todoContent);
                    setState(() {
                      todoList.add(todo);
                      todoContent = "";
                      inputController.clear();
                    });
                  },
                  icon: const Icon(Icons.send))
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: todoListview(),
      ),
    );
  }

  /// Listview를 return type 을 Widget으로 변경하기
  /// 모든 Widget 은 가장 상위 클래스인 Widget을 상속받고 있기 때문에
  /// 모든 Widget 의 return type은 Widget으로 설정하여도 된다
  ///
  Widget todoListview() {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return ListTile(
          // onTap: () {},
          splashColor: const Color.fromARGB(255, 180, 20, 30).withOpacity(0.5),
          title: Dismissible(
            /// Key(todoList[index].content),
            /// 만약 todoList 데이터가 없는 경우
            /// null exception 이 발생할수 있기 때문에
            /// key 의 값이 null 이 된다. flutter 에서 제공하는 UUID 인
            /// UniqueKey() 사용한다
            key: UniqueKey(),
            // 왼쪽에서 오른쪽으로 Swipe 를 했을때 나타나는 Widget
            background: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.green,
              alignment: Alignment.centerLeft,
              child: const Icon(
                Icons.save,
                size: 36,
                color: Colors.white,
              ),
            ),
            secondaryBackground: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete,
                size: 36,
                color: Colors.white,
              ),
            ),

            /// 사라지기 전의 event
            /// event 핸들러에서 Future.value(true) 를 return 하면
            /// swipe 행위가 진행되고, false 를 return 하면 진행을 멈춘다
            confirmDismiss: (direction) => onConfirmHandler(direction, index),
            // cofirmDismiss 에서 true 가 return
            onDismissed: (direction) => {
              if (direction == DismissDirection.startToEnd)
                {
                  setState(() {
                    todoList[index].complete = !todoList[index].complete;
                  })
                }
              else if (direction == DismissDirection.endToStart)
                {
                  setState(() {
                    todoList.removeAt(index);
                  }),
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${todoList[index].content}를 삭제완료"),
                  ))
                },
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
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
                    child: Align(
                      // 왼쪽정렬
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        // 글자수에 따라 boxsize가달라져서 박스 값 고정
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            todoList[index].content,
                            style: todoList[index].complete
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 20,
                                    color: Colors.blue)
                                : const TextStyle(
                                    fontSize: 20, color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> onConfirmHandler(direction, index) {
    if (direction == DismissDirection.startToEnd) {
      return completeConfirm(index);
    } else if (direction == DismissDirection.endToStart) {
      return deleteConfirm();
    }
    // Future : 화면에 state 에 의해서 변화를 감지하는 객체
    return Future.value(false);
  }

  Future<bool?> deleteConfirm() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("삭제할까요??"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("예"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("아니오"),
          )
        ],
      ),
    );
  }

  Future<bool?> completeConfirm(index) {
    var yesNo = todoList[index].complete ? "완료처리를 취소할까요?" : "완료처리를 할까요?";
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(yesNo),
        actions: [
          ElevatedButton(
            onPressed: () {
              /// Navigator..pop(true) :
              ///     showDialog 가 return 하는 값
              Navigator.of(context).pop(true);
            },
            child: const Text("예"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("아니오"),
          )
        ],
      ),
    );
  }

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
}
