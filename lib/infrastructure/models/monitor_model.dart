class MonitorModel {
  final Datetime datetime;
  final Map<String, MonitorDatum> monitors;

  MonitorModel({required this.datetime, required this.monitors});

  factory MonitorModel.fromJson(Map<String, dynamic> json) => MonitorModel(
    datetime: Datetime.fromJson(json["datetime"]),
    monitors: Map.from(json["monitors"]).map(
      (k, v) => MapEntry<String, MonitorDatum>(k, MonitorDatum.fromJson(v)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "datetime": datetime.toJson(),
    "monitors": Map.from(
      monitors,
    ).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Datetime {
  final String date;
  final String time;

  Datetime({required this.date, required this.time});

  factory Datetime.fromJson(Map<String, dynamic> json) =>
      Datetime(date: json["date"], time: json["time"]);

  Map<String, dynamic> toJson() => {"date": date, "time": time};
}

class MonitorDatum {
  final double change;
  final Color color;
  final String? image;
  final DateTime lastUpdate;
  final double percent;
  final double price;
  final double priceOld;
  final Symbol symbol;
  final String title;

  MonitorDatum({
    required this.change,
    required this.color,
    required this.image,
    required this.lastUpdate,
    required this.percent,
    required this.price,
    required this.priceOld,
    required this.symbol,
    required this.title,
  });

  factory MonitorDatum.fromJson(Map<String, dynamic> json) => MonitorDatum(
    change: json["change"]?.toDouble(),
    color: colorValues.map[json["color"]]!,
    image: json["image"],
    lastUpdate: DateTime.parse(json["last_update"]),
    percent: json["percent"]?.toDouble(),
    price: json["price"]?.toDouble(),
    priceOld: json["price_old"]?.toDouble(),
    symbol: symbolValues.map[json["symbol"]]!,
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "change": change,
    "color": colorValues.reverse[color],
    "image": image,
    "last_update": lastUpdate.toIso8601String(),
    "percent": percent,
    "price": price,
    "price_old": priceOld,
    "symbol": symbolValues.reverse[symbol],
    "title": title,
  };
}

enum Color { GREEN, NEUTRAL }

final colorValues = EnumValues({
  "green": Color.GREEN,
  "neutral": Color.NEUTRAL,
});

enum Symbol { EMPTY, SYMBOL }

final symbolValues = EnumValues({"▲": Symbol.EMPTY, "": Symbol.SYMBOL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
