import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:clean_template/data/repositories/data_number_repository.dart';
import 'home_controller.dart';

import 'widgets/number_display.dart';

class HomeView extends View {
  @override
  _HomeViewState createState() => _HomeViewState(HomeController(DataNumberRepository()));
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState(HomeController controller) : super(controller);

  @override
  Widget build(BuildContext context) => Scaffold(
    key: globalKey,
    appBar: AppBar(
      title: Text('Flutter Demo Home Page'),
    ),
    body:NumberDisplay(currentValue: controller.value),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left:31),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                onPressed: () => callHandler(controller.decrementNumber, params: {"value":1}),
                child: Icon(Icons.remove),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () => callHandler(controller.incrementNumber, params: {"value":1}),
              child: Icon(Icons.add),
            ),
          ),
        ],
      )
  );
}
