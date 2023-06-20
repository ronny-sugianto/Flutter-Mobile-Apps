import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc_agora/common/common.dart';
import 'package:poc_agora/core/core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _roomKeyController = TextEditingController();
  bool _isJoinEnable = false;

  @override
  void initState() {
    super.initState();
    _roomKeyController.addListener(() {
      _isJoinEnable = _roomKeyController.text.trim().isNotEmpty;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _roomKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Simple Private Live',
          style: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: BlocConsumer<AgoraCubit, BaseState<AgoraLiveModel>>(
          listener: (context, state) {
        print("===========> $state");
        if (state is SuccessState &&
            state.data?.status == AgoraLiveStatus.joined) {
          context.go('/$liveScreen');
        }
      }, builder: (context, state) {
        if (state is SuccessState &&
            state.data?.status == AgoraLiveStatus.initialized) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Room Key',
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          TextFormField(
                            controller: _roomKeyController,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: 'Enter room key...',
                              hintMaxLines: 2,
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.white.withOpacity(.5),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _isJoinEnable
                          ? context.read<AgoraCubit>().join(
                                rtcEngine: state.data!.engine,
                                channelId: _roomKeyController.text,
                                roleLive: ClientRoleType.clientRoleAudience,
                              )
                          : null,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(
                            _isJoinEnable ? 1 : .5,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'View Live',
                          style: GoogleFonts.openSans(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Expanded(child: Divider(color: Colors.white)),
                    Text(
                      '\t OR \t',
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Expanded(child: Divider(color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _isJoinEnable
                      ? context.read<AgoraCubit>().join(
                            rtcEngine: state.data!.engine,
                            channelId: _roomKeyController.text,
                          )
                      : null,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: Text(
                      'Create or Join Live',
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }

        if (state is ErrorState) {
          return Center(
            child: Text(
              'Error, Please Contact Developer!',
              style: GoogleFonts.openSans(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
