import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/entities/picking_entity.dart';

class PickingCardInfo extends StatelessWidget {
  const PickingCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("You Must Refill The Picking Spaces",style: TextStyle(fontFamily: "Tajawal",fontSize: 18,fontWeight: FontWeight.w600),)])],
          ),
       
    );
  }
}
