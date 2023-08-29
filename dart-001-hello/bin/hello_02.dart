import 'package:dart_hello/module_02.dart';

void main(List<String> args) {
  var result = sayHello("홍길동", 22, "대한민국");
  print(result);

  /// named parameter 방식
  /// 함수를 선언할때 매개변수를 {}로 감싸주고
  /// 값을 전달할때 변수 : 값 형식으로 전달한다
  /// 위치기반에 비하여 함수에 값이 잘못 전달되는 것을 방지 할 수 있다.
  result = sayHelloNameParams(age: 3, nation: "우리나라", name: "성춘향");
  print(result);

  /// named parameter 방식의 함수를 선언할때 변수 type에 null safe(?)르르 지정하면
  /// 변수값을 선택적으로 보내거나 보내지 않아도 된다
  /// 이러한 방식을 Optional parameter라고 한다
  result = sayHelloNameParams(name: "성춘호");
  print(result);
}
