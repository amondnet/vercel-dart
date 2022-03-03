import 'package:shelf/shelf.dart';
import 'package:vercel_dart_runtime/vercel_dart_runtime.dart' show handle;

void main() => handle((Request req) async {
      return Response.ok(req.url);
    });
