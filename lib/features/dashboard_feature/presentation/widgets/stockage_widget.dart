import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/stock_entity.dart';

class DashBoardStockWidget extends StatelessWidget {
  final List<Stock> stock;

  const DashBoardStockWidget({
    Key? key,
    required this.stock, // make stock optional and nullable
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
    );
  }
}
