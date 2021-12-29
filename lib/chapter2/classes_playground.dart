class Name {
  final String first;
  final String last;

  Name(this.first, this.last);

  @override
  String toString() {
    return '$first $last';
  }
}

class OfficialName extends Name {
  // Private properties begin with underscore
  final String _title;

  // You can add colons after constructor
  // to parse data or delegate to super.

  OfficialName(this._title, String first, String last) : super(first, last);

  @override
  String toString() {
    return '$_title. ${super.toString()}';
  }
}

void classPlayground() {
  final name = OfficialName('Mr', 'Jordan', 'Cuadrado');
  final message = name.toString();

  print(message);
}
