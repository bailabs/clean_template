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
    presenter.incrementNumberOnComplete = () {
     //TODO: implement onComplete
    };

    presenter.incrementNumberOnError = (e) {
      //TODO: implement onError
    };

    presenter.incrementNumberOnNext = (currentValue) {
      value = currentValue;
    };
  }

  void incrementNumber(number) => this.presenter.incrementNumber(number['value']);

  @override
  void dispose() {
    presenter.dispose();
    super.dispose();
  }
}