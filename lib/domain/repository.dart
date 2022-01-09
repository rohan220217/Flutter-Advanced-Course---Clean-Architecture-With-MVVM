import 'package:dartz/dartz.dart';
import 'package:msa_internship/data/network/failure.dart';
import 'package:msa_internship/domain/model.dart';
import 'package:msa_internship/data/request/request.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
