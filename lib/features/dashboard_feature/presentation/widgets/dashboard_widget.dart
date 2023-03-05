import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackaton_msb/core/tab_layout.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/entities/picking_entity.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/entities/stock_entity.dart';

class DashBoardWidget extends StatelessWidget {
  final List<Picking>? picking;
  final List<Stock>? stock;

  const DashBoardWidget({
    Key? key,
    this.picking,
    this.stock, // make stock optional and nullable
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabLayout(
      tabs: myTabs,
      tabsContent: [
        ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: picking?.length ?? 10,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
             var percentage =
                    ((picking![index].quantite / picking![index].capacite) *
                            100)
                        .round();
            return ListTile(
              title: Text('Emplacement : ${picking?[index].emplacement}'),
              subtitle: Text('Article :${picking?[index].article}'),
              trailing: Text("$percentage %"),
              onTap: () {
                // do something when the tile is tapped
              },
            );
          },
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: stock?.length ?? 10,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Emplacement : ${stock![index].emplacement}'),
              subtitle: Text('Article :${stock![index].article}'),
              onTap: () {
                // do something when the tile is tapped
              },
            );
          },
        ),
      ],
    );
  }
}

final List<String> myTabs = ["Picking", "Stockage"];
