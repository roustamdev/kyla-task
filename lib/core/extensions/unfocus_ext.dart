import 'package:flutter/material.dart';
import 'package:task/core/shared/presentation/router/index.dart';

extension UnfocusExt on Widget {
  Widget unfocus() => GestureDetector(
        onTap: () => FocusScope.of(GO.context).unfocus(),
        child: this,
      );
}
