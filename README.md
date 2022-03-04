### card_hash_generator

Um package para gerar card_hash para uso na Pagar.me

### Começando

Basta criar uma instância de CardHashGenerator passando sua chave de api da pagar.me, de dev ou prod (dependendo de qual ambiente você queira usar), e depois passar os dados do cartão de crédito para ser gerado seu card_hash!


```dart
import 'package:card_hash_generator/card_hash_generator.dart';

final cardHashGenerator = CardHashGenerator(apiKey: 'SUA APIKEY DA PAGAR.ME');

final cardHash = await cardHashGenerator.generate(
  cardNumber: '1234 1234 1234 1234',
  cardHolderName: 'Fulano de Tal',
  cardExpirationDate: '0324',
  cardCvv: '123',
);
```

Easy Peasy
