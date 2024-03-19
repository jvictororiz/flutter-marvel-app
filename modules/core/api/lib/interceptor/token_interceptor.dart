import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';

class TokenInterceptor extends Interceptor {
  final FirebaseDatabase _firebaseDatabase;

  TokenInterceptor(this._firebaseDatabase);

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      const publicKey = "916330231d85c1fac17c72bdda7132b3";
      String privateKey = (await _firebaseDatabase.ref().child("private_key").get()).value as String;
      final hash = "$timestamp$privateKey$publicKey";

      options.queryParameters["ts"] = [timestamp];
      options.queryParameters["apikey"] = [publicKey];
      options.queryParameters["hash"] = [textToMd5(hash)];
    } catch (exception) {
      throw Exception("error generate token");
    }

    super.onRequest(options, handler);
  }

  String textToMd5(String text) {
    return md5.convert(text.codeUnits).toString();
  }
}
