// 순서에 맞게 주고 받아야 함
String sayHello(String? name, int? age, String? nation) {
  return "안녕 $name, 나이는 $age 고향은 $nation이야";
}

// 순서 상관 없이 주고 받을 수 있음
String sayHelloNameParams({String? name, int? age, String? nation}) =>
    "안녕 $name, 나이는 $age 고향은 $nation이야";

/// <Span name ="홍길동" , age =33 , naton = "대한민국"/>
/// const Span =({name ,age,nation}) =>{return <></>}