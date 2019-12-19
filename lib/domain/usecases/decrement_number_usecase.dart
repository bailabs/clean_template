import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:rxdart/rxdart.dart';
import '../repositories/number_repository.dart';

class DecrementNumberUseCase extends UseCase<int, DecrementNumberUseCaseParams> {
  final NumberRepository numberRepository;
  DecrementNumberUseCase(this.numberRepository);

  @override
  Future<Observable<int>> buildUseCaseObservable(DecrementNumberUseCaseParams params) async {
    final StreamController<int> controller = StreamController();
    int currentValue = numberRepository.getNumber();

    if(currentValue == 0) {
      controller.addError("Number must be between 0 and 10.");
    } else {
      await numberRepository.setNumber(currentValue-= params.value);
      controller.add(await numberRepository.getNumber());
    }

    controller.close();
    return Observable(controller.stream);
  }
}

class DecrementNumberUseCaseParams {
  final int value;
  DecrementNumberUseCaseParams(this.value);
}
