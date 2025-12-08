import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartykids/ui/core/themes/app_color.dart';
import 'package:smartykids/utils/custom_screen_util.dart';

import '../base/api_render_state.dart';

class StackLoader extends StatelessWidget {
  final ApiRenderState state;
  final Widget content;
  final bool isTransparent;

  const StackLoader({super.key, required this.state, required this.content, this.isTransparent = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        content,
        Visibility(visible: state is LoadingState, child: _Loader(isTransparent: isTransparent)),
      ],
    );
  }
}

class _Loader extends StatelessWidget {
  final bool isTransparent;

  const _Loader({super.key, required this.isTransparent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(color: Colors.black.withOpacity(isTransparent ? 0 : 0.5)),
        Center(
          child: Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.w), color: Colors.white),
            child: Center(
              child: Platform.isIOS
                  ? CupertinoActivityIndicator(color: AppColorsData.green4D8B31.value, radius: 15)
                  : CircularProgressIndicator(color: AppColorsData.green4D8B31.value, year2023: true),
            ),
          ),
        ),
      ],
    );
  }
}

class StackBarrier extends StatelessWidget {
  final ApiRenderState state;
  final Widget content;
  final bool isTransparent;

  const StackBarrier({super.key, required this.state, required this.content, this.isTransparent = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        content,
        Visibility(
          visible: state is LoadingState,
          child: Container(height: double.infinity, width: double.infinity, color: Colors.transparent),
        ),
      ],
    );
  }
}