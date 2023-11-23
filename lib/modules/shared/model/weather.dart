class WeatherDTO {
  final List<Root2> root2;

  WeatherDTO({required this.root2});

  factory WeatherDTO.fromJson(List<dynamic> json) {
    List<Root2> root2 = json.map((data) => Root2.fromJson(data)).toList();
    return WeatherDTO(root2: root2);
  }
}

class Root2 {
  final int id;
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String url;

  Root2({
    required this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.url,
  });

  factory Root2.fromJson(Map<String, dynamic> json) {
    return Root2(
      id: json['id'] as int,
      name: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      url: json['url'] as String,
    );
  }
}

class Root {
  final Location location;
  final Current current;

  Root({required this.location, required this.current});

  factory Root.fromJson(Map<String, dynamic> json) {
    return Root(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
    );
  }
}

class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      tzId: json['tz_id'] as String,
      localtimeEpoch: json['localtime_epoch'] as int,
      localtime: json['localtime'] as String,
    );
  }
}

class Current {
  final int lastUpdatedEpoch;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double visKm;
  final double visMiles;
  final int uv;
  final double gustMph;
  final double gustKph;
  final AirQuality airQuality;

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
    required this.airQuality,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      lastUpdatedEpoch: json['last_updated_epoch'] as int,
      lastUpdated: json['last_updated'] as String,
      tempC: json['temp_c'] as double,
      tempF: json['temp_f'] as double,
      isDay: json['is_day'] as int,
      condition: Condition.fromJson(json['condition']),
      windMph: json['wind_mph'] as double,
      windKph: json['wind_kph'] as double,
      windDegree: json['wind_degree'] as int,
      windDir: json['wind_dir'] as String,
      pressureMb: json['pressure_mb'] as double,
      pressureIn: json['pressure_in'] as double,
      precipMm: json['precip_mm'] as double,
      precipIn: json['precip_in'] as double,
      humidity: json['humidity'] as int,
      cloud: json['cloud'] as int,
      feelslikeC: json['feelslike_c'] as double,
      feelslikeF: json['feelslike_f'] as double,
      visKm: json['vis_km'] as double,
      visMiles: json['vis_miles'] as double,
      uv: json['uv'] as int,
      gustMph: json['gust_mph'] as double,
      gustKph: json['gust_kph'] as double,
      airQuality: AirQuality.fromJson(json['air_quality']),
    );
  }
}

class Condition {
  final String text;
  final String icon;
  final int code;

  Condition({required this.text, required this.icon, required this.code});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'] as String,
      icon: json['icon'] as String,
      code: json['code'] as int,
    );
  }
}

class AirQuality {
  final double co;
  final double no2;
  final double o3;
  final double so2;
  final double pm25;
  final double pm10;
  final int usEpaIndex;
  final int gbDefraIndex;

  AirQuality({
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm25,
    required this.pm10,
    required this.usEpaIndex,
    required this.gbDefraIndex,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) {
    return AirQuality(
      co: json['co'] as double,
      no2: json['no2'] as double,
      o3: json['o3'] as double,
      so2: json['so2'] as double,
      pm25: json['pm2_5'] as double,
      pm10: json['pm10'] as double,
      usEpaIndex: json['us-epa-index'] as int,
      gbDefraIndex: json['gb-defra-index'] as int,
    );
  }
}
