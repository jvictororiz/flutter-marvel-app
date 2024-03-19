import 'package:result_dart/functions.dart';
import 'package:result_dart/result_dart.dart';

Result<Success, Exception> runCatching<Success extends Object>(Success Function() func) {
  try {
    return successOf(func.call());
  } on Exception catch (exception) {
    return exception.toFailure();
  }
}

Future<Result<Success, Exception>> runCatchingAsync<Success extends Object>(Future<Success> Function() func) async {
  try {
    return successOf(await func.call());
  } on Exception catch (exception) {
    return exception.toFailure();
  }
}
