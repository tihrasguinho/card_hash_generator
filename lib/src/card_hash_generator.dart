import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:card_hash_generator/src/exceptions/card_hash_exception.dart';
import 'package:pointycastle/asymmetric/api.dart';

class CardHashGenerator {
  final String apiKey;

  CardHashGenerator({required this.apiKey});

  Future<String> generate({
    required String cardNumber,
    required String cardHolderName,
    required String cardExpirationDate,
    required String cardCvv,
  }) async {
    try {
      final dio = Dio();

      final response = await dio.get(
        'https://api.pagar.me/1/transactions/card_hash_key?api_key=$apiKey',
        options: Options(contentType: 'application/json'),
      );

      if (response.statusCode == 200) {
        final card = 'card_number=$cardNumber&card_holder_name=$cardHolderName&card_expiration_date=$cardExpirationDate&card_cvv=$cardCvv';
        final data = response.data as Map;
        final key = data['public_key'];
        final parser = RSAKeyParser();
        final publicKey = parser.parse(key) as RSAPublicKey;
        final encrypter = Encrypter(RSA(publicKey: publicKey));
        final encrypted = encrypter.encrypt(card);
        return '${data['id']}_${encrypted.base64}';
      } else {
        throw CardHashException('Não foi possível gerar card_hash, verifique suas informações passadas');
      }
    } on CardHashException {
      rethrow;
    } on DioError {
      rethrow;
    } on Exception {
      rethrow;
    }
  }
}
