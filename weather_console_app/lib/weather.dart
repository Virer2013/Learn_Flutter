class Weather {
  final String lastUpdated;
  final String cityName;
  final double tempC;
  final double feelsLikeC;
  final String condition;

  Weather({
    required this.lastUpdated,
    required this.cityName,
    required this.tempC,
    required this.feelsLikeC,
    required this.condition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final currentData = json['current'];
    final conditionData = currentData['condition'];
    return Weather(
      lastUpdated: currentData['last_updated'],
      cityName: json['location']['name'],
      tempC: currentData['temp_c'].toDouble(),
      feelsLikeC: currentData['feelslike_c'].toDouble(),
      condition: conditionData['text'],
    );
  }

  @override
  String toString() => ''' 
    Last updated: $lastUpdated
    Temperature: $tempC C
    Feels like: $feelsLikeC C
    Weather condition: $condition
    ''';
}

class Forecast {
  final String date;
  final double minTempC;
  final double maxTempC;
  final String condition;

  Forecast({
    required this.date,
    required this.minTempC,
    required this.maxTempC,
    required this.condition,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    final conditionData = json['day']['condition'];
    return Forecast(
      date: json['date'],
      minTempC: json['day']['mintemp_c'].toDouble(),
      maxTempC: json['day']['maxtemp_c'].toDouble(),
      condition: conditionData['text'],
    );
  }

  @override
  String toString() => ''' 
    Date: $date
    Temperature: $minTempC C - $maxTempC C
    Weather condition: $condition
    ''';
}
