import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hpc_food/constants/constants.dart';

void showCustomToast(BuildContext context, Color? color, String message) {
  final overlay = OverlayEntry(
    builder: (context) {
      return _CustomToast(color: color, message: message);
    },
  );

  Overlay.of(context).insert(overlay);
  Future.delayed(const Duration(seconds: 3), () {
    overlay.remove();
  });
}

class _CustomToast extends StatefulWidget {
  final Color? color;
  final String message;

  const _CustomToast({required this.color, required this.message});

  @override
  __CustomToastState createState() => __CustomToastState();
}

class __CustomToastState extends State<_CustomToast>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  double _topPosition = 30.h;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _opacity = 1.0;
        _topPosition = 50.h;
      });
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        _opacity = 0.0;
        _topPosition = 30.h;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      top: _topPosition,
      left: 20.w,
      right: 20.w,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _opacity,
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: widget.color ?? cTertiary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                widget.message,
                style: GoogleFonts.lexend(
                  color: cLightWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
