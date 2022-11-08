import 'package:boiler_plate/utils/colors.dart';
import 'package:boiler_plate/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BalanceCard extends StatelessWidget {
  final String name;
  final String icon;
  final String symbol;
  final double tokens;
  final double price;
  const BalanceCard(
      {Key? key,
      required this.name,
      required this.icon,
      required this.symbol,
      required this.tokens,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 40,
        width: 40,
        child: ClipOval(child: Image.network(icon, fit: BoxFit.cover)),
      ),
      title: Text(
        name,
        style: AppThemes.darkTheme.textTheme.bodyMedium
            ?.copyWith(color: kWhite, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        symbol,
        style: AppThemes.darkTheme.textTheme.bodyMedium?.copyWith(color: kGrey),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tokens.toString(),
            style: AppThemes.darkTheme.textTheme.bodyMedium
                ?.copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          Text(
            "\$ ${price.toStringAsFixed(2)}",
            style: AppThemes.darkTheme.textTheme.bodyMedium
                ?.copyWith(color: kWhite, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
