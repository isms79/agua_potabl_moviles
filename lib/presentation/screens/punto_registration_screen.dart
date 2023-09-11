import 'dart:io';

import 'package:flutter/material.dart';
import 'package:agua_potable2/datos/punto_list.dart';
import 'package:agua_potable2/dominio/models/punto.dart';
import 'package:agua_potable2/presentation/widgets/appbar_menu.dart';
import 'package:agua_potable2/presentation/screens/SecondPage_screen.dart'; // Importa la pantalla a la que deseas navegar

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ubicacionController = TextEditingController();
  final TextEditingController _ciudadController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _comunaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMenu(title: 'Registrar Punto'), // Cambia el título según tu necesidad
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Ubicación'),
                controller: _ubicacionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la ubicación';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Ciudad'),
                controller: _ciudadController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la ciudad';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Dirección'),
                controller: _direccionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la dirección';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Teléfono'),
                controller: _telefonoController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el teléfono';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Comuna'),
                controller: _comunaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la comuna';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var newPunto = Punto(
                      ubicacion: _ubicacionController.text,
                      activo: true, // Puedes definir el valor de activo como desees
                      ciudad: _ciudadController.text,
                      direccion: _direccionController.text,
                      telefono: _telefonoController.text,
                      comuna: _comunaController.text,
                    );
                    // Aquí puedes hacer algo con el objeto newPunto, como guardarlo en una lista o base de datos.

                    // Navega a la página SecondPage_screen después de registrar el punto.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(), // Reemplaza con la pantalla de destino correcta
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registro de Punto exitoso')),
                    );
                  }
                },
                child: const Text('Registrar Punto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
