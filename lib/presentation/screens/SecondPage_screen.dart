import 'package:agua_potable2/datos/info_list.dart';
import 'package:agua_potable2/dominio/models/info.dart';
import 'package:agua_potable2/presentation/screens/pantallaTres_screen.dart';
import 'package:agua_potable2/presentation/screens/punto_registration_screen.dart';
import 'package:agua_potable2/presentation/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:agua_potable2/datos/people_list.dart';
import 'package:agua_potable2/dominio/models/punto.dart';
import '../widgets/appbar_menu.dart';


class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

List<PuntoAgua> puntoList = puntosDeAgua;

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMenu(title: 'Puntos De Agua Potable'),
      body: Column(
        children: [
          Column(
  children: [
    // ElevatedButton(
    //   onPressed: () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => RegistrationScreen(),
    //       ),
    //     );
    //   },
    //   child: const Text('Registrar'),
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    //   ),
    // ),
    SizedBox(height: 16.0), 
    ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PantallaTresScreen(),
          ),
        );
      },
      child: const Text('Ir a la pantalla 3'),
    ),
  ],
),

          Expanded(
            child: ListView.builder(
              itemCount: puntoList.length,
              itemBuilder: (BuildContext context, int index) {
                var punto = puntoList[index];
                return ListTile(
                  title: Text('Ubicación: ${punto.ubicacion}'),
                  subtitle: Text('Ciudad: ${punto.ciudad}'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Información del Punto de Agua'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Ubicación: ${punto.ubicacion}'),
                              Text('Estado: ${punto.activo ? 'Activo' : 'Inactivo'}'),
                              Text('Ciudad: ${punto.ciudad}'),
                              Text('Dirección: ${punto.direccion}'),
                              Text('Teléfono: ${punto.telefono}'),
                              Text('Comuna: ${punto.comuna}'),
                              Text('    '),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    puntoList.remove(punto);
                                  });
                                  Navigator.of(context).pop(); 
                                },
                                child: Text('Eliminar'),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); 
                              },
                              child: Text('Cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

