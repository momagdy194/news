import 'package:financy/screen/Authantication/regiester.dart';
import 'package:financy/screen/Authantication/security_quetion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ContinueOfRegister.dart';

class TabsView extends StatefulWidget {
  static String  id='TabsView';
  @override
  _TabsViewState createState() => _TabsViewState();
}


class _TabsViewState extends State<TabsView>with SingleTickerProviderStateMixin {
  int _tabIndex = 0;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  void _toggleTab() {
    _tabIndex = _tabController.index + 1;
    _tabController.animateTo(_tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold
        (
        body: RegisterPage()
        ),
    );
  }

}
