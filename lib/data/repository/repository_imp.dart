import 'package:dartz/dartz.dart';
import 'package:msa_internship/data/data_source/remote_data_source.dart';
import 'package:msa_internship/data/mapper/mapper.dart';
import 'package:msa_internship/data/network/error_handler.dart';
import 'package:msa_internship/data/network/failure.dart';
import 'package:msa_internship/data/network/network_info.dart';
import 'package:msa_internship/data/request/request.dart';
import 'package:msa_internship/domain/model/model.dart';
import 'package:msa_internship/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  // final NetworkInfo _networkInfo;

  // RepositoryImpl(this._remoteDataSource, this._networkInfo);
  RepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    // if (await _networkInfo.isConnected) {
    try {
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
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
    // } else {
    //   // return connection error
    //   return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    // }
  }
}
