import 'package:flutter/material.dart';
import 'package:food_app_folkatech/common/colors.dart';

class RefreshIndicatorWidget {
  static RefreshIndicator main(
      {required RefreshCallback onRefresh, required Widget child}) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: ConstColors.blue40,
      backgroundColor: ConstColors.white,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      child: child,
    );
  }
}
