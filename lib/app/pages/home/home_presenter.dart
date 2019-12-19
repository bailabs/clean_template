import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:clean_template/domain/usecases/increment_number_usecase.dart';
import 'package:clean_template/domain/usecases/decrement_number_usecase.dart';

class HomePresenter extends Presenter {
  final IncrementNumberUseCase incrementNumberUseCase;
  final DecrementNumberUseCase decrementNumberUseCase;

  Function incrementNumberOnComplete;
  Function incrementNumberOnError;
  Function incrementNumberOnNext;

  Function decrementNumberOnComplete;
  Function decrementNumberOnError;
  Function decrementNumberOnNext;

  HomePresenter(numberRepo):
    incrementNumberUseCase = IncrementNumberUseCase(numberRepo),
    decrementNumberUseCase = DecrementNumberUseCase(numberRepo)
  ;

  void incrementNumber(int value) {
    incrementNumberUseCase.execute(_IncrementNumberObserver(this), IncrementNumberUseCaseParams(value));
  }

  void decrementNumber(int value) {
    decrementNumberUseCase.execute(_DecrementNumberObserver(this), DecrementNumberUseCaseParams(value));
  }

  @override
  void dispose() {
    incrementNumberUseCase.dispose();
    decrementNumberUseCase.dispose();
  }
}

class _IncrementNumberObserver implements Observer<int> {
  final HomePresenter presenter;
  _IncrementNumberObserver(this.presenter);

  @override
  void onComplete() {
    // TODO: implement onComplete
  }

  @override
  void onError(error) {
    assert(presenter.incrementNumberOnError != null);
    presenter.incrementNumberOnError(error);
  }

  @override
  void onNext(int response) {
    assert(presenter.incrementNumberOnComplete != null);
    presenter.incrementNumberOnNext(response);
  }
}

class _DecrementNumberObserver implements Observer<int> {
  final HomePresenter presenter;
  _DecrementNumberObserver(this.presenter);

  @override
  void onComplete() {
    // TODO: implement onComplete
  }

  @override
  void onError(error) {
    assert(presenter.incrementNumberOnError != null);
    presenter.incrementNumberOnError(error);
  }

  @override
  void onNext(int response) {
    assert(presenter.incrementNumberOnComplete != null);
    presenter.incrementNumberOnNext(response);
  }

}