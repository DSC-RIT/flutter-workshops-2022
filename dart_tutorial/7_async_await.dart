//Futures, async-await

Future<void> getRandomFact() {
  //simulate loading from server/db
  return Future.delayed(
      const Duration(seconds: 2), () => print("Everest is the highest peak!"));
}

void main() async {
  print("Getting random fact....");
  await getRandomFact();
  print("The end.");
}
