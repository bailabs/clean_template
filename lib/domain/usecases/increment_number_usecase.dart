import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:rxdart/rxdart.dart';
import '../repositories/number_repository.dart';

class IncrementNumberUseCase extends UseCase<int, IncrementNumberUseCaseParams> {
  final NumberRepository numberRepository;
  IncrementNumberUseCase(this.numberRepository);

  @override
  Future<Observable<int>> buildUseCaseObservable(IncrementNumberUseCaseParams params) async {
    final StreamController<int> controller = StreamController();
    try {
      controller.add(await numberRepository.incrementNumber(params.value));
    } catch(err) {
      controller.addError(err);
    }
    controller.close();
    return Observable(controller.stream);
  }
}

class IncrementNumberUseCaseParams {
  final int value;
  IncrementNumberUseCaseParams(this.value);
}