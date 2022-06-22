void main() {
  //null safety

  //non-nullable by default
  //String x;
  //print(x); ERROR!

  //use ? to explicitly indicate that it can be null
  String? x;
  print(x);

  //use ! to make Dart treat as non-nullable even though it is nullable
  int? y;

  int anotherY = y!;
  print(anotherY);

  //use ?? to perform a task depending on null or not
  String? name;
  print(name ?? "Anonymous");

  /*Summary:-
  ? or late: make it nullable
  ! : assert that it isn't null, even though nullable
  ?? : to do one thing if it isn't null, and another otherwise
  */
}
