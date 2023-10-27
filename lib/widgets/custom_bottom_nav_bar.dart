import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:togetherv2/const/constant.dart';
import 'package:togetherv2/flutter_flow/flutter_flow_theme.dart';
import 'package:togetherv2/screens/plantingGuide/planting_guide_screen.dart';

import '../screens/pollutionReport/pollution_report_screen.dart';
class CustomNavBar extends StatefulWidget {
  final int selectedIndex;

  const CustomNavBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _currentIndex = 0;
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
    final user = FirebaseAuth.instance.currentUser!;
    screens = [
      plantingGuideScreen(),
      pollutionReport(),
    ];
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: FlutterFlowTheme.of(context).bodyMedium,
        backgroundColor: const Color(0xffE7F6F2),
        selectedItemColor: kPrimaryColor,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_florist_outlined,
              size: 35,
              color: Color.fromRGBO(48, 64, 34, 100),
            ),
            label: 'Planting Guide',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.report,
              size: 35,
              color: Color.fromRGBO(48, 64, 34, 100),
            ),
            label: 'Report',
          ),
        ],
      ),
    );
  }
}