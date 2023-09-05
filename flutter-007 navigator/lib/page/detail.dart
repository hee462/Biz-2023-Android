import 'package:flutter/material.dart';
import '../model/user.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key,
      required this.name,
      required this.email,
      required this.userDto});

  final String name;
  final String email;
  final User userDto;

  @override
  State<StatefulWidget> createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("자세히보기"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("여기는 디테일"),
              Text("이름 :  ${widget.name}"),
              Text("이름 :  ${widget.email}"),
              Text("이름  : ${widget.userDto.username}"),
              Text("email  : ${widget.userDto.email}"),
              Text("별명 : ${widget.userDto.nickname}"),
              Text("전화번호  : ${widget.userDto.tel}"),
            ],
          ),
        ));
  }
}
