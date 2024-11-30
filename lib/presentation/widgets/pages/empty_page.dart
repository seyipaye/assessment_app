import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/values.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    super.key,
    this.title,
    this.desc,
    this.extras,
  });

  final String? title;
  final String? desc;
  final Widget? extras;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          spacer(h: AppSize.s40),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  title ?? '',
                  textAlign: TextAlign.center,
                  style: Get.theme.appBarTheme.titleTextStyle,
                ),
                spacer(h: AppSize.s24),
                Text(
                  desc ?? '',
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodySmall!,
                ),
                spacer(h: AppSize.s24),
                if (extras != null) extras!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
