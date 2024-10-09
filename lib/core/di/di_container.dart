import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// import 'di_container.config.dart';

final GetIt getIt = GetIt.I;

// @InjectableInit(
//   initializerName: r'$initGetIt',
//   preferRelativeImports: true,
//   asExtension: false,
// )
// GetIt configureDependencies() {
//   return $initGetIt(getIt);
// }

@module
abstract class AppModule {}
