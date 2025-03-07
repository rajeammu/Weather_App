import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {

   @override
  State<StatefulWidget> createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
     print('the line of code is triggered');
  }
void getLocationData() async {
var weatherData=await WeatherModel().getLocationWeather();
   Navigator.push(context, MaterialPageRoute(builder: (context){
    return LocationScreen(locationWeather: weatherData,
    );
    }
 ),
   );
//print(location.longitude);
//print(location.latitude);
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}


