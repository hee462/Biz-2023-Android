// List 배열
var nums = [1, 2, 3, 4, 5, 6, 7, 8, 9];
var nations = ["Rok", "USA", "BRITH", "GERMENY"];
List<String> names = ["홍길동", "이몽룡", "성춘향"];
void main(List<String> args) {
  nums.add(100);
  nations.add("shwice");
  names.add("임꺽정");
  print(nums);
  print(nations);

// List(배열)에서 특정한 값을 제거하기
  nations.remove("America");
  print(nations);
// List 의 3번째 index 요소 제거
  nations.remove(3);
  print(nations);

  print(names.first);
  print(names.last);
  print(names.reversed);

  names.shuffle();
  print(names);
}
