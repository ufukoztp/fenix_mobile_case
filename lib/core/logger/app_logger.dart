import 'package:fenix_mobile_case/core/logger/log_json.dart';
import 'package:logger/logger.dart';



final class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 400,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  static call({dynamic value, Level? logLevel, String? title}) {

    _logger.log(logLevel ?? Level.fatal, LogJson.format(value, title: title));
  }
}
