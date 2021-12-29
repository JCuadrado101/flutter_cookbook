void callbackExample(void Function(String value) callback) {
  callback('Hello Closure');
}

typedef NumberGetter = int Function();

int powerOfTwo(NumberGetter getter) {
  return getter() * getter();
}

void consumerCloser() {
  final getFour = () => 4;
  final squared = powerOfTwo(getFour);
  print(squared);

  callbackExample((value) {
    print(value);
  });
}