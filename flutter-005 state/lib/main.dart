import 'dart:math';

import 'package:flutter/material.dart';
import 'package:state/main_app_bar.dart';
import 'package:state/models/student.dart';
// import 'package:state/main_app_bar.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "Flutter State",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const HomePage(),
    );
  }
}

/// state 클래스를 관리하는 부모 클래스
/// state 를 생성(create) 한다
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  /// => StartPage()
  ///  StartPage class 의 생성자를 호출하여 StartPage의 객체를 생성하여
  /// return 하라
  @override
  State<StatefulWidget> createState() => StartPage();
}

/// State Widget 에서는 StatefulWidget 과 관계를 명확하기 위하여
/// Generic(<HomePage)을 연결해 준다
class StartPage extends State<HomePage> {
  // State 클래스 위젯에서 titles 배열 변수를 생성(선언과 초기화)
  // 이 순간 titles 는 state 가 된다.
  // state 는 화면 rendering , 또는 동적인 활동을 감시 할 수 있는 동적 변수
  final titles = [
    "hello korea",
    "snack",
    "republic of korea",
    "say hey ho",
    "interesting",
    "flutter",
    "java",
    "c",
    "react",
  ];
  final studentList = [
    Student(stNum: "0001", stName: "홍길동"),
    Student(stNum: "0002", stName: "성춘향"),
    Student(stNum: "0003", stName: "변학도"),
    Student(stNum: "0004", stName: "뺑덕"),
    Student(stNum: "0005", stName: "심봉사"),
  ];

  /// 동적으로 변화되는 배열(리스트) 요소들을 화면에 출력하기 위하여
  ///  ListView.builder() 함수를 사용하여 각 요소를 디자인한다
  ListView appBarBody() => ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Material(
              child: InkWell(
                onTap: () {
                  var snackBar =
                      SnackBar(content: Text(studentList[index].stName));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                highlightColor:
                    const Color.fromARGB(255, 189, 15, 15).withOpacity(0.5),
                splashColor:
                    const Color.fromARGB(255, 139, 241, 22).withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(studentList[index].stNum),
                      const Text(" AAA "),
                      Text(studentList[index].stName),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("안녕하세요"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              var rnd = Random().nextDouble();

              ///flutter의 State 클래스에서 기본으로 제공하는 함수
              ///state로 선언된 변수의 값을 변경할때 사용하는 함수
              ///이 함수 내의 본문에서 state 변수의 값(상태)을 변경하면
              ///화면에 자동 rendering이 된다.
              setState(() {
                titles.add(rnd.toString());
              });
            },
            icon: const Icon(Icons.add_alert_outlined),
          )
        ],
      ), //mainAppBar(context)
      body: appBarBody(),
    );
  }
}
