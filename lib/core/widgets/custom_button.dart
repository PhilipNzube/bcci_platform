import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? img;
  final Color imgColor;
  final double imgWidth;
  final double imgHeight;
  final double? width;
  final double? height;
  final Color backgroundColor;
  final Color foregroundColor;
  final double borderRadius;
  final WidgetStateProperty<EdgeInsetsGeometry?>? padding;
  final String text;
  final String fontFamily;
  final FontWeight? fontWeight;
  final double fontSize;
  final void Function()? onPressed;
  final bool isLoading;
  final Color loaderColor;
  final bool reverseTextAndImgOrder;
  final Color? pressColor;
  final double gap;
  final double elevation;

  const CustomButton({
    super.key,
    this.img,
    required this.text,
    this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    this.padding,
    this.isLoading = false,
    this.reverseTextAndImgOrder = false,
    this.imgWidth = 25,
    this.imgHeight = 25,
    this.width,
    this.height,
    this.borderRadius = 8,
    this.pressColor,
    this.gap = 0,
    this.loaderColor = Colors.white,
    this.imgColor = Colors.white,
    this.fontFamily = 'GolosText',
    this.fontWeight,
    this.fontSize = 16,
    this.elevation = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) => states.contains(WidgetState.pressed)
                ? foregroundColor
                : backgroundColor,
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) => states.contains(WidgetState.pressed)
                ? backgroundColor
                : foregroundColor,
          ),
          elevation: WidgetStateProperty.all<double>(elevation),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            ),
          ),
          padding: padding,
        ),
        child: isLoading
            ? CircularProgressIndicator(color: loaderColor)
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (reverseTextAndImgOrder == false && img != null)
                    Image.asset(
                      img!,
                      width: imgWidth,
                      height: imgHeight,
                      color: imgColor,
                      fit: BoxFit.contain,
                    ),
                  Gap(gap, isHorizontal: true),
                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontWeight: fontWeight,
                      fontSize: fontSize,
                    ),
                  ),
                  if (reverseTextAndImgOrder == true)
                    Image.asset(
                      img!,
                      width: imgWidth,
                      height: imgHeight,
                      color: imgColor,
                      fit: BoxFit.contain,
                    ),
                ],
              ),
      ),
    );
  }
}
