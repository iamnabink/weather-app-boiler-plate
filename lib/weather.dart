// import 'package:freezed_annotation/freezed_annotation.dart';
//
// https://app.quicktype.io/
// // http://api.weatherapi.com/v1/current.json?key=1b31a4a3ac5d4872855160704220611&q=London&aqi=no

// part 'weather.freezed.dart';
// part 'weather.g.dart';
//
// @freezed
// abstract class Weather with _$Weather {
//   const factory Weather({
//     Location location,
//     Current current,
//   }) = _Weather;
//
//   factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
// }
//
// @freezed
// abstract class Current with _$Current {
//   const factory Current({
//     int lastUpdatedEpoch,
//     String lastUpdated,
//     int tempC,
//     double tempF,
//     int isDay,
//     Condition condition,
//     double windMph,
//     double windKph,
//     int windDegree,
//     String windDir,
//     int pressureMb,
//     double pressureIn,
//     int precipMm,
//     int precipIn,
//     int humidity,
//     int cloud,
//     int feelslikeC,
//     double feelslikeF,
//     int visKm,
//     int visMiles,
//     int uv,
//     double gustMph,
//     double gustKph,
//   }) = _Current;
//
//   factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);
// }
//
// @freezed
// abstract class Condition with _$Condition {
//   const factory Condition({
//     String text,
//     String icon,
//     int code,
//   }) = _Condition;
//
//   factory Condition.fromJson(Map<String, dynamic> json) => _$ConditionFromJson(json);
// }
//
// @freezed
// abstract class Location with _$Location {
//   const factory Location({
//     String name,
//     String region,
//     String country,
//     double lat,
//     double lon,
//     String tzId,
//     int localtimeEpoch,
//     String localtime,
//   }) = _Location;
//
//   factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
// }
