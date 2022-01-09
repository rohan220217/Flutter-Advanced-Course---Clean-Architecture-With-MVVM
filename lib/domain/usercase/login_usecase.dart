import 'package:dartz/dartz.dart';
import 'package:msa_internship/data/network/failure.dart';
import 'package:msa_internship/data/request/request.dart';
import 'package:msa_internship/domain/model/model.dart';
import 'package:msa_internship/domain/repository/repository.dart';
import 'package:msa_internship/domain/usercase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(
      LoginRequest(input.email, input.password, "imei", "deviceType"),
    );
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
