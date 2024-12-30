import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
class Flutter3d extends StatefulWidget {
  const Flutter3d({super.key});

  @override
  State<Flutter3d> createState() => _Flutter3dState();
}

class _Flutter3dState extends State<Flutter3d> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModelViewer(src: "assets/upgraded_astro_detainer_rigged.glb"),
    );
  }
}
