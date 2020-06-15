import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class SimpleBlocDelegate extends BlocDelegate {
  var logger = Logger(
    filter: null,
    printer: PrettyPrinter(),
    output: null,
  );

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    logger.e(error, [stackTrace]);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    logger.i(bloc, event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.i(bloc, transition);
    super.onTransition(bloc, transition);
  }
}
