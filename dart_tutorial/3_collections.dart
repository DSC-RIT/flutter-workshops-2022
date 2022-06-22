void main() {
  List nums = [1, 2, 3, "four", 5.0, false];

  //traditional for loop
  for (int i = 0; i < nums.length; i++) {
    print(nums[i]);
  }

  //add to a list
  nums.add("six");

  //for-in loop
  for (var i in nums) {
    print(i);
  }

  //while loop
  int i = 0;
  while (i < nums.length) {
    print(nums[i]);
    i++;
  }

  //A Map
  Map<String, int> countFruits = {"apple": 2, "cherry": 1, "banana": 0};

  print("How many 'banana's are present?");
  print(countFruits['banana']);

  print("Adding a fruit to the map...");
  countFruits.addAll({"pear": 1});

  print(countFruits.keys); //print just keys
  print(countFruits.values); //print just values
}
