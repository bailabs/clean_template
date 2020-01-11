import 'package:clean_template/data/repositories/data_number_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'home_controller.dart';
import 'widgets/number_display.dart';

class HomeView extends View {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState() : super(HomeController(DataNumberRepository()));

  @override
  Widget buildPage() => Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: NumberDisplay(currentValue: controller.value),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 31),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                onPressed: () => controller.decrementNumber({"value": 1}),
                child: Icon(Icons.remove),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () => controller.incrementNumber({"value": 1}),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ));
}
