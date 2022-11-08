import 'package:boiler_plate/helpers/base_screen_view.dart';
import 'package:boiler_plate/routes/app_routes.dart';
import 'package:boiler_plate/utils/colors.dart';
import 'package:boiler_plate/utils/themes.dart';
import 'package:boiler_plate/view/components/balance_card.dart';
import 'package:boiler_plate/view/components/banner_stack.dart';
import 'package:boiler_plate/view/components/portfolio_card.dart';
import 'package:boiler_plate/view/screens/portfolio/filter_bottom_sheet.dart';
import 'package:boiler_plate/view/screens/portfolio/portfolio_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PortfolioScreen extends ConsumerStatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends ConsumerState<PortfolioScreen>
    with BaseScreenView {
  late PortfolioScreenViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(portfolioScreenViewModel);

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {
            showBottomSheet();
          },
          child: const Icon(
            Icons.swap_vert_sharp,
            color: kBlack,
            size: 35,
          )),
      backgroundColor: kDarkGrey,
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Column(
            children: [
              const SizedBox(
                height: kToolbarHeight,
              ),
              const PortfolioCard(),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                height: _viewModel.banners.isEmpty ? 0 : screenSize.height / 15,
              ),
              _buildTokensBalance()
            ],
          ),
          BannerStack()
        ],
      ),
    );
  }

  Widget _buildTokensBalance() {
    return Expanded(
      child: AnimatedContainer(
        color: kBlack,
        padding: EdgeInsets.only(top: _viewModel.banners.isEmpty ? 0 : 32),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => BalanceCard(
            icon: _viewModel.tokensBalance[index].image,
            name: _viewModel.tokensBalance[index].name,
            price: _viewModel.tokensBalance[index].price,
            symbol: _viewModel.tokensBalance[index].symbol,
            tokens: _viewModel.tokensBalance[index].balance,
          ),
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: kGrey,
            ),
          ),
          itemCount: _viewModel.tokensBalance.length,
        ),
      ),
    );
  }

  @override
  void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
    context.pushNamed(
      appRoute.name, params: params ?? {},
      // {"fid": NavBarScreens.data[1].id},
    );
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  Future<void> showBottomSheet() {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        backgroundColor: kDarkGrey,
        context: context,
        builder: (context) => const FilterBottomSheet());
    // TODO: implement showBottomSheet
  }
}
