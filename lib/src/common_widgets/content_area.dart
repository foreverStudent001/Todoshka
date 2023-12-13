import 'package:clippy/src/global_things/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import '../global_things/presentation/themes/ui_parameters.dart';

class ContentArea extends StatelessWidget {
  //bool to check whether we want padding or not
  final bool addPadding;
  final Widget child; //send widget
  const ContentArea({
    Key? key,
    required this.child,
    this.addPadding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(color: customScaffoldColor(context)),
        padding: addPadding
            ? EdgeInsets.only(
                top: mobileScreenPadding, //todo: was mobileScrenPadding but isn't working ?
                left: mobileScreenPadding,
                right: mobileScreenPadding)
            : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
