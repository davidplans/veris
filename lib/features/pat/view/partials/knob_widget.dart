import 'package:Veris/core/utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class KnobWidget extends StatefulWidget {
  final double currentKnobValue;
  final double knobValueRange;
  final void Function(double) onChangedKnobValue;
  const KnobWidget({
    super.key,
    required this.currentKnobValue,
    required this.knobValueRange,
    required this.onChangedKnobValue,
  });

  @override
  State<KnobWidget> createState() => _KnobWidgetState();
}

class _KnobWidgetState extends State<KnobWidget> {
  double _angle = 0.0;
  double _angleKnobView = 0.0;
  double lastRadien = 0.0;

  Offset lastVector = Offset.zero;

  @override
  void initState() {
    _angle = _currentAngle();
    super.initState();
  }

  double _currentAngle() {
    var rad;
    var normalisedValue = (widget.currentKnobValue + widget.knobValueRange) /
        (2 * widget.knobValueRange);
    // print('NORMALISEDVALUE: ${normalisedValue}');
    var shiftedRad = normalisedValue * (2 * math.pi);
    // print('SHIFTEDRAD: ${shiftedRad}');
    // var rad = (shiftedRad - math.pi) % (2 * math.pi);
    var result = shiftedRad - math.pi;
    if (result > 0) {
      rad = result % (2 * math.pi);
    } else {
      rad = result;
    }
    print("Original value is ${widget.currentKnobValue}, rad is $rad");
    return rad;
  }

  _updateCurrentValue(double value, double range) {
      var shiftedRad = (value + math.pi) % (2 * math.pi);
      var mapping = -range + (shiftedRad / (2 * math.pi) * (range * 2));
      var min = [range, mapping]
          .reduce((value, element) => (value < element) ? value : element);
      double knobValue = [-range, min]
          .reduce((value, element) => (value > element) ? value : element);
      lastRadien = value;
      widget.onChangedKnobValue(knobValue);
  }

  double _angleFromVector(Offset vector, Offset lastVector) {
    var angle = (math.atan2(vector.dy, vector.dx) -
        math.atan2(lastVector.dy, lastVector.dx));
    return angle > 0 ? angle : angle + (2 * math.pi);
  }

  @override
  Widget build(BuildContext context) {
    print("FROM START KNOB1: ${widget.currentKnobValue}");
    return Center(
      child: Container(
        width: 200,
        height: 200,
        child: LayoutBuilder(builder: (context, constraints) {
          Offset centerOfGestureDetector =
              Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanStart: (details) {
              lastVector = details.localPosition - centerOfGestureDetector;
            },
            onPanUpdate: (details) {
              var vector = details.localPosition - centerOfGestureDetector;

              _angle = (_angle + _angleFromVector(vector, lastVector)) %
                  (2 * math.pi);

              lastVector = vector;
              _updateCurrentValue(_angle, widget.knobValueRange);
              setState(
                () {
                  _angleKnobView = lastVector.direction;
                },
              );
            },
            child: Transform.rotate(
              angle: _angleKnobView,
              child: Image(
                image: AssetImage(ImageConstant.imgDial),
              ),
            ),
          );
        }),
      ),
    );
  }
}
