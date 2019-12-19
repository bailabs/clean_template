import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:clean_template/domain/usecases/increment_number_usecase.dart';

class HomePresenter extends Presenter {
  final IncrementNumberUseCase incrementNumberUseCase;

  Function incrementNumberOnComplete;
  Function incrementNumberOnError;
  Function incrementNumberOnNext;

  HomePresenter(numberRepo):
    incrementNumberUseCase = IncrementNumberUseCase(numberRepo)
  ;

  void incrementNumber(int value) {
    incrementNumberUseCase.execute(_IncrementNumberObserver(this), IncrementNumberUseCaseParams(value));
  }

  @override
  void dispose() {
    incrementNumberUseCase.dispose();
  }
}

class _IncrementNumberObserver implements Observer<int> {
  final HomePresenter presenter;
  _IncrementNumberObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.incrementNumberOnComplete != null);
    presenter.incrementNumberOnComplete();
  }

  @override
  void onError(e) {
    assert(presenter.incrementNumberOnError != null);
    presenter.incrementNumberOnError(e);
  }

  @override
  void onNext(int response) {
    assert(presenter.incrementNumberOnComplete != null);
    presenter.incrementNumberOnNext(response);
  }
}