import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "나의 App",
          ),
        ),
        body: ListView(
          children: [
            Image.asset(
              "images/title_image.jpg",
              height: 250,
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
          ],
        ),
      ),
    );
  }

  /// 컨테이너 위젯
  /// Container :  padding, margin 을 부여하는 box
  /// Expanded : 부모 box 를 가득채우는 구조의 box
  /// Padding : padding을 기본값으로 갖는 box

  // Widget 변수 선언
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "안녕",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "우리나라 자랑",
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              )
            ],
          ),
        ),
        const Icon(
          Icons.star,
          color: Colors.amberAccent,
        ),
        const Text("50")
      ],
    ),
  );

  // Widget 함수 선언
  Widget textSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      // margin: const EdgeInsets.all(20),

      child: const Text(
        "우리는 민족중흥의 역사적 사명을 띄고"
        "우리는 민족중흥의 역사적 사명을 띄고"
        "우리는 민족중흥의 역사적 사명을 띄고"
        "우리는 민족중흥의 역사적 사명을 띄고"
        "우리는 민족중흥의 역사적 사명을 띄고"
        "우리는 민족중흥의 역사적 사명을 띄고"
        "우리는 민족중흥의 역사적 사명을 띄고"
        "우리는 민족중흥의 역사적 사명을 띄고",
        softWrap: true,
      ),
    );
  }

  Widget colMethod() {
    return const Column(children: [
      Text(
        "대한민국",
        style: TextStyle(
          fontSize: 30,
          color: Color.fromARGB(255, 22, 100, 35),
        ),
      ),
      Text(
        "우리나라",
        style: TextStyle(
          fontSize: 30,
          color: Color.fromARGB(255, 22, 100, 35),
        ),
      ),
      Text(
        "만세",
        style: TextStyle(
          fontSize: 30,
          color: Color.fromARGB(255, 22, 100, 35),
        ),
      )
    ]);
  }
}
