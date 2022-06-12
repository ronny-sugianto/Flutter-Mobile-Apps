import 'package:blank_sample_project/src/common/common.dart';
import 'package:blank_sample_project/src/core/core.dart';
import 'package:blank_sample_project/src/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GpsScreen extends StatelessWidget {
  const GpsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GpsActionCubit(
              permissionClient: context.read<BasePermissionClient>(),
            ),
          ),
          BlocProvider(
            create: (context) => GpsDataCubit(
              permissionClient: context.read<BasePermissionClient>(),
              geocoderClient: context.read<BaseGeocoderClient>(),
              geolocatorClient: context.read<BaseGeolocatorClient>(),
            )..getStatus(),
          )
        ],
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocListener<GpsActionCubit, BaseState>(
            listener: (context, state) {
              if (state is LoadedState) {
                context.read<GpsDataCubit>().getStatus();
              }
            },
            child: BlocBuilder<GpsDataCubit, BaseState<Gps>>(
              builder: (context, state) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Permission Status : ${state.data?.permissionStatus ?? '-'}\n'
                    'LatLng : ${state.data?.latlong?.latitude ?? '-'},${state.data?.latlong?.longitude ?? '-'}\n'
                    'Address : ${state.data?.address ?? '-'}',
                  ),
                  if (state.data?.permissionStatus == false) ...[
                    const SizedBox(height: 30),
                    ButtonWidget(
                      onTap: () =>
                          context.read<GpsActionCubit>().requestLocation(),
                      text: 'Request Permission',
                    )
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
