class ForecastModel {
  Current? current;
  Forecast? forecast;

  ForecastModel({this.current, this.forecast});

  ForecastModel.fromJson(Map<String, dynamic> json) {
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
    forecast = json['forecast'] != null
        ? new Forecast.fromJson(json['forecast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    if (this.forecast != null) {
      data['forecast'] = this.forecast!.toJson();
    }
    return data;
  }
}

class Current {
  int? tempC;
  Condition? condition;

  Current({
    this.tempC,
    this.condition,
  });

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];

    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp_c'] = this.tempC;
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    return data;
  }
}

class Condition {
  String? text;
  String? icon;

  Condition({this.text, this.icon});

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
  List<Hour>? hour;

  Forecastday({this.date, this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(new Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;

    if (this.hour != null) {
      data['hour'] = this.hour!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hour {
  String? time;
  double? tempC;
  Condition? condition;

  Hour({
    this.time,
    this.tempC,
    this.condition,
  });

  Hour.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    tempC = json['temp_c'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['temp_c'] = this.tempC;
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    return data;
  }
}
