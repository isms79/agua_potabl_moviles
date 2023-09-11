import 'package:flutter/material.dart';
import 'package:agua_potable2/dominio/models/info.dart';
import 'package:agua_potable2/datos/info_list.dart';

import '../widgets/appbar_menu.dart';

class PantallaTresScreen extends StatefulWidget {
  @override
  _PantallaTresScreenState createState() => _PantallaTresScreenState();
}

class _PantallaTresScreenState extends State<PantallaTresScreen> {
  List<PuntoAgua> puntosDeAguas = puntosDeAgua;
  List<PuntoAgua> puntosFiltrados = [];

  @override
  void initState() {
    super.initState();

    // Inicializa tus listas de puntosDeAgua y puntosFiltrados aquí.
    puntosDeAgua = List.from(puntosDeAgua);
    puntosFiltrados = List.from(puntosDeAgua);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMenu(title: 'Puntos de agua cercanos a tu ubicación'),
      body: DataTable(
        columns: [
          DataColumn(label: Text('Ubicación')),
          DataColumn(label: Text('Ciudad')),
          DataColumn(label: Text('Acciones')),
        ],
        rows: puntosFiltrados.map((puntoAgua) {
          return DataRow(
            cells: [
              DataCell(Text(puntoAgua.ubicacion)),
              DataCell(Text(puntoAgua.ciudad)),
              DataCell(
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove_circle), // Icono para eliminar.
                      onPressed: () {
                        _eliminarPuntoAgua(context, puntoAgua);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.info), // Icono para ver detalles.
                      onPressed: () {
                        _mostrarInformacion(context, puntoAgua);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  void _eliminarPuntoAgua(BuildContext context, PuntoAgua puntoAgua) {
    setState(() {
      puntosDeAgua.remove(puntoAgua);
      puntosFiltrados = List.from(puntosDeAgua);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Punto de agua eliminado.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _mostrarInformacion(BuildContext context, PuntoAgua puntoAgua) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Información Detallada'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Ubicación: ${puntoAgua.ubicacion}'),
              Text('Estado: ${puntoAgua.activo ? 'Activo' : 'Inactivo'}'),
              Text('Ciudad: ${puntoAgua.ciudad}'),
              Text('Dirección: ${puntoAgua.direccion}'),
              Text('Teléfono: ${puntoAgua.telefono}'),
              Text('Comuna: ${puntoAgua.comuna}'),
              
              Image.asset(
                puntoAgua.imagen,
                width: 100,
                height: 100,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _eliminarPuntoAgua(context, puntoAgua);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
              ),
              child: Text('Eliminar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, 
                onPrimary: Colors.white, 
              ),
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
