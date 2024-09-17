import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../extensions/colorful_logging_extension.dart';
import 'exception.dart';
import 'failures.dart';

mixin RepositoryExceptionHandler {
  Future<Either<Failure, T>> exceptionHandler<T>({
    required Future<Right<Failure, T>> Function() tryCall,
  }) async {
    try {
      final right = await tryCall();
      return right;
    } on ServerException catch (e) {
      log("<< ServerException >> ".logRed);
      return Left(ServerFailure(message: e.message, code: e.statusCode));
    } catch (e) {
      log("<< catch >> error is $e".logRed);
      return const Left(ServerFailure(message: 'error'));
    }
  }
}
