class TideModel {
  Location? location;
  Forecast? forecast;

  TideModel({this.location, this.forecast});

  TideModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    forecast = json['forecast'] != null
        ? new Forecast.fromJson(json['forecast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.forecast != null) {
      data['forecast'] = this.forecast!.toJson();
    }
    return data;
  }
}

class Location {
  String? name;
  String? region;
  String? country;


  Location(
      {this.name,
        this.region,
        this.country,

      });

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['region'] = this.region;
    data['country'] = this.country;
    return data;
  }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(new Forecastday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.forecastday != null) {
      data['forecastday'] = this.forecastday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Forecastday {
  String? date;
  Day? day;

  Forecastday({this.date, this.day});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'] != null ? new Day.fromJson(json['day']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.day != null) {
      data['day'] = this.day!.toJson();
    }

    return data;
  }
}

class Day {
  double? maxwindKph;
  int? totalprecipMm;
  List<Tides>? tides;

  Day(
      {

        this.maxwindKph,
        this.totalprecipMm,
        this.tides,
      });

  Day.fromJson(Map<String, dynamic> json) {
    maxwindKph = json['maxwind_kph'];
    totalprecipMm = json['totalprecip_mm'];
    if (json['tides'] != null) {
      tides = <Tides>[];
      json['tides'].forEach((v) {
        tides!.add(new Tides.fromJson(v));
      });
    }


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maxwind_kph'] = this.maxwindKph;
    data['totalprecip_mm'] = this.totalprecipMm;
    if (this.tides != null) {
      data['tides'] = this.tides!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Tides {
  List<Tide>? tide;

  Tides({this.tide});

  Tides.fromJson(Map<String, dynamic> json) {
    if (json['tide'] != null) {
      tide = <Tide>[];
      json['tide'].forEach((v) {
        tide!.add(new Tide.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tide != null) {
      data['tide'] = this.tide!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tide {
  String? tideTime;
  String? tideHeightMt;
  String? tideType;

  Tide({this.tideTime, this.tideHeightMt, this.tideType});

  Tide.fromJson(Map<String, dynamic> json) {
    tideTime = json['tide_time'];
    tideHeightMt = json['tide_height_mt'];
    tideType = json['tide_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tide_time'] = this.tideTime;
    data['tide_height_mt'] = this.tideHeightMt;
    data['tide_type'] = this.tideType;
    return data;
  }
}




