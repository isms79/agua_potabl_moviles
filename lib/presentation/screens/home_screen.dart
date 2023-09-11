import 'package:agua_potable2/presentation/screens/SecondPage_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:agua_potable2/presentation/widgets/appbar_menu.dart';
import 'package:agua_potable2/presentation/screens/pantallaTres_screen.dart';

import '../../dominio/models/image_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppbarMenu(title: 'Waters Location'),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: imageSliders,
                ),
                const Text(
                  'Bienvenido a Waters Location',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 330,
                  height: 480,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Waters Location es una página pública dedicada a dar a conocer el suministro de agua potable, recolección y tratamiento de aguas servidas.',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        "“Miles de personas han sobrevivido sin amor, ninguna sin agua”; \n~W. H. Auden.",
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        "“Sabemos que cuando protegemos nuestros océanos, protegemos nuestro futuro”; \n~Bill Clinton.",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SecondPage(),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    primary: Colors.blue, // Color de fondo azul
    textStyle: TextStyle(
      fontSize: 16.0,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
  child: const Text(
    'Conocer los puntos de agua.',
    style: TextStyle(color: Colors.white),
  ),
),

              ],
            ),
          ),
        ));
  }
}
