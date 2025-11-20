import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;

  const WeatherCard({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 80,
      margin: margin ?? const EdgeInsets.only(right: 10),
      padding: padding ?? const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
