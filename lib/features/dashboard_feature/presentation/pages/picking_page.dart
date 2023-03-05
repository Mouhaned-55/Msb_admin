import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hackaton_msb/features/dashboard_feature/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:hackaton_msb/features/dashboard_feature/presentation/bloc/dashboard_bloc/dashboard_state.dart';
import 'package:hackaton_msb/features/dashboard_feature/presentation/widgets/dashboard_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/loading_widget.dart';
import '../../../../core/message_display_widget.dart';
import '../bloc/dashboard_bloc/dashboard_events.dart';
import '../widgets/picking_widget.dart';

class PickinPage extends StatefulWidget {
  const PickinPage({super.key});

  @override
  State<PickinPage> createState() => _PickinPageState();
}

class _PickinPageState extends State<PickinPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PickingBloc>(context).add(GetAllPickingsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 8.0, 10.0),
      child: BlocBuilder<PickingBloc, DashboardState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const LoadingWidget();
          } else if (state is LoadedPickingState) {
            print("st $state");

            return DashBoardPickingWidget(
              picking: state.picking,
            );
          }

          return const LoadingWidget();
        },
      ),
    );
  }
}
