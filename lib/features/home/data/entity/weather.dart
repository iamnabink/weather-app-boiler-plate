import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

/// https://app.quicktype.io/
/// http://api.weatherapi.com/v1/current.json?key=1b31a4a3ac5d4872855160704220611&q=London&aqi=no
///
@freezed
 class Weather with _$Weather {
  const Weather._();

  const factory Weather({
    @JsonKey(name: 'location') Location? location,
    @JsonKey(name: 'current') Current? current,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
 class Current with _$Current {
  const factory Current({
    @JsonKey(name: 'last_updated') String? lastUpdated,
    @JsonKey(name: 'temp_c') dynamic tempC,
    @JsonKey(name: 'feelslike_c') dynamic feelsLikeTempC,
    @JsonKey(name: 'temp_f') double? tempF,
    @JsonKey(name: 'is_day') dynamic isDay,
    @JsonKey(name: 'condition') Condition? condition,
  }) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}

@freezed
 class Condition with _$Condition {
  const factory Condition({
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'icon') String? icon,
  }) = _Condition;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
}

@freezed
 class Location with _$Location {
  const factory Location({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'localtime') String? localtime,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
