import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:moru_weather/core/data/remote/api_endpoints.dart';

void main() async {
  const expectedResponse = """
{
  "location": {
    "name": "Paris",
    "region": "Ile-de-France",
    "country": "France",
    "lat": 48.86,
    "lon": 2.35,
    "tz_id": "Europe/Paris",
    "localtime_epoch": 1667879786,
    "localtime": "2022-11-08 4:56"
  },
  "current": {
    "last_updated_epoch": 1667879100,
    "last_updated": "2022-11-08 04:45",
    "temp_c": 11,
    "temp_f": 51.8,
    "is_day": 0,
    "condition": {
      "text": "Clear",
      "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
      "code": 1000
    },
    "wind_mph": 11.9,
    "wind_kph": 19.1,
    "wind_degree": 170,
    "wind_dir": "S",
    "pressure_mb": 1007,
    "pressure_in": 29.74,
    "precip_mm": 0,
    "precip_in": 0,
    "humidity": 76,
    "cloud": 0,
    "feelslike_c": 8.7,
    "feelslike_f": 47.6,
    "vis_km": 10,
    "vis_miles": 6,
    "uv": 1,
    "gust_mph": 20.1,
    "gust_kph": 32.4
  }
}  
""";

  late Dio dio;
  late DioAdapter dioAdapter;

  group('WeatherAPITest', () {
    final baseUrl = 'http:"//api.weatherapi.com/v1';
    final apiKey = "1b31a4a3ac5d4872855160704220611";

    const latLon = "48.8567,2.350";
    const city = "Kathmandu";

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: baseUrl));
      dioAdapter = DioAdapter(
        dio: dio,

        // [FullHttpRequestMatcher] is a default matcher class
        // (which actually means you haven't to pass it manually) that matches entire URL.
        //
        // Use [UrlRequestMatcher] for matching request based on the path of the URL.
        //
        // Or create your own http-request matcher via extending your class from  [HttpRequestMatcher].
        matcher: const FullHttpRequestMatcher(),
      );
    });

    test('throw api key error', () async {
      final route = '/current.json?key=$apiKey&q=$baseUrl';

      dioAdapter.onGet(
        route,
        (server) => server.reply(
          200,
          null,
          // Adds one-sec delay to reply method.
          // Basically, I'd wait for one second before returning reply data.
          delay: const Duration(seconds: 1),
        ),
      );

      // Returns a response with 201 Created success status response code.
      final response = await dio.get(route);

      expect(response.data, expectedResponse);
    });

    test('signs in user and fetches account information', () async {
      final route = '/current.json?key=323jj2h3h23h2j3&q=$baseUrl';

      dioAdapter
        ..onGet(
          route,
          (server) => server.throws(
            403,
            DioError(
              requestOptions: RequestOptions(
                path: route,
              ),
            ),
          ),
        );

      // Returns an access token if user credentials are provided.
      final response = await dio.get(route);

      expect(response.data, 403);
    });
  });
}
