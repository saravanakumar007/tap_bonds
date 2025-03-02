import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tap_bonds/business_logic/company_financials/company_financials_state.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tap_bonds/data/models/company_detail_model/company_detail_model.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({
    super.key,
    required this.financialChartType,
    required this.companyDetailModel,
  });

  final CompanyDetailModel companyDetailModel;

  final FinancialChartType financialChartType;

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  int yMaximumVal = 0;
  ChartSeriesController? seriesController;

  List<Financial> financialChartData = [];

  @override
  void initState() {
    super.initState();
    financialChartData =
        widget.financialChartType == FinancialChartType.ebitda
            ? widget.companyDetailModel.ebitda
            : widget.companyDetailModel.revenue;
  }

  @override
  Widget build(BuildContext context) {
    for (var element in financialChartData) {
      yMaximumVal = max(yMaximumVal, element.value);
    }
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      margin: EdgeInsets.all(0),
      primaryXAxis: CategoryAxis(
        interval: 1,
        majorTickLines: MajorTickLines(size: 0),
        majorGridLines: MajorGridLines(width: 0),
        axisLabelFormatter: (axisLabelRenderArgs) {
          return ChartAxisLabel(
            axisLabelRenderArgs.text[0],
            axisLabelRenderArgs.textStyle,
          );
        },
      ),
      primaryYAxis: NumericAxis(
        maximum: (yMaximumVal + yMaximumVal).toDouble(),
        axisLine: AxisLine(width: 0),

        axisLabelFormatter: (axisLabelRenderArgs) {
          return ChartAxisLabel(
            axisLabelRenderArgs.value == 0
                ? ''
                : NumberFormat.compactCurrency(
                  name: "INR",
                  locale: 'en_IN',
                  decimalDigits: 0,
                  symbol: '₹',
                ).format(axisLabelRenderArgs.value),
            axisLabelRenderArgs.textStyle,
          );
        },

        majorGridLines: MajorGridLines(
          width: 0.5,
          color: Color.fromRGBO(163, 163, 163, 1),
        ),
        majorTickLines: MajorTickLines(size: 0),
      ),
      annotations: [
        CartesianChartAnnotation(
          region: AnnotationRegion.plotArea,
          widget: Text(
            '2024',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(163, 163, 163, 1),
            ),
          ),
          x: 2,
          y: yMaximumVal + yMaximumVal / 1.4,
          coordinateUnit: CoordinateUnit.point,
        ),
        CartesianChartAnnotation(
          region: AnnotationRegion.plotArea,
          widget: Text(
            '2025',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(163, 163, 163, 1),
            ),
          ),
          x: 4,
          y: yMaximumVal + yMaximumVal / 1.4,
          coordinateUnit: CoordinateUnit.point,
        ),
        CartesianChartAnnotation(
          region: AnnotationRegion.plotArea,
          widget: CustomPaint(
            size: Size(1, 500),
            painter: DashedLineVerticalPainter(),
          ),
          x: 'Apr',
          y: yMaximumVal + yMaximumVal,
          coordinateUnit: CoordinateUnit.point,
        ),
      ],

      series: _buildColumnSeries(),
    );
  }

  /// Returns the list of Cartesian Column series.
  List<StackedColumnSeries<Financial, String>> _buildColumnSeries() {
    return <StackedColumnSeries<Financial, String>>[
      StackedColumnSeries<Financial, String>(
        dataSource: financialChartData,
        xValueMapper: (Financial financial, int index) => financial.month,
        yValueMapper: (Financial financial, int index) => financial.value,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
        name: 'Series 1',

        onRendererCreated: (ChartSeriesController controller) {
          seriesController = controller;
        },
        color:
            widget.financialChartType == FinancialChartType.ebitda
                ? const Color.fromRGBO(16, 24, 40, 1)
                : Color.fromRGBO(21, 93, 252, 1),
      ),

      if (widget.financialChartType == FinancialChartType.ebitda)
        StackedColumnSeries<Financial, String>(
          dataSource: financialChartData,
          xValueMapper: (Financial financial, int index) => financial.month,
          yValueMapper:
              (Financial financial, int index) =>
                  (yMaximumVal + yMaximumVal / 2) - financial.value,

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
          name: 'Series 2',
          color: const Color.fromRGBO(21, 93, 252, 0.2),
        ),
    ];
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 12, dashSpace = 10, startY = 50;
    final paint =
        Paint()
          ..color = Color.fromRGBO(163, 163, 163, 1)
          ..strokeWidth = 2;
    while (startY < 500) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
