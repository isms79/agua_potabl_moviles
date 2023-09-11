import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List imgList = [
  ['https://www.eltiempo.com/infografias/2022/07/agua-contaminacion/agua-contaminacion_A/agua-contaminacion_A-d.jpg', 'Calidad' ],
  ['https://imgs.mongabay.com/wp-content/uploads/sites/25/2019/03/23031717/%C3%ADndice-uso-del-agua.jpg', 'Abastecimiento'],
  ['https://pbs.twimg.com/media/DNuRQflXcAAtXBT.jpg:large', 'Saneamiento'],
  ['https://cdn5.dibujos.net/dibujos/pintados/202048/agua-ecologica-naturaleza-medioambiente-12091529.jpg', 'Cuidado'],
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item [0], fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '${item[1]}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();