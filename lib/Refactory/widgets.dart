import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final bool borderEnable;

  final Color bordercolor;
  final double borderwidth;
  final Widget? child;

  const CustomContainer({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.borderEnable = false,
    this.bordercolor = Colors.white,
    this.borderwidth = 0,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(radius ?? 10),
            border: borderEnable == true
                ? Border.all(color: bordercolor, width: borderwidth)
                : null),
        child: Center(child: child),
      ),
    );
  }
}

//TEXT REFACTOR WIDGET;
Widget textwidget(
    {required String string,
    double paddingright = 0,
    double paddingleft = 0,
    Color? color,
    double? fontsize,
    FontWeight? fontweight,
    TextOverflow? overflow}) {
  return Padding(
    padding: EdgeInsets.only(left: paddingleft, right: paddingright),
    child: Text(
      string,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontweight,
        overflow: overflow,
      ),
    ),
  );
}

Widget iconWidget({
  required IconData icon,
  double? size,
  Color color = Colors.white,
  double? paddingleft,
  double? paddingright,
  Function()? ontap,
}) {
  return Padding(
    padding: EdgeInsets.only(left: paddingleft ?? 0, right: paddingright ?? 0),
    child: InkWell(
      onTap: ontap,
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    ),
  );
}
