import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() async {
  test('Should print valid image url', () {
    var url = '//cdn.weatherapi.com/weather/64x64/day/143.png';
    var mod = 'http://${url.substring(2)}';
    expect(mod, 'http://cdn.weatherapi.com/weather/64x64/day/143.png');
  });

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
          expectedResponse,
          // Adds one-sec delay to reply method.
          // Basically, I'd wait for one second before returning reply data.
          delay: const Duration(seconds: 1),
        ),
      );

      // Returns a response with 201 Created success status response code.
      final response = await dio.get(route);

      expect(response.data, expectedResponse);
    });

    test('throws invalid api key error', () async {
      final route = '/current.json?key=asasa&q=$latLon';

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

      expect(
        () async => await dio.get(route),
        throwsA(isA<DioError>()),
      );

      // Returns an access token if user credentials are provided.
      // final response = await dio.get(route);
      //
      // expect(response.statusCode, 403);
    });
  });
}

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

const expectedError = """
  {
    "error": {
        "code": 2008,
        "message": "API key has been disabled."
    }
}
  """;
