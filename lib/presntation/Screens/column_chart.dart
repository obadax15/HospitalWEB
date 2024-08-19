import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/patient_cubit/patient_cubit.dart';
import 'package:hospital/constances/mycolor.dart';

class ColumnChart extends StatefulWidget {
  const ColumnChart({super.key});

  @override
  State<ColumnChart> createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<PatientCubit>(context).statistics();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PatientCubit, PatientState>(
        builder: (context, state) {
          if (state.patientStatus == PatientStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyColor.mykhli,
              ),
            );
          }

          if (BlocProvider.of<PatientCubit>(context).patientS == null || BlocProvider.of<PatientCubit>(context).patientS.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          }

          List sc = BlocProvider.of<PatientCubit>(context).patientS;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 50,
                barTouchData: BarTouchData(enabled: true),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 10,
                      getTitlesWidget: (value, meta) {
                        return Text(value.toInt().toString());
                      },
                      reservedSize: 28,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < sc.length) {
                          return Text(
                            sc[index]['month_name'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();  // Handle out-of-range indices
                        }
                      },
                      interval: 1,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                barGroups: sc.asMap().entries.map((entry) {
                  int index = entry.key;
                  var value = entry.value;
                  return BarChartGroupData(
                    x: index,  // Use the index as the x value
                    barRods: [
                      BarChartRodData(
                        toY: value['count'].toDouble(),
                        color: Colors.blue,
                        width: 16,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
