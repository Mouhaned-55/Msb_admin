import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/picking_entity.dart';
import '../../domain/entities/stock_entity.dart';
import 'cards/alert_dialog.dart';
import 'cards/picking_card_info.dart';

class DashBoardPickingWidget extends StatelessWidget {
  final List<Picking> picking;

  const DashBoardPickingWidget({
    Key? key,
    required this.picking, // make stock optional and nullable
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
          trailing: Text("$percentage%"),
          onTap: () {
            print("**************");
            showPickingAlert(
                context,
                PickingCardInfo(
                ));
            // do something when the tile is tapped
          },
        );
      },
    );
  }
}
