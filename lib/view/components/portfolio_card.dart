import 'package:boiler_plate/utils/app_sizes.dart';
import 'package:boiler_plate/utils/colors.dart';
import 'package:boiler_plate/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PortfolioCard extends StatelessWidget {
  const PortfolioCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: kBlack,
        child: SizedBox(
          height: size.height / 4,
          child: Column(
            children: [
              _buildPortfolioInfo(),
              const Spacer(),
              Row(
                children: [
                  actonButton(
                      text: "Send", icon: Icons.arrow_upward, onPressed: () {}),
                  actonButton(
                      text: "Recieve",
                      icon: Icons.call_received,
                      onPressed: () {}),
                  const Spacer(),
                  actonButton(
                      text: "Scan", icon: Icons.qr_code, onPressed: () {})
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPortfolioInfo() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Portfolio Balance",
                style: AppThemes.darkTheme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold, color: kWhite),
              ),
              Text(
                "\$47.3",
                style: AppThemes.darkTheme.textTheme.bodyLarge?.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              )
            ],
          ),
          profilBatch()
        ],
      ),
    );
  }

  Widget profilBatch() {
    return Card(
      color: kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: kWhite,
              radius: 12,
              child: Text(
                "H",
                style: AppThemes.darkTheme.textTheme.bodySmall
                    ?.copyWith(color: kBlack, fontWeight: FontWeight.bold),
              ),
            ),
            gapW10,
            Text(
              "Harsh",
              style: AppThemes.darkTheme.textTheme.bodySmall
                  ?.copyWith(color: kBlack, fontWeight: FontWeight.bold),
            ),
            gapW10,
            const Icon(Icons.keyboard_arrow_down_outlined)
          ],
        ),
      ),
    );
  }

  Widget actonButton(
      {required String text,
      required IconData icon,
      required Function onPressed}) {
    return InkWell(
      customBorder: CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: kWhite,
              child: Icon(
                icon,
                color: kBlack,
              ),
            ),
            gapH10,
            Text(
              text,
              style: AppThemes.darkTheme.textTheme.bodySmall
                  ?.copyWith(color: kWhite, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
