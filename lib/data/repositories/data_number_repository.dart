import 'package:clean_template/domain/repositories/number_repository.dart';
import 'package:clean_template/domain/usecases/increment_number_usecase.dart';
import 'package:clean_template/domain/usecases/decrement_number_usecase.dart';

class DataNumberRepository extends NumberRepository {
  int currentValue;

  DataNumberRepository._internal() {
    currentValue = 0;
  }

  static DataNumberRepository _instance = DataNumberRepository._internal();
  factory DataNumberRepository() => _instance;

  @override
  IncrementNumberUseCaseResponse incrementNumber(int value)  {
    if(currentValue == 10) {
      throw "Number must be between 0 and 10.";
    }
    currentValue+=value;
    return IncrementNumberUseCaseResponse(currentValue);
  }

  @override
  DecrementNumberUseCaseResponse decrementNumber(int value) {
    if(currentValue == 0) {
      throw "Number must be between 0 and 10.";
    }
    currentValue-=value;
    return DecrementNumberUseCaseResponse(currentValue);
  }
}