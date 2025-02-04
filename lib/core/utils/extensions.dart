import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ResponsiveSizeExtension on num {
  SizedBox get wi => SizedBox(width: w);

  SizedBox get hi => SizedBox(height: h);
}

extension AssetsImage on String {
  String get png => 'assets/images/$this.png';

  String get svg => 'assets/svg/$this.svg';
}

extension PaddingExtension on Widget {
  Widget padAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget padHorizontal(double horizontal) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal.w),
      child: this,
    );
  }

  Widget padVertical(double vertical) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical.h),
      child: this,
    );
  }

  Widget padOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        left.h,
        top.w,
        right.h,
        bottom.w,
      ),
      child: this,
    );
  }
}

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  void pop<T extends Object?>([T? result]) {
    return Navigator.of(this).pop(result);
  }

  Future<T?> push<T extends Object?>(Route<T> route) {
    return Navigator.of(this).push(route);
  }

  Future<T?> pushNamed<T extends Object?>(String routeName,
      {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }
}
