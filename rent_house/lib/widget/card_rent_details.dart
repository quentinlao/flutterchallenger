import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';


class CardRentDetails extends StatelessWidget {
  final Map<String, String> details;
  final IconData icon;
  final int index;

  CardRentDetails({Key key, this.details, this.icon, this.index}): super(key: key);

  final Color baseColor = Color(0xFFf0f0f5);
  final Color parentColor = Color(0xFFf2f2f2);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: ClayContainer(
        color: baseColor,
        parentColor: parentColor,
        curveType: CurveType.none,
        depth: 40,
        borderRadius: 50,
        spread: 5,
        customBorderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        child: Container(
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /// ICON
              Icon(icon, size: 50, color: Colors.grey[400],),
              /// DETAILS
              Container(
                width: 180,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(details['Area'],
                        style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 25),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(details.keys.toList().elementAt(index),
                        style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, fontSize: 20),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}