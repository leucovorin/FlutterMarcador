
import 'package:flutter/material.dart';
import 'package:marcador/themes/app_theme.dart';
import '../widgets/boton.dart';
import '../widgets/marcador.dart';
import '../widgets/reset.dart';

// Pantalla principal del marcador.
// El widget es Stateful porque los puntos de los equipos pueden cambiar.
class MarcadorScreen extends StatefulWidget {
  const MarcadorScreen({super.key});

  @override
  State<MarcadorScreen> createState() => _MarcadorScreenState();
}

class _MarcadorScreenState extends State<MarcadorScreen> {

  // Variables que almacenan los puntos de cada equipo.
  int _contador1 = 0;
  int _contador2 = 0;

  @override
  Widget build(BuildContext context) {

    // Color de fondo principal de la pantalla.
    Color fondo = AppColors.fondoApp;

    return Scaffold(
      backgroundColor: fondo,

      // BARRA SUPERIOR (APPBAR)
      // Contiene el icono de baloncesto y el título de la aplicación.
      appBar: AppBar(
        backgroundColor: fondo,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: -8,
        title:
        // Título de la aplicación.
        Text(
          "MARCADOR",
          style: TextStyle(
            color: AppColors.blanco,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
          leading:
          // Icono de pelota de baloncesto
          Icon(
            Icons.sports_basketball_outlined,
            color: AppColors.blanco,
            size: 26,
          )
      ),

      // CUERPO PRINCIPAL DE LA PANTALLA
      // Center coloca el contenido en el centro de la pantalla.
      body: Center(
        child: Column(
          children: [

            // MARCADOR
            // Muestra los puntos actuales de los dos equipos.
            // Los valores se actualizan cuando cambian los contadores.
            Marcador(
              contador1: _contador1,
              contador2: _contador2,
            ),

            // FILA DE BOTONES
            // Contiene los botones para sumar puntos a cada equipo.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [

                // BOTÓN DEL EQUIPO LOCAL
                Boton(
                  textoBoton: "EQUIPO LOCAL",
                  contador: _contador1,

                  // Recibe el nuevo valor del contador.
                  // setState actualiza la interfaz para mostrarlo.
                  onChanged: (nuevoValor) {
                    setState(() {
                      _contador1 = nuevoValor;
                    });
                  },

                  // Colores del botón.
                  colorFondo: AppColors.azul,
                  colorFondo2: const Color(0xFF1B64B4),
                ),

                // BOTÓN DEL EQUIPO VISITANTE
                Boton(
                  textoBoton: "EQUIPO VISITA",
                  contador: _contador2,

                  // Actualiza los puntos del equipo visitante.
                  onChanged: (nuevoValor) {
                    setState(() {
                      _contador2 = nuevoValor;
                    });
                  },

                  // Colores del botón.
                  colorFondo: AppColors.rojo,
                  colorFondo2: const Color(0xFFA61724),
                ),
              ],
            ),

            // ESPACIO ENTRE LOS BOTONES Y EL BOTÓN RESET.
            const SizedBox(height: 15),

            // BOTÓN DE REINICIO
            // Permite poner a cero los puntos de ambos equipos.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Reset(
                  onReset: () {
                    setState(() {
                      // Reinicia los dos contadores a cero.
                      _contador1 = 0;
                      _contador2 = 0;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}