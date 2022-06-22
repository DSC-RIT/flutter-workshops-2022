//data types: one type of value
/*
User 
attributes
1. name
2. age
3. username
4. score

properties/actions
1. incrementScore
2. changeUsername, etc
*/

// CLASS : template for a real world object

class User {
  //data members
  late String username;

  ///late is a kind of promise to the compiler
  ///that we'll assign values later, before accessing variables.
  ///In this case, it means, in the constructor.
  late String fullName;
  late int age;
  late double score;

  User({
    required this.username,
    required this.fullName,
    required this.age,
    required this.score,
  });

  //methods
  void printFullName() {
    print(fullName);
  }

  @override
  String toString() {
    return "This is $fullName aka $username aged $age";
  }
}

//Create an "instance" of the class, called the object
void main() {
  User user1 =
      new User(username: "sou", fullName: "Soundarya", age: 21, score: 45.9);
  print(user1);
  user1.printFullName();
}
