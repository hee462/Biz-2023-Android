class Student {
  //String? stNum 에서 ?의 역할, stNum 라는 변수에 null 을 허용하겠다.
  String stNum;
  String stName;
  // Student 클래스를 사용하여 객체를 만들때 stNum,stName을 반드시 값을 전달해야됨 -> null safy를 만들기 위해서 required
  Student({required this.stNum, required this.stName});
}
