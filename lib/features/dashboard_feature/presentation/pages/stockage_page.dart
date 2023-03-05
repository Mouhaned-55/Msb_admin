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
import '../widgets/stockage_widget.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StockBloc>(context).add(GetAllPickingsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 8.0, 10.0),
      child: BlocBuilder<StockBloc, DashboardState>(
        builder: (context, state) {
          if (state is LoadedStockState) {
            print("st $state");
            return DashBoardStockWidget(
              stock: state.stock,
            );
          } else if (state is ErrorDashboardState) {
            return MessageDisplayWidget(message: state.message);
          }

          return const LoadingWidget();
        },
      ),
    );
  }
}
