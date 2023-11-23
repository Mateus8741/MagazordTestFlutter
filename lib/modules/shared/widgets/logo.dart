import 'package:flutter/material.dart';

class LogoComponent extends StatelessWidget {
  final String firstPartText;
  final Color colorLogo;

  const LogoComponent({
    Key? key,
    required this.firstPartText,
    this.colorLogo = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: firstPartText,
            style: const TextStyle(
                color: Colors.black, // Cor para a primeira parte
                fontWeight: FontWeight.bold,
                fontSize: 40 // Pode ajustar estilos conforme necessário
                ),
          ),
          TextSpan(
            text: 'App',
            style: TextStyle(
                color: colorLogo, // Cor para a segunda parte
                fontWeight:
                    FontWeight.bold, // Pode ajustar estilos conforme necessário
                fontSize: 40 // Pode ajustar estilos conforme necessário
                ),
          ),
        ],
      ),
    ));
  }
}
