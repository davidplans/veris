import 'package:Veris/features/pat/models/body.dart';
import 'package:Veris/features/home/view/home_page.dart';
import 'package:Veris/features/pat/view/confidence_slider_page.dart';
import 'package:Veris/utils/parser.dart';
import 'package:Veris/utils/size_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/widgets/app_bar_widget.dart';

class BodySelectPage extends StatefulWidget {
  const BodySelectPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const BodySelectPage());
  }

  @override
  State<BodySelectPage> createState() => _BodySelectPageState();
}

class _BodySelectPageState extends State<BodySelectPage> {
  Body? selectedBody;
  final GlobalKey<BodyPickerState> _bodyKey = GlobalKey();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  _setSelect() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedBody', (selectedBody?.title).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Selected : ${selectedBody?.title ?? ''}"),
      backgroundColor: const Color(0xFF2A2A2A),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: const Color(0xFF2A2A2A),
              child: InteractiveViewer(
                scaleEnabled: true,
                panEnabled: true,
                constrained: true,
                child: BodyPicker(
                  key: _bodyKey,
                  width: double.infinity,
                  height: double.infinity,
                  body: "body.svg",
                  onChanged: (body) {
                    setState(() {
                      selectedBody = body;
                    });
                  },
                  actAsToggle: true,
                  selectedColor: Colors.lightBlueAccent,
                  strokeColor: Colors.white24,
                ),
              ),
            ),
            Positioned(
              bottom: 25,
              child: ElevatedButton(
                onPressed: selectedBody?.title != null
                    ? () {
                        _setSelect();
                        Navigator.of(context).push<void>(
                          ConfidenceSliderPage.route(),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BodyPicker extends StatefulWidget {
  final double? width;
  final double? height;
  final String body;
  final Function(Body? city) onChanged;
  final Color? strokeColor;
  final Color? selectedColor;

  final bool? actAsToggle;

  const BodyPicker(
      {Key? key,
      required this.body,
      required this.onChanged,
      this.width,
      this.height,
      this.strokeColor,
      this.selectedColor,
      this.actAsToggle})
      : super(key: key);

  @override
  BodyPickerState createState() => BodyPickerState();
}

class BodyPickerState extends State<BodyPicker> {
  final List<Body> _bodyList = [];
  Body? selectedBody;

  final _sizeController = SizeController.instance;
  Size? bodySize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadCityList();
    });
  }

  _loadCityList() async {
    final list = await Parser.instance.svgToCityList(widget.body);
    _bodyList.clear();
    setState(() {
      _bodyList.addAll(list);
      bodySize = _sizeController.bodySize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var body in _bodyList) _buildStackItem(body),
      ],
    );
  }

  Widget _buildStackItem(Body body) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () => (widget.actAsToggle ?? false)
          ? _toggleButton(body)
          : _useButton(body),
      child: CustomPaint(
        isComplex: true,
        foregroundPainter: BodyPainter(
            body: body,
            selectedBody: selectedBody,
            selectedColor: widget.selectedColor,
            strokeColor: widget.strokeColor),
        child: Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? double.infinity,
          constraints: const BoxConstraints(maxWidth: 350, maxHeight: 600),
          alignment: Alignment.center,
        ),
      ),
    );
  }

  void _toggleButton(Body body) {
    setState(() {
      if (selectedBody == body)
        selectedBody = null;
      else {
        selectedBody = body;
      }
      widget.onChanged.call(selectedBody);
    });
  }

  void _useButton(Body body) {
    setState(() {
      selectedBody = body;
      widget.onChanged.call(selectedBody);
    });
  }
}

class BodyPainter extends CustomPainter {
  final Body body;
  final Body? selectedBody;
  final Color? strokeColor;
  final Color? selectedColor;

  final sizeController = SizeController.instance;

  double _scale = 1.0;

  BodyPainter(
      {required this.body,
      required this.selectedBody,
      this.selectedColor,
      this.strokeColor});

  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint()
      ..color = strokeColor ?? Colors.white60
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final selectedPen = Paint()
      ..color = selectedColor ?? Colors.blue
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;

    _scale = sizeController.calculateScale(size);
    canvas.scale(_scale);

    if (body.id == selectedBody?.id) {
      canvas.drawPath(body.path, selectedPen);
    }

    canvas.drawPath(body.path, pen);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool hitTest(Offset position) {
    double inverseScale = sizeController.inverseOfScale(_scale);
    return body.path.contains(position.scale(inverseScale, inverseScale));
  }
}
