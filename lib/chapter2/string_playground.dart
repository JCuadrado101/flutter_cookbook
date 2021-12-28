void stringPlayground() {
  basicStringDeclarations();
  multiLineStrings();
  combiningStrings();
}

void basicStringDeclarations() {
  // With Single Quotes
  print('Hello World');
  const aBoldStatement = 'Dart isn\'t loosely typed';
  print(aBoldStatement);

  // With Double Quotes
  print("Hello World");
  const aMoreMildStatement = "Dart isn't loosely typed";
  print(aMoreMildStatement);
  const mixAndMatch = 'Every programmer should write "Hello World"';
  print(mixAndMatch);
}

void multiLineStrings() {
  // With Single Quotes
  const multiLineString = '''
  This is a multi-line string.
  It can span multiple lines.
  ''';
  print(multiLineString);

  // With Double Quotes
  const multiLineString2 = """
  This is a multi-line string.
  It can span multiple lines.
  """;
  print(multiLineString2);
}

void combiningStrings() {
  traditionalConcatenation();
  modernInterpolation();
  concatenationVsInterpolation();
}

void traditionalConcatenation() {
  // With Single Quotes
  const a = 'Hello';
  const b = 'World';
  const c = a + ' ' + b;
  print(c);

  // With Double Quotes
  const d = "Hello";
  const e = "World";
  const f = d + " " + e;
  print(f);
}

void modernInterpolation() {
  // With Single Quotes
  const a = 'Hello';
  const b = 'World';
  const c = '$a $b';
  print(c);

  // With Double Quotes
  const d = "Hello";
  const e = "World";
  const f = "$d $e";
  print(f);
}

String concatenationVsInterpolation() {
   int sum = 1 + 1;
  final concatenated = 'one plus one is ' + sum.toString();
  print(concatenated);

  final interpolated = 'one plus one is $sum';
  print(interpolated);

  const age = 25;
  const howOld = 'I am $age ${age == 1 ? 'year' : 'years'} old';
  print(howOld);

  List fruits = ['Apple', 'Banana', 'Cherry', 'Durian', 'Elderberry'];
  StringBuffer buffer = StringBuffer();
  for (String fruit in fruits) {
    buffer.write(fruit);
    buffer.write(' ');
  }
 print(buffer.toString());
  return buffer.toString();

}