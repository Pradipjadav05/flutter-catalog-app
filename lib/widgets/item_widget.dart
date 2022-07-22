import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/catelog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item}) : assert(item != null);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          //print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: 1.5,
        ),
      ),
    );
  }
}
