import 'package:clean_template/domain/repositories/number_repository.dart';

class DataNumberRepository extends NumberRepository {
  int currentValue;

  DataNumberRepository._internal() {
    currentValue = 0;
  }

  static DataNumberRepository _instance = DataNumberRepository._internal();
  factory DataNumberRepository() => _instance;

  @override
  int incrementNumber(int value)  {
    currentValue+=value;
    return currentValue;
  }
}