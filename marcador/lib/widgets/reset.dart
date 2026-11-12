import 'package:flutter/material.dart';

// Widget del botón de reinicio.
// Es Stateless porque no necesita gestionar estados propios.
class Reset extends StatelessWidget {

  // Función que se ejecutará al pulsar el botón.
  final VoidCallback onReset;

  const Reset({
    super.key,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {

    // Colores del botón.
    const Color gris = Color(0xFF36383E);
    const Color grisClaro = Color(0xFF7B7E87);

    // Botón de reinicio.
    return OutlinedButton(
      onPressed: onReset,

      // Estilos del botón.
      style: OutlinedButton.styleFrom(
        backgroundColor: gris,
        side: const BorderSide(
          width: 1.5,
          color: grisClaro,
        ),
      ),

      // Contenido del botón: icono y texto.
      child: const Row(
        children: [
          SizedBox(width: 30),
          Icon(
            Icons.refresh_rounded,
            color: Colors.white,
            size: 20,
          ),
          Text(
            "  RESET",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
          ),
          SizedBox(width: 30),
        ],
      ),
    );
  }
}