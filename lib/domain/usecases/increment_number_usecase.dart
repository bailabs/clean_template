import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../repositories/number_repository.dart';

class IncrementNumberUseCase
    extends UseCase<int, IncrementNumberUseCaseParams> {
  final NumberRepository numberRepository;
  IncrementNumberUseCase(this.numberRepository);

  @override
  Future<Stream<int>> buildUseCaseStream(
      IncrementNumberUseCaseParams params) async {
    final StreamController<int> controller = StreamController();
    int currentValue = numberRepository.getNumber();

    if (currentValue == 10) {
      controller.addError("Number must be between 0 and 10.");
    } else {
      await numberRepository.setNumber(currentValue += params.value);
      controller.add(await numberRepository.getNumber());
    }

    controller.close();
    return controller.stream;
  }
}

class IncrementNumberUseCaseParams {
  final int value;
  IncrementNumberUseCaseParams(this.value);
}
