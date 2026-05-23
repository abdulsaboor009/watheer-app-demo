// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:watheer_demo/utils/appcolors.dart';
// class CustomStepper extends StatefulWidget {
//   final String title1, title2, content;
//   final List steps;
//   const CustomStepper({
//     Key? key,
//     required this.title1,
//     required this.title2,
//     required this.content,
//     required this.steps,
//   }) : super(key: key);

//   @override
//   State<CustomStepper> createState() => _CustomStepperState();
// }

// class _CustomStepperState extends State<CustomStepper> {
//   // ignore: prefer_final_fields
//   int _index = 0;

//   @override
//   Widget build(BuildContext context) {
//     return EnhanceStepper(
//       type: StepperType.vertical,
//       horizontalTitlePosition: HorizontalTitlePosition.bottom,
//       horizontalLinePosition: HorizontalLinePosition.top,
//       currentStep: _index,
//       physics: const ClampingScrollPhysics(),
//       steps: widget.steps
//           .map(
//             (stepItem) => EnhanceStep(
//               icon: _buildStepIcon(),
//               state: _getStepState(widget.steps.indexOf(stepItem)),
//               title: _buildStepContent(stepItem),
//               content: _buildStepContent(stepItem),
//             ),
//           )
//           .toList(),
//       onStepCancel: () {
//         // Disable cancel action
//       },
//       onStepContinue: () {
//         // Disable continue action
//       },
//       onStepTapped: (index) {
//         // Disable tapping action
//       },
//       controlsBuilder: (BuildContext context, ControlsDetails details) {
//         return const SizedBox();
//       },
//     );
//   }

//   Widget _buildStepIcon() {
//     return Transform.scale(
//       scale: 1.4,
//       child: Container(
//         height: 30,
//         width: 30,
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//           color: AppColor.primaryColor,
//         ),
//         child: Center(
//           child: Container(
//             height: 9,
//             width: 9,
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: AppColor.whiteColor,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   StepState _getStepState(int stepIndex) {
//     if (stepIndex == _index) {
//       return StepState.editing; // Current step is editable
//     } else if (stepIndex < _index) {
//       return StepState.complete; // Previous steps are completed
//     } else {
//       return StepState.disabled; // Future steps are disabled
//     }
//   }

//   Widget _buildStepTitle(stepItem) {
//     return Row(
//       children: [
//         TextWidget(
//           color: AppColor.titleColor,
//           text: stepItem.title1,
//           fontSize: AppFontSize.extremeSmallTitle,
//           fontWeight: Appfontweight.normal.font,
//         ),
//         18.width,
//         TextWidget(
//           color: AppColor.titleColor,
//           text: stepItem.title2,
//           fontSize: AppFontSize.extremeSmallTitle,
//           fontWeight: Appfontweight.bold.font,
//         ),
//       ],
//     );
//   }

//   Widget _buildStepContent(stepItem) {
//     return Container(
//       width: double.infinity,
//       margin: EdgeInsets.only(left: ResponsiveSize.w * 22),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           TextWidget(
//             color: AppColor.titleColor,
//             textAlign: TextAlign.start,
//             text: stepItem.content,
//             fontSize: AppFontSize.extremeSmallTitle,
//             fontWeight: Appfontweight.normal.font,
//           ),
//         ],
//       ),
//     );
//   }
// }
class CustomStepper extends StatelessWidget {
  const CustomStepper({
    Key? key,
    required this.children,
    this.indicators,
    this.isLeftAligned = true,
    this.itemGap = 12.0,
    this.gutterSpacing = 10.0,
    this.padding = const EdgeInsets.all(8),
    this.controller,
    this.lineColor = AppColor.primaryColor,
    this.physics,
    this.shrinkWrap = true,
    this.primary = false,
    this.reverse = false,
    this.indicatorSize = 30.0,
    this.lineGap = 0.0,
    this.indicatorColor = Colors.blue,
    this.indicatorStyle = PaintingStyle.fill,
    this.strokeCap = StrokeCap.butt,
    this.strokeWidth = 1.5,
    this.style = PaintingStyle.stroke,
  }) : itemCount = children.length,
       assert(itemGap >= 0),
       assert(lineGap >= 0),
       assert(indicators == null || children.length == indicators.length),
       super(key: key);

  final List<Widget> children;
  final double itemGap;
  final double gutterSpacing;
  final List<Widget>? indicators;
  final bool isLeftAligned;
  final EdgeInsets padding;
  final ScrollController? controller;
  final int itemCount;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool primary;
  final bool reverse;

  final Color lineColor;
  final double lineGap;
  final double indicatorSize;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      separatorBuilder: (_, __) => SizedBox(height: itemGap),
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      controller: controller,
      reverse: reverse,
      primary: primary,
      itemBuilder: (context, index) {
        final child = children[index];
        final _indicators = indicators;

        Widget? indicator;
        if (_indicators != null) {
          indicator = _indicators[index];
        }

        final isFirst = index == 0;
        final isLast = index == itemCount - 1;

        final timelineTile = <Widget>[
          CustomPaint(
            foregroundPainter: _TimelinePainter(
              hideDefaultIndicator: indicator != null,
              lineColor: lineColor,
              indicatorColor: indicatorColor,
              indicatorSize: indicatorSize,
              indicatorStyle: indicatorStyle,
              isFirst: isFirst,
              isLast: isLast,
              lineGap: lineGap,
              strokeCap: strokeCap,
              strokeWidth: strokeWidth,
              style: style,
              itemGap: itemGap,
            ),
            child: SizedBox(
              height: double.infinity,
              width: indicatorSize,
              child: indicator,
            ),
          ),
          SizedBox(width: gutterSpacing),
          Expanded(child: child),
        ];

        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: isLeftAligned
                ? timelineTile
                : timelineTile.reversed.toList(),
          ),
        );
      },
    );
  }
}

class _TimelinePainter extends CustomPainter {
  _TimelinePainter({
    required this.hideDefaultIndicator,
    required this.indicatorColor,
    required this.indicatorStyle,
    required this.indicatorSize,
    required this.lineGap,
    required this.strokeCap,
    required this.strokeWidth,
    required this.style,
    required this.lineColor,
    required this.isFirst,
    required this.isLast,
    required this.itemGap,
  }) : linePaint = Paint()
         ..color = lineColor
         ..strokeCap = strokeCap
         ..strokeWidth = strokeWidth
         ..style = style,
       circlePaint = Paint()
         ..color = indicatorColor
         ..style = indicatorStyle;

  final bool hideDefaultIndicator;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final double indicatorSize;
  final double lineGap;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final Color lineColor;
  final Paint linePaint;
  final Paint circlePaint;
  final bool isFirst;
  final bool isLast;
  final double itemGap;

  @override
  void paint(Canvas canvas, Size size) {
    final indicatorRadius = indicatorSize / 2;
    final halfItemGap = itemGap / 2;
    final indicatorMargin = indicatorRadius + lineGap;

    final top = size.topLeft(Offset(indicatorRadius, 0.0 - halfItemGap));
    final centerTop = size.centerLeft(
      Offset(indicatorRadius, -indicatorMargin),
    );

    final bottom = size.bottomLeft(Offset(indicatorRadius, 0.0 + halfItemGap));
    final centerBottom = size.centerLeft(
      Offset(indicatorRadius, indicatorMargin),
    );

    if (!isFirst) canvas.drawLine(top, centerTop, linePaint);
    if (!isLast) canvas.drawLine(centerBottom, bottom, linePaint);

    if (!hideDefaultIndicator) {
      final Offset offsetCenter = size.centerLeft(Offset(indicatorRadius, 0));

      canvas.drawCircle(offsetCenter, indicatorRadius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
