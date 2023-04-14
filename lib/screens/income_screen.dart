import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'bottom_nav_bar.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {

  List<Map<String, dynamic>> incomeList = [
    {'incomeStream': 'Salary', 'color': Color(0xFF7bc8f8), 'amount': 50000},
    {'incomeStream': 'Teaching', 'color': Color(0xFFc3a1ee), 'amount': 30000},
    {
      'incomeStream': 'Investments',
      'color': Color(0xFFffd15e),
      'amount': 40000
    },
    {'incomeStream': 'Freelance', 'color': Color(0xFFf49387), 'amount': 50000},
    {'incomeStream': 'Rents', 'color': Color(0xFFDDFFBB), 'amount': 40000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 250,
                color: Colors.white,
                child: PieChart(PieChartData(
                  centerSpaceRadius: 0,
                  centerSpaceColor: Colors.white,
                  sectionsSpace: 0,
                  sections: [
                    PieChartSectionData(
                        value: 40,
                        radius: 110,
                        color: Color(0xFFc3a1ee),
                        title: '40%'),
                    PieChartSectionData(
                        value: 30,
                        radius: 100,
                        color: Color(0xFF7bc8f8),
                        title: '25%'),
                    PieChartSectionData(
                        value: 20,
                        radius: 90,
                        color: Color(0xFFffd15e),
                        title: '10%'),
                    PieChartSectionData(
                        value: 20,
                        radius: 100,
                        color: Color(0xFFf49387),
                        title: '10%'),
                  ],
                )),
              ),
              Container(
                width: double.infinity,
                height: 2, // Thickness
                color: Colors.grey.shade200,
              ),
            ],
          ),
          Expanded(
              child: ListView.separated(
            itemCount: incomeList.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30),
                tileColor: Colors.white,
                leading: Icon(
                  Icons.circle_rounded,
                  color: incomeList[index]['color'],
                ),
                title: Text(
                  incomeList[index]['incomeStream'],
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: Text('Rs: ${incomeList[index]['amount']}'),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavBAr(),
    );
  }
}
