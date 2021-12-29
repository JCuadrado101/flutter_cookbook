//without cascade

// class UrlBuilder {
//   String? _scheme;
//   String? _host;
//   String? _path;
//
//   UrlBuilder setScheme(String value) {
//     _scheme = value;
//     return this;
//   }
//
//   UrlBuilder setHost(String value) {
//     _host = value;
//     return this;
//   }
//
//   UrlBuilder setPath(String value) {
//     _path = value;
//     return this;
//   }
//
//   String build() {
//     assert(_scheme != null);
//     assert(_host != null);
//     assert(_path != null);
//     return '$_scheme://$_host/$_path';
//   }
//
// }

class UrlBuilder {
  String? scheme;
  String? host;
  List<String>? routes;

  @override
  String toString() {
    assert(scheme != null);
    assert(host != null);
    final paths = [host, if(routes != null) ...?routes];
    final path = paths.join('/');

    return '$scheme://$path';
  }
}

void cascadePlayground() {
  final url = UrlBuilder()
      ..scheme = 'https'
      ..host = 'dart.dev'
      ..routes = [
        'guides',
        'language',
        'language-tour#cascade-notation-',
      ];
  print(url);
}