import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<Position?> getPosition() async {
    await Future<int>.delayed(const Duration(seconds: 3));
    Position? position = await Geolocator.getLastKnownPosition();
    setState(() {
      myPosition = 'Latitude: ${position?.latitude} Longitude: ${position?.longitude}';
    });
    return position;
  }

  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocation'),
      ),
      body: Center(
        child: FutureBuilder(
          future: getPosition(),
          builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(myPosition);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
            } else {
              return CircularProgressIndicator();
            }
          }
        )
      )
    );
  }
}
