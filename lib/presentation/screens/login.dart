import 'package:agua_potable2/dominio/models/people.dart';
import 'package:agua_potable2/presentation/screens/home_screen.dart';
import 'package:agua_potable2/presentation/screens/registration_screen.dart';
import 'package:agua_potable2/presentation/widgets/appbar_menu.dart';
import 'package:flutter/material.dart';
import 'package:agua_potable2/datos/people_list.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = "";

  List<People> usuarios = people;

  bool isUserRegistered(String user, String password) {
    // Recorre la lista de usuarios
    for (var person in people) {
      // Comprueba si el usuario y la contraseña coinciden
      if (person.user == user && person.password == password) {
        return true; // El usuario ya está registrado
      }
    }
    return false; // El usuario no está registrado
  }

  void _login() {
    final enteredUser = userController.text;
    final enteredPassword = passwordController.text;

    // Verifica si el usuario y la contraseña son válidos
    if (enteredUser.isNotEmpty && enteredPassword.isNotEmpty) {
      if (isUserRegistered(enteredUser, enteredPassword)) {
        // El usuario está registrado, procede a la segunda página
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        // Muestra un mensaje de error si el usuario no está registrado
        setState(() {
          errorMessage = "Usuario o contraseña incorrectos";
        });
      }
    } else {
      // Muestra un mensaje de error si los campos están vacíos
      setState(() {
        errorMessage = "Por favor, ingresa usuario y contraseña*";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMenu(title: 'Login'),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://1.bp.blogspot.com/-qU3RJ83CnNM/Vk3mRZBRvJI/AAAAAAAAACU/MunIDDj1EIs/s1600/9610portada-cartilla.jpg',
                  ),
                  fit: BoxFit.cover,
                  // Ajusta la opacidad de la imagen de fondo aquí
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(
                        0.9), // Ajusta el valor de opacidad según tu preferencia
                    BlendMode.dstATop,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        
                        child: TextField(
                          controller: userController,
                          decoration: InputDecoration(
                            labelText: "Usuario",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0), // Espacio vertical entre elementos
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Contraseña",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                          height:
                              10.0), // Espacio vertical entre los TextField y el botón
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          textStyle: TextStyle(
                            fontSize: 16.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          "Iniciar Sesión",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        errorMessage,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue, // Color de fondo azul
                            ),
                            child: const Text(
                              'Registrar',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
