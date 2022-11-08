import 'package:boiler_plate/data/local/banner_model.dart';
import 'package:boiler_plate/data/local/token_balance_model.dart';
import 'package:boiler_plate/helpers/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final portfolioScreenViewModel =
    ChangeNotifierProvider((ref) => PortfolioScreenViewModel());

class PortfolioScreenViewModel extends BaseViewModel {
  List<TokenBalanceModel> tokensBalance = tokensBalanceData;
  //// BANNERS
  final banners = [
    BannerModel(
      backgroundImage: 'assets/images/banners/3.png',
      title: "DISCOVER DAPPS",
      subtitle: "Join the metaverse",
    ),
    BannerModel(
      backgroundImage: 'assets/images/banners/2.png',
      title: "BAKE TEZ",
      subtitle: "And earn rewards",
    ),
    BannerModel(
      backgroundImage: 'assets/images/banners/1.png',
      title: "BUY TEZ",
      subtitle: "Buy tez with cash now",
    ),
  ];
  void dismissBanner(BannerModel img) {
    banners.remove(img);
    notifyListeners();
  }

  /// TOKENS BALANCE
  List<String> sotByOptions = [
    "Price : Lowest to high",
    "Price : Highest to low"
  ];
  int? selectedSortBy;
  void changeSelect() {
    selectedSortBy = preSelectedSortBy;
    switch (selectedSortBy) {
      case 0:
        tokensBalance.sort((a, b) {
          return (a.balance - b.balance).toInt();
        });
        break;
      case 1:
        tokensBalance.sort((a, b) {
          return (b.balance - a.balance).toInt();
        });
        break;
      default:
    }
    notifyListeners();
  }

  void resetSelect() {
    selectedSortBy = null;
    tokensBalance = tokensBalanceData;
    notifyListeners();
  }

  int? preSelectedSortBy;
  void changePreSelect(int index) {
    preSelectedSortBy = index;
    notifyListeners();
  }

  void resetPreSelect() {
    preSelectedSortBy = selectedSortBy;
  }
}
