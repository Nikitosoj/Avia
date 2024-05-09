import 'package:avia/features/home/bloc/home_bloc.dart';
import 'package:avia/features/home/domain/music_fly_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/text_styles.dart';
import 'input_area.dart';
import 'music_scroll.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.from});
  final String from;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    _bloc.add(LoadHome());
    super.initState();
  }

  final HomeBloc _bloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is HomeLoaded) {
          final MusicFlyModelList myItem = state.myItem;
          return SafeArea(
            child: ListView(children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 172.w,
                      child: const Text(
                        'Поиск дешевых авиабилетов',
                        style: TextStyles.title1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 36.h),
                  InputArea(from: widget.from),
                  SizedBox(height: 32.h),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Музыкально отлететь',
                      style: TextStyles.title2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: 215,
                      child: MusicScroll(
                        myItem: myItem,
                      ))
                ],
              ),
            ]),
          );
        }
        if (state is HomeLoadingFailure) {
          return Center(
            child: Column(
              children: [
                Text(state.error),
                TextButton(
                    onPressed: () {
                      _bloc.add(LoadHome());
                    },
                    child: const Text('Try again'))
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
