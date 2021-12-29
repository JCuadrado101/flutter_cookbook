List<Map> data = [
  {"first":"Clarke","last":"Putton","age":80},
  {"first":"Eveline","last":"Knightly","age":81},
  {"first":"Nevsa","last":"Kerin","age":2},
  {"first":"Blanca","last":"Pyrah","age":5},
  {"first":"Gerard","last":"Rymmer","age":9},
  {"first":"Marv","last":"Dumbarton","age":68},
  {"first":"Donica","last":"O'Doohaine","age":10},
  {"first":"Yank","last":"Leyes","age":67},
  {"first":"Burtie","last":"Donneely","age":9},
  {"first":"Jarret","last":"Houldey","age":44},
  {"first":"Abelard","last":"Spratt","age":85},
  {"first":"Nola","last":"Bullent","age":31},
  {"first":"Fulton","last":"Godard","age":84},
  {"first":"Terrijo","last":"Peyntue","age":82},
  {"first":"Davina","last":"Kibble","age":17},
  {"first":"Liane","last":"Crocombe","age":26},
  {"first":"Roscoe","last":"Moxted","age":60},
  {"first":"Lorne","last":"Bougourd","age":61},
  {"first":"Cynthy","last":"Bratchell","age":5},
  {"first":"Julienne","last":"Mollitt","age":59},
  {"first":"Cornall","last":"Arnowicz","age":20},
  {"first":"Dennie","last":"Brehaut","age":79},
  {"first":"Lonny","last":"Beernt","age":41},
  {"first":"Margaret","last":"Geldart","age":59},
  {"first":"Cary","last":"Horsell","age":77},
  {"first":"Lucille","last":"Candwell","age":68},
  {"first":"Brigit","last":"Kubu","age":86},
  {"first":"Sunny","last":"Malinowski","age":57},
  {"first":"Sanders","last":"Chantler","age":31},
  {"first":"Cassandry","last":"Rudsdell","age":98},
  {"first":"Shawn","last":"Kiossel","age":2},
  {"first":"Brande","last":"Aleksandrikin","age":13},
  {"first":"Constantia","last":"MacGillespie","age":86},
  {"first":"Tedie","last":"Kernocke","age":50},
  {"first":"Agna","last":"Fahy","age":3},
  {"first":"Tiffani","last":"Jonke","age":89},
  {"first":"Eleanor","last":"Kidston","age":32},
  {"first":"Harcourt","last":"Emmitt","age":54},
  {"first":"Heath","last":"Chason","age":88},
  {"first":"Dew","last":"MacPhail","age":28},
  {"first":"Vilma","last":"Sagg","age":34},
  {"first":"Kliment","last":"Gansbuhler","age":13},
  {"first":"Thornie","last":"Tschierasche","age":3},
  {"first":"Huntley","last":"Vigars","age":25},
  {"first":"Marris","last":"Raddish","age":90},
  {"first":"Greg","last":"Richemont","age":61},
  {"first":"Stacy","last":"Burnhill","age":21},
  {"first":"Andrew","last":"Bogart","age":62},
  {"first":"Joly","last":"Lahiff","age":26},
  {"first":"Tatiania","last":"Standon","age":66}
];


void higherOrderFunctions() {
  final names = mapping();
  names.forEach(print);
  sorting();
  filtering();
  reducing();
  flattening();
}

class Name {
  final String first;
  final String last;

  Name(this.first, this.last);

  @override
  String toString() {
    return '$first $last';
  }
}

List<Name> mapping() {
  // Transform the data from raw maps to a strongly typed model
  final names = data.map<Name>((Map rawMap) {
    final first = rawMap['first'];
    final last = rawMap['last'];
    return Name(first, last);
  }).toList();
  return names;
}


// List<Name> mapppingShorter() {
//   return data.map<Name>((raw) => Name(raw['first'], raw['last'])).toList();
// }

void sorting() {
  final names = mapping();

  // Alphabetize the list by last name
  names.sort((a, b) => a.last.compareTo(b.last));

  print(' ');
  print('Alphabetical List of Names');
  names.forEach(print);
}

void filtering() {
  final names = mapping();
  final onlyMs = names.where((names) => names.last.startsWith('M'));
  print(' ');
  print('Filters name list by M');
  onlyMs.forEach(print);
}

void reducing() {
  // Merge an element of the data together
  final allAges = data.map<int>((person) => person['age']);
  final total = allAges.reduce((total, age) => total + age);
  final average = total / allAges.length;

  print('The average age is $average');
}

void flattening() {
  final matrix = [
    [1, 0, 0],
    [0, 0, -1],
    [0, 1, 0],
  ];

  final linear = matrix.expand<int>((row) => row);
  print(linear);
}

