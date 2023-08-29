void main(List<String> args) {
  // Single line 문자열
  String str1 = "Korea";
  // "", ''  과 동일하게 사용
  String str2 = 'Korea';
  // Multi Line 문자열
  /// 입력한 모양 그대로 문자열이 변수에 저장된
  /// Enter,빈칸,Tab 등의 값들도 그대로 유지된다
  String str3 = """


 우리는 민족중흥의 역사적 사명을 띄고 이땅에 태어났다
 조상의 빛난 얼을 오늘에 되살려 교육의 지표로 삼는다


""";
  print(str3);

  int num1; // dart에서는 long 형이 없고 int 사용
  double num2; //dart 에서는 float가 없고 double를 사용한다
  num1 = 30;
  num2 = 40.0;
  print("$num1,$num2");
  // dart 에서는 특별한 경우가 아니면. 숫자형 변수는 num 키워드를 권장한다
  num num3 = 30;
  bool bYes = true;
  print("$bYes");
}
