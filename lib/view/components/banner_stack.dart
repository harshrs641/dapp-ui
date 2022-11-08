import 'dart:async';
import 'package:boiler_plate/view/components/banner_card.dart';
import 'package:boiler_plate/view/screens/portfolio/portfolio_screen_view_model.dart';

//import 'package:animation_exp/PageReveal/page_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BannerStack extends ConsumerStatefulWidget {
  @override
  CardDemoState createState() => CardDemoState();
}

class CardDemoState extends ConsumerState<BannerStack>
    with TickerProviderStateMixin {
  late PortfolioScreenViewModel _viewModel;
  late AnimationController _buttonController;
  late Animation<double> rotate;
  late Animation<double> right;
  late Animation<double> bottom;
  late Animation<double> width;
  int flag = 0;

  @override
  void initState() {
    super.initState();

    _buttonController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    rotate = Tween<double>(
      begin: -0.0,
      end: -40.0,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    rotate.addListener(() {
      setState(() {
        if (rotate.isCompleted) {
          final i = _viewModel.banners.removeLast();
          _viewModel.banners.insert(0, i);

          _buttonController.reset();
        }
      });
    });

    right = Tween<double>(
      begin: 0.0,
      end: 400.0,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    bottom = Tween<double>(
      begin: 15.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    width = Tween<double>(
      begin: 20.0,
      end: 25.0,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  Future<void> _swipeAnimation() async {
    try {
      await _buttonController.forward();
    } on TickerCanceled {}
  }

  void swipeRight() {
    if (flag == 0) {
      setState(() {
        flag = 1;
      });
    }
    _swipeAnimation();
  }

  void swipeLeft() {
    if (flag == 1) {
      setState(() {
        flag = 0;
      });
    }
    _swipeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(portfolioScreenViewModel);
    timeDilation = 0.4;
    const initialBottom = 15.0;
    final dataLength = _viewModel.banners.length;
    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
    double backCardWidth = -10.0;
    return dataLength > 0
        ? Stack(
            // mainAxisSize: MainAxisSize.min,
            alignment: AlignmentDirectional.bottomCenter,
            children: _viewModel.banners.map((item) {
              if (_viewModel.banners.indexOf(item) == dataLength - 1) {
                return activeBanner(
                    item,
                    bottom.value,
                    right.value,
                    0.0,
                    backCardWidth + 10,
                    rotate.value,
                    rotate.value < -10 ? 0.1 : 0.0,
                    context,
                    _viewModel.dismissBanner,
                    flag,
                    swipeRight,
                    swipeLeft);
              } else {
                backCardPosition = backCardPosition - 10;
                backCardWidth = backCardWidth + 10;

                return backgroundBanner(
                  item,
                  backCardPosition,
                  0.0,
                  0.0,
                  backCardWidth,
                  0.0,
                  0.0,
                  context,
                );
              }
            }).toList())
        : Container();
  }
}
