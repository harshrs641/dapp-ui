class TokenBalanceModel {
  final String name;
  final String symbol;
  final String image;
  final double balance;
  final double price;

  TokenBalanceModel({
    required this.name,
    required this.symbol,
    required this.image,
    required this.balance,
    required this.price,
  });
}

final tokensBalanceData = [
  TokenBalanceModel(
      balance: 64,
      image:
          'https://raw.githubusercontent.com/solana-labs/token-list/main/assets/mainnet/3SghkPdBSrpF9bzdAy5LwR4nGgFbqNcC6ZSq8vtZdj91/logo.png',
      name: 'EveryOne Coin',
      price: 255.21,
      symbol: 'EV1'),
  TokenBalanceModel(
      balance: 764,
      image:
          'https://raw.githubusercontent.com/solana-labs/token-list/main/assets/mainnet/Fm9rHUTF5v3hwMLbStjZXqNBBoZyGriQaFM6sTFz3K8A/logo.png',
      name: 'MonkeyBucks',
      price: 55.21,
      symbol: 'MBS'),
  TokenBalanceModel(
      balance: 0.0164,
      image:
          'https://raw.githubusercontent.com/solana-labs/token-list/main/assets/mainnet/HDiA4quoMibAGeJQzvxajp3Z9cvnkNng99oVrnuNj6px/logo.png',
      name: 'KING SAMO',
      price: 1.21,
      symbol: 'KSAMO'),
];
