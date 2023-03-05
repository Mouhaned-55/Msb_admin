import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackaton_msb/features/dashboard_feature/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:hackaton_msb/features/dashboard_feature/presentation/bloc/dashboard_bloc/dashboard_state.dart';
import 'package:hackaton_msb/features/dashboard_feature/presentation/pages/picking_page.dart';
import 'package:hackaton_msb/features/dashboard_feature/presentation/widgets/cards/alert_dialog.dart';
import 'package:hackaton_msb/features/dashboard_feature/presentation/widgets/dashboard_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/loading_widget.dart';
import '../../../../core/message_display_widget.dart';
import '../../../../core/tab_layout.dart';
import '../../domain/entities/picking_entity.dart';
import '../bloc/dashboard_bloc/dashboard_events.dart';
import '../widgets/cards/picking_card_info.dart';
import 'stockage_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var Picking = "picking";

  @override
  void initState() {

Future.delayed(Duration.zero, () {
    showPickingAlert(context, PickingCardInfo());
   });

    super.initState();

    BlocProvider.of<PickingBloc>(context).add(GetAllPickingsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 8.0, 10.0),
        child: Scaffold(
            appBar: AppBar(
              title: Container(
                margin: EdgeInsets.only(left: 85.w),
                child: const Text(
                  "Home Page",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xFF252525),
                    fontFamily: "Tajawal",
                  ),
                ),
              ),
              backgroundColor: Color.fromARGB(255, 253, 249, 249),
              elevation: 0,
              leading: IconButton(
                icon: Container(
                  child: SvgPicture.asset(
                    "assets/icons/sidebar.svg",
                  ),
                ),
                onPressed: () {
                  // scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),
            body: TabLayout(
              tabs: myTabs,
              tabsContent: [
                Expanded(child: PickinPage()),
                Expanded(child: StockPage())
              ],
            )));
  }
}
