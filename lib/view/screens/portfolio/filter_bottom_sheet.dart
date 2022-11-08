import 'package:boiler_plate/helpers/base_screen_view.dart';
import 'package:boiler_plate/routes/app_routes.dart';
import 'package:boiler_plate/utils/app_sizes.dart';
import 'package:boiler_plate/utils/colors.dart';
import 'package:boiler_plate/utils/themes.dart';
import 'package:boiler_plate/view/screens/portfolio/portfolio_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterBottomSheet extends ConsumerStatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  ConsumerState<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet> {
  late PortfolioScreenViewModel _viewModel;
  @override
  void initState() {
    _viewModel = ref.read(portfolioScreenViewModel);
    _viewModel.resetPreSelect();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    _viewModel = ref.watch(portfolioScreenViewModel);

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            margin: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width / 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kWhite.withOpacity(.7)),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sort By",
                  style: AppThemes.darkTheme.textTheme.bodyLarge
                      ?.copyWith(color: kWhite, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    _viewModel.changeSelect();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Done",
                    style: AppThemes.darkTheme.textTheme.bodyLarge?.copyWith(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: kWhite,
            height: 5,
          ),
          ...List.generate(_viewModel.sotByOptions.length, (index) {
            bool isSelected = _viewModel.preSelectedSortBy == index;
            return InkWell(
              onTap: () {
                _viewModel.changePreSelect(index);
              },
              child: Container(
                padding: EdgeInsets.all(16),
                color: isSelected ? kPrimaryColor : Colors.transparent,
                child: Row(
                  children: [
                    Text(
                      _viewModel.sotByOptions[index],
                      style: isSelected
                          ? AppThemes.darkTheme.textTheme.bodyLarge?.copyWith(
                              color: kBlack, fontWeight: FontWeight.bold)
                          : AppThemes.darkTheme.textTheme.bodyMedium?.copyWith(
                              color: kWhite, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          }),
          gapH24
        ],
      ),
    );
  }
}
