import 'package:flutter/material.dart';
import 'package:marcador/screens/marcadorScreen.dart';

// Punto de entrada de la aplicación.
// runApp() inicia Flutter y muestra el widget principal MyApp.
void main() {
  runApp(const MyApp());
}

// WIDGET PRINCIPAL DE LA APLICACIÓN
// El widget es Stateless porque su contenido no necesita cambiar
// durante la ejecución de la aplicación.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // CONFIGURACIÓN GENERAL DE LA APLICACIÓN
    return MaterialApp(
      title: 'Marcador',

      // Oculta la etiqueta DEBUG de la esquina superior derecha.
      debugShowCheckedModeBanner: false,

      // Define el esquema de colores general de la aplicación.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),

      // Al iniciar la aplicación, se muestra MarcadorScreen.
      home: const MarcadorScreen(),
    );
  }
}
