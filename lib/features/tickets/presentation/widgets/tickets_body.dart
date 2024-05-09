import 'package:avia/features/tickets/domain/ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/assets/icons/custom_icons.dart';
import '../../../../core/styles/text_styles.dart';
import '../../bloc/ticket_bloc.dart';
import 'ticket_card.dart';

class TicketsBody extends StatefulWidget {
  const TicketsBody(
      {super.key,
      required this.fromName,
      required this.toName,
      required this.time});
  final String fromName;
  final String toName;
  final DateTime time;

  @override
  State<TicketsBody> createState() => _TicketsBodyState();
}

class _TicketsBodyState extends State<TicketsBody> {
  final TicketBloc _bloc = TicketBloc();
  late List<TicketModel> myItem;

  @override
  void initState() {
    _bloc.add(LoadTicket());
    super.initState();
  }

  final List<String> months = [
    'Января',
    'Февраля',
    'Марта',
    'Апреля',
    'Мая',
    'Июня',
    'Июля',
    'Августа',
    'Сентября',
    'Октября',
    'Ноября',
    'Декабря',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketBloc, TicketState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is TicketLoaded) {
          myItem = state.myItem;
          return SafeArea(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16.h),
                  width: 328.w,
                  height: 56.h,
                  color: const Color.fromRGBO(36, 37, 41, 1),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_sharp,
                            size: 24,
                            color: Color.fromRGBO(34, 97, 188, 1),
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: Text('${widget.fromName} - ${widget.toName}',
                                style: TextStyles.names),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 4.h),
                            child: Text(
                                '${widget.time.day} ${months[widget.time.month - 1]} , 1 пассажир',
                                style: TextStyles.chipsGrey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25.h),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 16.w),
                      height: 546.h,
                      child: ListView.builder(
                          itemCount: myItem.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TicketCard(myItem: myItem[index]);
                          }),
                    ),
                    Positioned(
                      bottom: 0,
                      left: (360.w / 2) - (185.w / 2),
                      child: Container(
                        alignment: Alignment.center,
                        width: 185.w,
                        height: 37.h,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(34, 97, 188, 1),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(children: [
                          SizedBox(width: 15.w),
                          const Icon(
                            CustomIcons.filter,
                            size: 14,
                          ),
                          SizedBox(width: 5.w),
                          const Text('Фильт', style: TextStyles.chips),
                          SizedBox(width: 15.w),
                          const Icon(CustomIcons.graph, size: 14),
                          SizedBox(width: 5.w),
                          const Text('График цен', style: TextStyles.chips),
                        ]),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }
        if (state is TicketLoadingFailure) {
          return Center(
            child: Column(
              children: [
                Text(state.error),
                TextButton(
                    onPressed: () {
                      _bloc.add(LoadTicket());
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
