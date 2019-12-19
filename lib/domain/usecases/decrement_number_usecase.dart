import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:rxdart/rxdart.dart';
import '../repositories/number_repository.dart';

class DecrementNumberUseCase extends UseCase<DecrementNumberUseCaseResponse, DecrementNumberUseCaseParams> {
  final NumberRepository numberRepository;
  DecrementNumberUseCase(this.numberRepository);

  @override
  Future<Observable<DecrementNumberUseCaseResponse>> buildUseCaseObservable(DecrementNumberUseCaseParams params) async {
    final StreamController<DecrementNumberUseCaseResponse> controller = StreamController();
    try {
      controller.add(await numberRepository.decrementNumber(params.value));
    } catch(err) {
      controller.addError(err);
    }
    controller.close();
    return Observable(controller.stream);
  }
}
class DecrementNumberUseCaseResponse {
  final int value;
  DecrementNumberUseCaseResponse(this.value);
}

class DecrementNumberUseCaseParams {
  final int value;
  DecrementNumberUseCaseParams(this.value);
}
