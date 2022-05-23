import 'package:aws_lambda_runtime/aws_lambda_runtime.dart' as aws;
import 'package:shelf/shelf.dart' as shelf;

import 'package:vercel_dart_runtime/src/models/event.dart';
import 'package:vercel_dart_runtime/src/utils/response_to_object.dart';

void handle(shelf.Handler handler, {String name = 'bootstrap'}) {
  // ignore: prefer_function_declarations_over_variables
  final aws.Handler<Event> _handler = (context, event) async {
    final res = await handler(event.body);
    final body = await responseToObject(res);
    print(body);
    print(context.requestId);

    return aws.InvocationResult(
        context.requestId!, body);
  };

  aws.Runtime()
    ..registerEvent<Event>((Map<String, dynamic> json) => Event.fromJson(json))
    ..registerHandler<Event>(name, _handler)
    ..invoke();
}
