import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../models/knob.dart';

class KnobRotateService {
  KnobRorateModel onKnobUpdate(
      BoxConstraints constraints, DragUpdateDetails details) {
    Offset centerOfGestureDetector =
        Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);

    final touchPositionFromCenter =
        details.localPosition - centerOfGestureDetector;
    final currentKnobValue = touchPositionFromCenter.direction / math.pi;

    final finalAngle = touchPositionFromCenter.direction;

    return KnobRorateModel(currentKnobValue, finalAngle);
  }
}
