import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class WeatherData {
  final String city;
  final String country;
  final String lastUpdated;
  final int tempC;
  final int tempF;
  final double feelsLikeC;
  final double feelsLikeF;
  final double windKph;
  final double windMph;
  final int humidity;
  final int uv;
  final String conditionText;
  final String conditionIcon;
  final IconData humidityIcon; // ไอคอนของความชื้น
  final IconData windIcon; // ไอคอนของลม
  final IconData uvIcon; // ไอคอนของ UV

  WeatherData({
    required this.city,
    required this.country,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.uv,
    required this.conditionText,
    required this.conditionIcon,
    required this.humidityIcon,
    required this.windIcon,
    required this.uvIcon,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // ตั้งค่าสีพื้นหลังของแอพ
        scaffoldBackgroundColor: Colors.lightBlue[50], // เลือกสีที่คุณต้องการ
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherData weatherData = WeatherData(
    city: "Bangkok",
    country: "Thailand",
    lastUpdated: "2023-10-26 9:30",
    tempC: 30,
    tempF: 86,
    feelsLikeC: 38.1,
    feelsLikeF: 100.5,
    windKph: 6.8,
    windMph: 4.3,
    humidity: 70,
    uv: 1,
    conditionText: "Partly cloudy",
    conditionIcon: "https://cdn.weatherapi.com/weather/128x128/night/116.png",
    humidityIcon: Icons.opacity, // เพิ่มไอคอนของความชื้น
    windIcon: Icons.waves, // เพิ่มไอคอนของลม
    uvIcon: Icons.wb_sunny, // เพิ่มไอคอนของ UV
  );

  void _showWeatherScreen2(BuildContext context) {
    WeatherData newCityWeatherData = WeatherData(
      city: "Chonburi",
      country: "Thailand",
      lastUpdated: "2023-10-26 9:45",
      tempC: 28,
      tempF: 82,
      feelsLikeC: 31.2,
      feelsLikeF: 88.2,
      windKph: 9.2,
      windMph: 5.7,
      humidity: 75,
      uv: 2,
      conditionText: "Clear",
      conditionIcon: "https://cdn.weatherapi.com/weather/128x128/night/113.png",
      humidityIcon: Icons.opacity, // เพิ่มไอคอนของความชื้น
      windIcon: Icons.waves, // เพิ่มไอคอนของลม
      uvIcon: Icons.wb_sunny, // เพิ่มไอคอนของ UV
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherScreen2(newCityWeatherData),
      ),
    );
  }

  Widget _buildIconWithText(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(icon, size: 36),
          SizedBox(height: 4),
          Text(text, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bangkok Weather'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () {
              _showWeatherScreen2(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${weatherData.city}, ${weatherData.country}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              child: Column(
                children: [
                  Icon(
                    Icons.wb_sunny,
                    color: Colors.yellow,
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '${weatherData.conditionText}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Image.network(
              weatherData.conditionIcon,
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            Text(
              '${weatherData.tempC} °C',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '${weatherData.tempF} °F',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Feels like ${weatherData.feelsLikeC} °C / ${weatherData.feelsLikeF} °F',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Wind: ${weatherData.windKph} km/h / ${weatherData.windMph} mph',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIconWithText(weatherData.humidityIcon, 'Humidity'),
                _buildIconWithText(weatherData.windIcon, 'Wind'),
                _buildIconWithText(weatherData.uvIcon, 'UV'),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Last Updated: ${weatherData.lastUpdated}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherScreen2 extends StatelessWidget {
  final WeatherData weatherData;

  WeatherScreen2(this.weatherData);

  void _showWeatherScreen(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${weatherData.city} Weather'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () {
              // Functionality for viewing Chonburi weather
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${weatherData.city}, ${weatherData.country}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              child: Column(
                children: [
                  Icon(
                    Icons.wb_sunny,
                    color: Colors.yellow,
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '${weatherData.conditionText}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Image.network(
              weatherData.conditionIcon,
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            Text(
              '${weatherData.tempC} °C',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '${weatherData.tempF} °F',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Feels like ${weatherData.feelsLikeC} °C / ${weatherData.feelsLikeF} °F',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Wind: ${weatherData.windKph} km/h / ${weatherData.windMph} mph',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIconWithText(weatherData.humidityIcon, 'Humidity'),
                _buildIconWithText(weatherData.windIcon, 'Wind'),
                _buildIconWithText(weatherData.uvIcon, 'UV'),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Last Updated: ${weatherData.lastUpdated}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithText(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(icon, size: 36),
          SizedBox(height: 4),
          Text(text, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
