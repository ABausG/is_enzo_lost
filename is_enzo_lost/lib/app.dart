import 'package:jaspr/jaspr.dart';

import 'pages/home.dart';
import 'status_service.dart';

class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final StatusEntry status;
  @override
  void initState() {
    super.initState();
    status = StatusService.getLatestStatus();
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'main', [
      Home(status: status),
    ]);
  }
}
