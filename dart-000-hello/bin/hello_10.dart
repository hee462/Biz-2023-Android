import 'dart:math';

void main(List<String> args) {
  List<int> nums = [];
  // 1 ~ 100 의 범위의 난수 만들어 20개의 배열 만들기
  for (int i = 0; i < 20; i++) {
    var num = Random().nextInt(100) + 1;
    nums.add(num);
  }

  // 배열에 저장된 요소들 중에 소수를 구하여 출력하시오.
  for (int i = 0; i < nums.length; i++) {
    var index = 2;
    for (index = 2; index < nums[i]; index++) {
      if (nums[i] % index == 0) break;
    }
    // index와 nums 의 관계
    if (index < nums[i]) {
      print("${nums[i]}는 소수가 아님");
    } else {
      print("${nums[i]}는 소수");
    }
  }

  for (int i = 0; i < nums.length; i++) {
    int result = prime(nums[i]);
    if (result > 0) {
      print("${nums[i]}는 소수");
    } else {
      print("${nums[i]}는 소수아님");
    }
  }
}

int prime(int num) {
  for (int i = 2; i < num; i++) {
    if (num % i == 0) return 0;
  }
  return num;
}
