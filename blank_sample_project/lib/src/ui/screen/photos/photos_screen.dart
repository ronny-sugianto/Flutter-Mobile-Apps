import 'package:blank_sample_project/src/common/common.dart';
import 'package:blank_sample_project/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotosCubit(
        imageRepository: context.read<BaseImageRepository>(),
      )..getImage(),
      child: Scaffold(
        body: BlocConsumer<PhotosCubit, BaseState<List<Photos>?>>(
          listener: (context, state) {
            if (state is ErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Error Load Data'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoadedState) {
              return RefreshIndicator(
                onRefresh: () async => context.read<PhotosCubit>().getImage(),
                child: ListView.builder(
                  itemCount: state.data?.length ?? 0,
                  itemBuilder: (_, i) => Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          state.data?[i].thumbnailUrl ?? '-',
                        ),
                      ),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(state.data?[i].title ?? ''),
                    ),
                  ),
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
