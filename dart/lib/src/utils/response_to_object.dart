import 'package:shelf/shelf.dart' show Response;

Future<Map<String, dynamic>> responseToObject(Response res) async {
  return {
    'statusCode': res.statusCode,
    'headers': res.headers,
    'body': await res.readAsString(res.encoding),
    'encoding': res.encoding?.name
  };
}
