import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../data/movies.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Map<String, dynamic>> pelis = [...movies];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 19 - Dismissed'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemCount: pelis.length,
        itemBuilder: (BuildContext context, int index) {
          final item = pelis[index];
          return Slidable(
            child: ListTile(
                title: Text(item['title_name']),
                subtitle: Text(item['Genres'])),
            actionPane: SlidableDrawerActionPane(),
            actions: [
              IconSlideAction(
                  caption: 'Agregar',
                  color: Color.fromARGB(255, 4, 43, 5),
                  icon: Icons.library_add,
                  onTap: () => onDismissed(index, 'Agregar')),
            ],
            secondaryActions: [
              IconSlideAction(
                  caption: 'Eliminar',
                  color: Colors.red,
                  icon: Icons.cancel_outlined,
                  onTap: () => onDismissed(index, 'Eliminar')),
            ],
          );
        },
      ),
    );
  }

  onDismissed(int index, String accion) {
    setState(() {
      final _snackBar = SnackBar(content: Text('Accion: $accion'));
      pelis.removeAt(index);

      switch (accion) {
        case 'Agregar':
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
          break;
        case 'Eliminar':
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
          break;
      }
    });
  }
}
