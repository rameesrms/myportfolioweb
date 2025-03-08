import 'package:flutter/material.dart';

import '../theme/text_styles.dart';

class FlutterSalesGraph extends StatefulWidget {
  final List<double> salesData;
  final List<String> labels;
  final double maxBarHeight;
  final double barWidth;
  final List<Color> colors;
  final double dateLineHeight;

  const FlutterSalesGraph({
    super.key,
    required this.salesData,
    required this.labels,
    this.maxBarHeight = 200.0,
    this.barWidth = 24.0,
    this.colors = const [
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.cyan,
      Colors.amber,
      Colors.indigo,
      Colors.lime,
      Colors.deepOrange,
      Colors.pink,
    ],
    this.dateLineHeight = 20.0,
  });

  @override
  _FlutterSalesGraphState createState() => _FlutterSalesGraphState();
}

class _FlutterSalesGraphState extends State<FlutterSalesGraph> {
  int? _pressedIndex;

  @override
  Widget build(BuildContext context) {
    if (widget.salesData.isEmpty ||
        widget.labels.isEmpty ||
        widget.salesData.length != widget.labels.length) {
      return Center(child: Text('No data available or labels mismatch.'));
    }

    final double maxSales = widget.salesData.reduce((a, b) => a > b ? a : b);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: double.infinity,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(widget.salesData.length, (index) {
                      final sales = widget.salesData[index];
                      final label = widget.labels[index];
                      final barHeight = maxSales > 0
                          ? (sales / maxSales) * widget.maxBarHeight
                          : 2.0;
                      final color = widget.colors[index % widget.colors.length];

                      return GestureDetector(
                        onTap: () async{
                          setState(() {
                            _pressedIndex = index;
                          });

                          await Future.delayed(Duration(seconds: 1));
                          setState(() {
                            _pressedIndex = null;
                          });
                        },
                        onLongPressEnd: (_) {
                          setState(() {
                            _pressedIndex = null;
                          });
                        },
                        child: Container(
                          width: widget.barWidth,
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                width: widget.barWidth,
                                height: barHeight.toDouble(),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,end: Alignment.bottomCenter,
                                      colors: [clrED1C24.withOpacity(0.38),clrED1C24.withOpacity(0.94),]),
                                  color: color,
                                  borderRadius: BorderRadius.circular(4.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                              ),
                              if (_pressedIndex == index)
                                Positioned(
                                  bottom: barHeight + 10, // Adjust as needed
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4.0),
                                    color: Colors.black26,
                                    child: Text(
                                      '₹${sales.toStringAsFixed(1)}',
                                      style: t500_16.copyWith(color: clrF8F8F8),
                                    ),
                                  ),
                                ),
                              Positioned(
                                bottom: -20,
                                child: Container(
                                  width: widget.barWidth,
                                  height: widget.dateLineHeight,
                                  alignment: Alignment.center,
                                  child: Text(
                                    label,
                                    textAlign: TextAlign.center,
                                    style: t400_10.copyWith(color: clr6B6B6B,letterSpacing: 0)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
