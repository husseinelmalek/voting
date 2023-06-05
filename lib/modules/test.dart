import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TabBar(
        tabs: [
          Tab(
            text: 'first',
            child: Column(
              children: [Text('first')],
            ),
          ),
          Tab(
            text: 'second',
            child: Column(
              children: [Text('second')],
            ),
          ),
        ],
        controller: tabController,
        labelColor: Colors.blue,
      ),
    );
  }
}
