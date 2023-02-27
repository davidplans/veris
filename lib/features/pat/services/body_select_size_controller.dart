import 'dart:ui';

class BodySelectSizeController {
  static BodySelectSizeController? _instance;

  static BodySelectSizeController get instance {
    _instance ??= BodySelectSizeController._init();
    return _instance!;
  }

  BodySelectSizeController._init();

  final BodyArea _bodyArea = BodyArea();
  Size bodySize = Size.zero;

  void addBounds(Rect bound) {
    if (_bodyArea.anyEmpty) {
      _bodyArea
        ..minX = bound.left
        ..maxX = bound.right
        ..minY = bound.top
        ..maxY = bound.bottom;
    } else {
      if (bound.left < _bodyArea.minX!) _bodyArea.minX = bound.left;
      if (bound.right > _bodyArea.maxX!) _bodyArea.maxX = bound.right;
      if (bound.top < _bodyArea.minY!) _bodyArea.minY = bound.top;
      if (bound.bottom > _bodyArea.maxY!) _bodyArea.maxY = bound.bottom;
    }
    calculateArea();
  }

  void calculateArea() {
    if (_bodyArea.anyEmpty) bodySize = Size.zero;

    double width = _bodyArea.maxX! - _bodyArea.minX!;
    double height = _bodyArea.maxY! - _bodyArea.minY!;

    bodySize = Size(width, height);
  }

  double calculateScale(Size? containerSize) {
    if (containerSize == null)
      return 1.0;

    // Aspect Ratio
    double newWidth = containerSize.width, newHeight = containerSize.height;
    if (containerSize.width > containerSize.height) {
      newHeight = 1 /(bodySize.aspectRatio / containerSize.width);
    }
    else {
      newHeight = containerSize.width / bodySize.aspectRatio;
    }
    containerSize = Size(newWidth, newHeight);

    // Scale for Responsive UI
    double scale1 = containerSize.width / bodySize.width;
    double scale2 = containerSize.height / bodySize.height;
    double bodyScale = scale1 > scale2 ? scale1 : scale2;

    return bodyScale;
  }
  
  double inverseOfScale(double scale) => 1.0/scale;
}

  class BodyArea {
    double? minX;
    double? maxX;
    double? minY;
    double? maxY;

    BodyArea({this.minX, this.maxX, this.minY, this.maxY});

    bool get anyEmpty {
        return minX == null || minY == null || maxX == null || maxY == null;
    }

  }
