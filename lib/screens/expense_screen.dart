import 'package:expense_tracker/screens/utils/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {


  List<Map<String, dynamic>> expenseList = [
    {'title': 'Health', 'icon': Icons.health_and_safety_outlined, 'color': Color(0xFF77b3a0), 'amount': 20000.0},
    {'title': 'Transportation', 'icon': Icons.directions_bus, 'color': Color(0xFFc3a1ee), 'amount': 15000.0},
    {'title': 'Entertainment', 'icon': Icons.movie_creation_outlined, 'color': Colors.purple, 'amount': 5000.0},
    {'title': 'Bills', 'icon': Icons.featured_play_list_outlined, 'color':Color(0xFFc3a1ee), 'amount': 5000.0},
    {'title': 'Education', 'icon': Icons.school_outlined, 'color':Color(0xFFf49387), 'amount': 20000.0},
    {'title': 'Food', 'icon': Icons.fastfood_outlined, 'color':Color(0xFFffdcf1), 'amount': 20000.0},
    {'title': 'Bills', 'icon': Icons.shopping_cart_outlined, 'color': Color(0xFFffd15e), 'amount': 20000.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                      height: 250,
                      color: Colors.white,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PieChart(PieChartData(
                            centerSpaceRadius: 30,
                            sectionsSpace: 0,
                            sections: [
                              PieChartSectionData(
                                  value: 40,
                                  radius: 80,
                                  color: Color(0xFFc3a1ee),
                                  title: '40%'),
                              PieChartSectionData(
                                  value: 30,
                                  radius: 70,
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
                              PieChartSectionData(
                                  value: 30,
                                  radius: 90,
                                  color: Color(0xFFf4d291),
                                  title: '25%'),
                              PieChartSectionData(
                                  value: 20,
                                  radius: 90,
                                  color: Color(0xFFffdcf1),
                                  title: '10%'),
                              PieChartSectionData(
                                  value: 10,
                                  radius: 80,
                                  color: Color(0xFF77b3a0),
                                  title: '10%'),
                            ],
                          )),
                          Text(
                            '10 \n Expenses ',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      )),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Indicator(
                      color: Color(0xFF77b3a0),
                      text: 'Health',
                      isSquare: false,
                      size: 12,
                      textColor: Colors.black,
                    ),
                    Indicator(
                      color: Color(0xFFc3a1ee),
                      text: 'Bills',
                      isSquare: false,
                      size: 12,
                      textColor: Colors.black,
                    ),
                    Indicator(
                      color: Color(0xFFffd15e),
                      text: 'Shopping',
                      isSquare: false,
                      size: 12,
                      textColor: Colors.black,
                    ),
                    Indicator(
                      color: Color(0xFFffdcf1),
                      text: 'Food',
                      isSquare: false,
                      size: 12,
                      textColor: Colors.black,
                    ),
                    Indicator(
                      color: Color(0xFFE74646),
                      text: 'Other',
                      isSquare: false,
                      size: 12,
                      textColor: Colors.black,
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            thickness: 5,
            color: Colors.grey[300],
          ),
          Expanded(
              child: ListView.separated(
                itemCount: expenseList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    tileColor: Colors.white,
                    leading: CircleAvatar(
                      backgroundColor: expenseList[index]['color'],
                      radius: 15,
                      child: Icon(
                        expenseList[index]['icon'],
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                    title: Text(
                      expenseList[index]['title'],
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Rs: ${expenseList[index]['amount']}'),
                        Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 5),
                            color: Colors.grey,
                            child: Text(
                              '${expenseList[index]['amount']/100000*100} %',
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              )
          )
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
