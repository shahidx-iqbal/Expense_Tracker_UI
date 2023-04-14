import 'package:flutter/material.dart';
import 'expense_screen.dart';
import 'income_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with TickerProviderStateMixin  {

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Row(
              children: [
                Icon(Icons.arrow_back_ios_new_outlined,size: 15,),
                Text(' Jan- 2023',style: TextStyle(
                  fontSize: 18,
                ),),
                Icon(Icons.arrow_forward_ios_rounded,size: 15,)
              ],
            ), Icon(Icons.manage_search,size: 25,)],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:5),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                    indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    color: Colors.white,
                  ),
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Income',
                    ),

                    // second tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Expenses',
                    ),
                  ],
                ),
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                IncomeScreen(),
                  ExpenseScreen()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
