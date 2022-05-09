import 'package:alice/alice.dart';
import 'package:blank_sample_project/src/app.dart';
import 'package:blank_sample_project/src/common/common.dart';
import 'package:blank_sample_project/src/core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Alice _alice = Alice(showNotification: false);

  // Clients instantiation
  final BaseApiClient _apiClient = DioClient(
    alice: EnvConfig.env != 'PROD' ? _alice : null,
  );
  final BaseSharedPrefClient _sharedPrefClient = SharedPrefClient.instance;

  // Disable Landscape Mode
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  BlocOverrides.runZoned(
    () => runApp(
      SetupApp(
        apiClient: _apiClient,
        sharedPrefClient: _sharedPrefClient,
      ),
    ),
    blocObserver: MainBlocObserver(),
  );
}
