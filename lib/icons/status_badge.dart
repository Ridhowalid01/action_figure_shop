import 'package:flutter/material.dart';
import 'package:action_figure_shop/utils/dimensions.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.status,
    this.minWidthBox,
    this.maxWidthBox,
    this.statusFontSize,
    this.horizontalPadding,
    this.verticalPadding,
  });

  final String status;
  final double? minWidthBox;
  final double? maxWidthBox;
  final double? statusFontSize;
  final double? horizontalPadding;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    String displayText;

    switch (status) {
      case 'Ready':
        bgColor = Colors.green;
        displayText = status;
        break;
      case 'Sold Out':
        bgColor = Colors.red;
        displayText = status;
        break;
      case 'Pre-order':
        bgColor = Colors.blueGrey;
        displayText = status;
        break;
      default:
        return const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? Dimensions.width16,
        vertical: verticalPadding ?? Dimensions.height8,
      ),
      constraints: BoxConstraints(
        minWidth: minWidthBox ?? Dimensions.width100,
        maxWidth: maxWidthBox ?? Dimensions.width120,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(Dimensions.radius10),
      ),
      child: Text(
        displayText,
        style: TextStyle(
          color: Colors.white,
          fontSize: statusFontSize ?? Dimensions.font14,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
