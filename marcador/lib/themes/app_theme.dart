import 'package:flutter/material.dart';

// CLASE APPTHEME
// Centraliza los estilos y la configuración visual de la aplicación.
// Permite reutilizar los mismos estilos en diferentes widgets.
class AppTheme {

  // Define la apariencia del botón utilizado para sumar puntos.
  static ButtonStyle get botonSuperior {
    return FilledButton.styleFrom(

      // Establece la altura mínima del botón.
        minimumSize: Size.fromHeight(150),

        // Define la forma del botón.
        shape: RoundedRectangleBorder(

          // Redondea únicamente las esquinas superiores.
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
            )
        )
    );
  }

  // Define la apariencia del botón utilizado para restar puntos.
  static ButtonStyle get botonInferior {
    return FilledButton.styleFrom(

      // Establece la altura mínima del botón.
        minimumSize: Size.fromHeight(150),

        // Define la forma rectangular del botón.
        shape: RoundedRectangleBorder()
    );
  }

  // Define la apariencia del contenedor que muestra
  // el nombre del equipo debajo de los botones.
  static BoxDecoration get textoInferior {
    return const BoxDecoration(

      // Redondea las dos esquinas inferiores del contenedor.
        borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)
        )
    );
  }

}