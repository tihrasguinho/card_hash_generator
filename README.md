# card_hash_generator

A package to generate card_hash for use in Pagar.me

### Getting Started

You can just pass your apiKey to dev or prod environment and provide the card information to easily generate a card_hash to use in pagar.me!



```dart
import 'package:card_hash_generator/card_hash_generator.dart';

final cardHashGenerator = CardHashGenerator(apiKey: 'YOUR PAGAR.ME API KEY');
final cardHash = await cardHashGenerator.generate(
  cardNumber: '1234 1234 1234 1234',
  cardHolderName: 'John Doe',
  cardExpirationDate: '0324',
  cardCvv: '123',
);
```

Easy Peasy
