import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:clean_template/app/pages/home/home_presenter.dart';
import 'package:clean_template/domain/repositories/number_repository.dart';

class HomeController extends Controller {
  final HomePresenter presenter;
  int value = 0;

  HomeController(NumberRepository numberRepository):
      presenter = HomePresenter(numberRepository) {
    initListeners();
  }

  void initListeners() {
    // Increment Listeners
    presenter.incrementNumberOnComplete = () {
     //TODO: implement onComplete
    };
    presenter.incrementNumberOnError = (error) {
      _showSnackBar(error);
    };
    presenter.incrementNumberOnNext = (currentValue) {
      value = currentValue;
    };

    // Decrement Listeners
    presenter.decrementNumberOnComplete = () {
      //TODO: implement onComplete
    };
    presenter.decrementNumberOnError = (error) {
     _showSnackBar(error);
    };
    presenter.decrementNumberOnNext = (currentValue) {
      value = currentValue;
    };
  }

  void incrementNumber(number) => this.presenter.incrementNumber(number['value']);
  void decrementNumber(number) => this.presenter.decrementNumber(number['value']);

  void _showSnackBar(message) {
//    print(message);
      BuildContext scaffoldContext = getContext();
      showDialog(
          context: scaffoldContext,
          barrierDismissible: false,
          builder: (BuildContext context){
        return AlertDialog(
          title: new Text("Error!"),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              color:Colors.red,
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

          ],
        );
      });

  }

  @override
  void dispose() {
    presenter.dispose();
    super.dispose();
  }
}