//function that doesn't return anything
void printFullName({String? first, String? second}) {
  //note named parameters, not positional
  print("I am $first $second");
}

//function that returns String
String returnRandomFact() {
  return "Tony Stark is Iron Man";
}

//OR fat arrow functions when we have only aa single line
String returnRandomFact1() => "Tony Stark is Iron Man";

void main() {
  printFullName(second: "Stark", first: "Tony");
  print(returnRandomFact());
}

//Summary:-
//returnType functionName(arg1, arg2, ....){
//  code!
//}
