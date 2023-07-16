void main() {
  // print(primeCheck(int.parse(stdin.readLineSync()!)));
  // var arr = List<int>.generate(5, (index) => index);
  // File file = File('file.txt');

  // file.readAsString().then((value) => print(value));
  List<int> arr = List.generate(10, (index) => index);

  print(arr.where((element) => element % 2 == 0));
  print(arr[arr.length - 1]);
  print(primeCheck(2));
}

void randomDataGenerator() {
  // TreeNode max: 2
  // maxDepth: 10
  // Does not know the depth of its leaf
  // Each Node will have max value of 100

  // 2. value < 50 -> delete these and print again.
}

bool primeCheck(int number) {
  if (number == 1) {
    return false;
  } else if (number > 1) {
    for (var i = 2; i < number; i++) {
      if (number % i == 0) {
        return false;
      }
    }
  }
  return true;
}

List<int> twoSum(List<int> nums, int target) {
  List<int> result = [];
  var map = Map<int, int>();

  for (var i = 0; i < nums.length; i++) {
    if (map.containsKey(target - nums[i])) {
      result.add(i);
      result.add(map[target - nums[i]]!);
    }
    map[nums[i]] = i;
  }
  return result;
}

bool isPalindrome(int x) {
  return x.toString().split('').reversed.join('') == x.toString();
}

int removeDuplicates(List<int> nums) {
  if (nums.length == 0) return 0;

  int i = 0;
  for (var j = 1; j < nums.length; j++) {
    if (nums[j] != nums[i]) {
      i++;
      nums[i] = nums[j];
    }
  }

  return i + 1;
}
