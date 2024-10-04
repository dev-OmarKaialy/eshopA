import 'package:dartz/dartz.dart';
import 'package:eshop_a/core/api/error/failure.dart';

typedef DataResponse<T> = Future<Either<Failure, T>>;

typedef QueryParams = Map<String, String?>?;

typedef BodyMap = Map<String, dynamic>;

typedef DataConverter<T> = T Function(dynamic body);
