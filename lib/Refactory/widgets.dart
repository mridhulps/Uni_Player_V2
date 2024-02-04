import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

class MorphismContainer extends StatefulWidget {
  final bool? returnswitch;
  final double? width;
  final double? height;
  final double? radius;
  final Offset? offset1;
  final Offset? offset2;
  final double? blurradius;

  final Widget? child;
  final Function ontap;
  final bool disablebutton;

  const MorphismContainer({
    super.key,
    this.returnswitch = false,
    this.width,
    this.height,
    this.radius,
    this.offset1,
    this.offset2,
    this.blurradius,
    this.child,
    required this.ontap,
    this.disablebutton = false,
  });

  @override
  State<MorphismContainer> createState() => _MorphismContainerState();
}

class _MorphismContainerState extends State<MorphismContainer> {
  final color = const Color.fromRGBO(112, 112, 112, 1);
  final color2 = Colors.black54;
  final blurstyle = BlurStyle.solid;

  final trueoffset = const Offset(2, 2);

  bool ispressed = false;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.disablebutton,
      child: GestureDetector(
        onTap: () {
          if (widget.returnswitch == false) {
            setState(() {
              ispressed = !ispressed;
            });
            widget.ontap();
          } else {
            setState(() {
              ispressed = !ispressed;
              widget.ontap();
            });

            Timer(const Duration(milliseconds: 100), () {
              setState(() {
                ispressed = !ispressed;
              });
            });
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
                color: ConstColor.backgroundcolor,
                borderRadius: BorderRadius.circular(widget.radius ?? 0),
                boxShadow: [
                  widget.disablebutton == false
                      ? BoxShadow(
                          color: color2,
                          offset: ispressed == false
                              ? widget.offset2 ?? const Offset(3, 3)
                              : -trueoffset,
                          blurRadius: widget.blurradius ?? 0.0,
                          blurStyle: blurstyle)
                      : BoxShadow(
                          color: color,
                          offset: widget.offset1 ?? const Offset(3, 3),
                          blurRadius: widget.blurradius ?? 0,
                          blurStyle: blurstyle),
                  widget.disablebutton == false
                      ? BoxShadow(
                          offset: ispressed == false
                              ? widget.offset1 ?? const Offset(3, 3)
                              : trueoffset,
                          color: ispressed == false ? Colors.white24 : color,
                          blurRadius: widget.blurradius ?? 0.0,
                          blurStyle: blurstyle)
                      : BoxShadow(
                          color: color,
                          offset: widget.offset2 ?? const Offset(3, 3),
                          blurRadius: 5,
                          blurStyle: blurstyle),
                ]),
            child: Center(child: widget.child),
          ),
        ),
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

Widget iconWidget(
    {required IconData icon,
    double? size,
    Color? color,
    double? paddingleft,
    double? paddingright}) {
  return Padding(
    padding: EdgeInsets.only(left: paddingleft ?? 0, right: paddingright ?? 0),
    child: Icon(
      icon,
      size: size,
      color: color,
    ),
  );
}
