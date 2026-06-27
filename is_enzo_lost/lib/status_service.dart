import 'package:is_enzo_lost/status_entry.dart';
import 'package:is_enzo_lost/status_log.dart';

class StatusService {
  static StatusEntry getLatestStatus() {
    try {
      return StatusLog.readFileSync('../status.json').latest();
    } on Object {
      return StatusEntry(
        isLost: null,
        source: 'https://x.com/enzoconty',
        timestamp: DateTime.now(),
      );
    }
  }
}
