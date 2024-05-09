import 'package:avia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/direct_bloc.dart';
import '../domain/direct_model.dart';
import 'ticket_info.dart';

class DirectList extends StatefulWidget {
  const DirectList({super.key});

  @override
  State<DirectList> createState() => _DirectListState();
}

class _DirectListState extends State<DirectList> {
  late List<DirectModel> myItem;
  final DirectBloc _bloc = DirectBloc();
  @override
  void initState() {
    _bloc.add(LoadDirect());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocBuilder<DirectBloc, DirectState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is DirectLoaded) {
          myItem = state.myItem;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            width: 328.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromRGBO(47, 48, 53, 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  child: Text('Прямые рейсы', style: TextStyles.title3),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TicketInfo(
                      size: size,
                      name: myItem[0].title,
                      timeRange: myItem[0].timeRange,
                      price: myItem[0].value,
                      color: Color.fromRGBO(255, 94, 94, 1),
                    ),
                    TicketInfo(
                      size: size,
                      name: myItem[1].title,
                      timeRange: myItem[1].timeRange,
                      price: myItem[1].value,
                      color: Color.fromRGBO(34, 97, 188, 1),
                    ),
                    TicketInfo(
                      size: size,
                      name: myItem[2].title,
                      timeRange: myItem[2].timeRange,
                      price: myItem[2].value,
                      color: Colors.white,
                    ),
                    Center(
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Показать все',
                              style: TextStyles.buttonBlue,
                            ))),
                    SizedBox(height: 15.h)
                  ],
                )
              ],
            ),
          );
        }
        if (state is DirectLoadingFailure) {
          return Container(
            width: 100,
            height: 100,
            child: Center(
              child: Column(
                children: [
                  Text(state.error),
                  TextButton(
                      onPressed: () {
                        _bloc.add(LoadDirect());
                      },
                      child: const Text('Try again'))
                ],
              ),
            ),
          );
        } else {
          return Container(
            height: 100,
            width: 100,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
