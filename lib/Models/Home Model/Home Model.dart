class HomeModel {
  Location? location;
  Current? current;

  HomeModel({this.location, this.current});

  HomeModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    current =
    json['current'] != null ? new Current.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    return data;
  }
}

class Location {
  String? name;
  String? region;
  String? country;

  int? localtimeEpoch;

  Location(
      {this.name,
        this.region,
        this.country,
        this.localtimeEpoch,
      });

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];

    localtimeEpoch = json['localtime_epoch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['region'] = this.region;
    data['country'] = this.country;
    data['localtime_epoch'] = this.localtimeEpoch;
    return data;
  }
}

class Current {
  int? tempC;
  Condition? condition;
  int? windKph;
  String? windDir;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;


  Current(
      {

        this.tempC,

        this.condition,
        this.windKph,
        this.windDir,
        this.humidity,
        this.cloud,
        this.feelslikeC,
        this.feelslikeF,
      });

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
    windKph = json['wind_kph'];
    windDir = json['wind_dir'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    data['wind_kph'] = this.windKph;
    data['wind_dir'] = this.windDir;
    data['humidity'] = this.humidity;
    data['cloud'] = this.cloud;
    data['feelslike_c'] = this.feelslikeC;
    data['feelslike_f'] = this.feelslikeF;
    return data;
  }
}

class Condition {
  String? text;
  String? icon;

  Condition({this.text, this.icon, });

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['icon'] = this.icon;
    return data;
  }
}
