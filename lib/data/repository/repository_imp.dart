import 'package:dartz/dartz.dart';
import 'package:msa_internship/data/data_source/remote_data_source.dart';
import 'package:msa_internship/data/mapper/mapper.dart';
import 'package:msa_internship/data/network/failure.dart';
import 'package:msa_internship/data/network/network_info.dart';
import 'package:msa_internship/data/request/request.dart';
import 'package:msa_internship/domain/model.dart';
import 'package:msa_internship/domain/repository.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its safe to call the API
      final response = await _remoteDataSource.login(loginRequest);

      if (response.status == 0) // success
      {
        // return data (success)
        // return right
        return Right(response.toDomain());
      } else {
        // return biz logic error
        // return left
        return Left(Failure(
            409, response.message ?? "we have biz error logic from API side"));
      }
    } else {
      // return connection error
      return Left(Failure(501, "please check your internet connection"));
    }
  }
}
