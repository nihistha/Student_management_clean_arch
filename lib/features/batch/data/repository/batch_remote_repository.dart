import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/batch_entity.dart';
import '../../domain/repository/batch_repository.dart';
import '../data_source/remote/batch_remote_datasource.dart';

final batchRemoteRepositoryProvider = Provider<IBatchRepository>((ref) {
  return BatchRemoteRepository(
      batchRemoteDataSource: ref.read(batchRemoteDataSourceProvider));
});

class BatchRemoteRepository implements IBatchRepository {
  final BatchRemoteDataSource batchRemoteDataSource;
  BatchRemoteRepository({required this.batchRemoteDataSource});
  @override
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) {
    return batchRemoteDataSource.addBatch(batch);
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    return batchRemoteDataSource.getAllBatches();
  }
}
