
class WeatherCurrentCondition {


  String? text;
  String? icon;
  int? code;

  WeatherCurrentCondition({
    this.text,
    this.icon,
    this.code,
  });
  WeatherCurrentCondition.fromJson(Map<String, dynamic> json) {
    text = json["text"]?.toString();
    icon = json["icon"]?.toString();
    code = json["code"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["text"] = text;
    data["icon"] = icon;
    data["code"] = code;
    return data;
  }
}

class WeatherCurrent {


  int? lastUpdatedEpoch;
  String? lastUpdated;
  int? tempC;
  double? tempF;
  int? isDay;
  WeatherCurrentCondition? condition;
  int? windMph;
  int? windKph;
  int? windDegree;
  String? windDir;
  int? pressureMb;
  int? pressureIn;
  int? precipMm;
  int? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  int? visKm;
  int? visMiles;
  int? uv;
  double? gustMph;
  int? gustKph;

  WeatherCurrent({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });
  WeatherCurrent.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json["last_updated_epoch"]?.toInt();
    lastUpdated = json["last_updated"]?.toString();
    tempC = json["temp_c"]?.toInt();
    tempF = json["temp_f"]?.toDouble();
    isDay = json["is_day"]?.toInt();
    condition = (json["condition"] != null) ? WeatherCurrentCondition.fromJson(json["condition"]) : null;
    windMph = json["wind_mph"]?.toInt();
    windKph = json["wind_kph"]?.toInt();
    windDegree = json["wind_degree"]?.toInt();
    windDir = json["wind_dir"]?.toString();
    pressureMb = json["pressure_mb"]?.toInt();
    pressureIn = json["pressure_in"]?.toInt();
    precipMm = json["precip_mm"]?.toInt();
    precipIn = json["precip_in"]?.toInt();
    humidity = json["humidity"]?.toInt();
    cloud = json["cloud"]?.toInt();
    feelslikeC = json["feelslike_c"]?.toDouble();
    feelslikeF = json["feelslike_f"]?.toDouble();
    visKm = json["vis_km"]?.toInt();
    visMiles = json["vis_miles"]?.toInt();
    uv = json["uv"]?.toInt();
    gustMph = json["gust_mph"]?.toDouble();
    gustKph = json["gust_kph"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["last_updated_epoch"] = lastUpdatedEpoch;
    data["last_updated"] = lastUpdated;
    data["temp_c"] = tempC;
    data["temp_f"] = tempF;
    data["is_day"] = isDay;
    if (condition != null) {
      data["condition"] = condition!.toJson();
    }
    data["wind_mph"] = windMph;
    data["wind_kph"] = windKph;
    data["wind_degree"] = windDegree;
    data["wind_dir"] = windDir;
    data["pressure_mb"] = pressureMb;
    data["pressure_in"] = pressureIn;
    data["precip_mm"] = precipMm;
    data["precip_in"] = precipIn;
    data["humidity"] = humidity;
    data["cloud"] = cloud;
    data["feelslike_c"] = feelslikeC;
    data["feelslike_f"] = feelslikeF;
    data["vis_km"] = visKm;
    data["vis_miles"] = visMiles;
    data["uv"] = uv;
    data["gust_mph"] = gustMph;
    data["gust_kph"] = gustKph;
    return data;
  }
}

class WeatherLocation {


  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  WeatherLocation({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });
  WeatherLocation.fromJson(Map<String, dynamic> json) {
    name = json["name"]?.toString();
    region = json["region"]?.toString();
    country = json["country"]?.toString();
    lat = json["lat"]?.toDouble();
    lon = json["lon"]?.toDouble();
    tzId = json["tz_id"]?.toString();
    localtimeEpoch = json["localtime_epoch"]?.toInt();
    localtime = json["localtime"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = name;
    data["region"] = region;
    data["country"] = country;
    data["lat"] = lat;
    data["lon"] = lon;
    data["tz_id"] = tzId;
    data["localtime_epoch"] = localtimeEpoch;
    data["localtime"] = localtime;
    return data;
  }
}

class Weather {

  WeatherLocation? location;
  WeatherCurrent? current;

  Weather({
    this.location,
    this.current,
  });
  Weather.fromJson(Map<String, dynamic> json) {
    location = (json["location"] != null) ? WeatherLocation.fromJson(json["location"]) : null;
    current = (json["current"] != null) ? WeatherCurrent.fromJson(json["current"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (location != null) {
      data["location"] = location!.toJson();
    }
    if (current != null) {
      data["current"] = current!.toJson();
    }
    return data;
  }
}
