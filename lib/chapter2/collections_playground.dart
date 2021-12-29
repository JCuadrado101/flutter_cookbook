void collectionPlayground() {
  listPlayground();
  mapPlayground();
  setPlayground();
  collectionControlFlow();
}

void listPlayground() {
  // Creating with list literal syntax
  final List<int> numbers = [1, 2, 3, 5, 7];

  numbers.add(10);
  numbers.addAll([4, 1, 35]);

  // assigning via subscript
  numbers[1] = 15;

  print('The second number is ${numbers[1]}');

  // enumerating a list
  for (int number in numbers) {
    print(number);
  }
}

void mapPlayground() {
  final MapString, ages = {
    'Mike': 18,
    'Peter': 35,
    'Jennifer': 26
  };

  // Subscript syntax uses the key type.
  // A string in this case
  ages['Tom'] = 48;

  final ageOfPeter = ages['Peter'];
  print('Peter is $ageOfPeter years old');

  ages.remove('Peter');

  ages.forEach((String name, int age) {
    print('$name is $age years old');
  });
}

void setPlayground() {
  final Set<String> ministers = {
    'Justin',
    'Stephen',
    'Paul',
    'Jean',
    'Kim',
    'Brian'
  };

  // duplicates are not allows in Sets. The duplicate will be ignored.
  ministers.addAll({'John', 'Peter', 'Pierre', 'Joe', 'Pierre'});

  final isJustinAMinister = ministers.contains('Justin');
  print(isJustinAMinister);

  for (String primeMinister in ministers) {
    print(primeMinister);
  }

}


void collectionControlFlow() {
  const addMore = false;
  final randomNumbers = [
    34,
    232,
    54,
    32,
    if (addMore) ...[
      534343,
      4423,
      3432432,
    ],
  ];

  final duplicated = [
    for (int number in randomNumbers) number * 2,
  ];

  print(duplicated);

}