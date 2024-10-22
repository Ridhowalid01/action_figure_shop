import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status, this.minWidthBox=100, this.maxWidthBox=120, this.statusFontSize=14, this.horizontalPadding=16, this.verticalPadding=8});

  final String status;
  final double minWidthBox;
  final double maxWidthBox;
  final double statusFontSize;
  final double horizontalPadding;
  final double verticalPadding;

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
          horizontal: horizontalPadding,
          vertical: verticalPadding
      ),
      constraints: BoxConstraints(
        minWidth: minWidthBox,
        maxWidth: maxWidthBox,
      ),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(10)),
      child: Text(
        displayText,
        style: TextStyle(
            color: Colors.white, fontSize: statusFontSize, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
      ),
    );
  }
}
