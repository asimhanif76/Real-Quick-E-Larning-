// import 'package:flutter/material.dart';
// import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

// class GlassContainer extends StatelessWidget {
//   final double? borderRadius;
//   final Widget child;
//   GlassContainer({super.key, this.borderRadius = 25, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return LiquidGlassLayer(
//       settings: const LiquidGlassSettings(thickness: 15, blur: 2),
//       child: LiquidGlass.withOwnLayer(
//         settings: LiquidGlassSettings(
//           thickness: 20, // how thick the glass layer is
//           blur: 1.6, // higher blur = more frosted effect
//           ambientStrength: 2, // subtle ambient light
//           lightIntensity: 2, // subtle highlight
//           saturation: 1.1, // slightly boost colors behind glas
//           visibility: 1, // how much glass is visible
//           refractiveIndex: 1.2, // slight bending effect
//           lightAngle: 5, // angle of the light reflection
//           glassColor: Colors.white12, // slightly opaque white
//         ),
//         shape: LiquidRoundedSuperellipse(borderRadius: borderRadius!),
//         child: child,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class GlassContainer extends StatelessWidget {
  final double? borderRadius;
  final Widget child;
  final bool? showBorder;
  final Color? color;

  const GlassContainer({
    super.key,
    this.borderRadius = 25,
    required this.child,
    this.showBorder = true,
    this.color = Colors.white12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        border: showBorder == true
            ? Border.all(
                color: Colors.black12, // glass black border
                width: 1.2,
              )
            : null,
      ),

      child: LiquidGlassLayer(
        settings: const LiquidGlassSettings(thickness: 15, blur: 2),
        child: LiquidGlass.withOwnLayer(
          settings: LiquidGlassSettings(
            thickness: 20,
            blur: 1.2,
            ambientStrength: 0,
            lightIntensity: 2,
            saturation: 0.9,
            visibility: 2,
            refractiveIndex: 1.2,
            lightAngle: 5,
            glassColor: color!,
          ),
          shape: LiquidRoundedSuperellipse(borderRadius: borderRadius!),
          child: child,
        ),
      ),
    );
  }
}
