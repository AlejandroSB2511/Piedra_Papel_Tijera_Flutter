import 'dart:math';
import 'package:flutter/material.dart';

class Piedrapapeltijera extends StatefulWidget {
  const Piedrapapeltijera({super.key});

  @override
  State<Piedrapapeltijera> createState() => _PiedrapapeltijeraState();
}

class _PiedrapapeltijeraState extends State<Piedrapapeltijera> {
  int numeroAleatorio = 0;
  int numeroAleatorio2 = 0;
int generarNumeroAleatorio() {
  return Random().nextInt(3) + 1;
}
void jugar() {
  setState(() {
    numeroAleatorio = generarNumeroAleatorio();
    numeroAleatorio2 = generarNumeroAleatorio();
    print('Player1: $numeroAleatorio, Player2: $numeroAleatorio2');
  });
}
  ImageProvider getImagen (int number) {
    switch(number) {
      case 1: 
        return AssetImage("paper.png");
      case 2:
        return AssetImage("scissors.png");
      case 3:
        return AssetImage("rock.png");
      default: 
        return AssetImage("imagen.png");
    }

  }
  Text elegirGanador() {
  Text ganador = Text("data");
    if(numeroAleatorio == numeroAleatorio2) {
      ganador = Text("Empate");
    }
    if (numeroAleatorio == 1 && numeroAleatorio2 == 2) {
      ganador = Text("Gana el jugador 1");
    } else {
      ganador = Text("Gana el jugador 2");
    }
  if (numeroAleatorio == 1 && numeroAleatorio2 == 3) {
    ganador = Text("Gana el jugador 1");
  } else {
    ganador = Text("Gana el jugador 2");
  }
  if (numeroAleatorio == 3 && numeroAleatorio2 == 2) {
    ganador = Text("Gana el jugador 1");
  } else {
    ganador = Text("Gana el jugador 2");
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Piedra,Papel,Tijera",style: TextStyle(),),centerTitle: true),
      body: Stack(
        children: [
          Positioned(
              left: 60,
              top: 300,
              child: Text("Player1",style: TextStyle(fontSize: 25),)
          ),
          Positioned(
              left: 20,
              top: 350,
              child: Container(
                height:160,
                width: 160,
                decoration: BoxDecoration(shape: BoxShape.circle,
                    color: Colors.green,
                    image: DecorationImage(image: getImagen(numeroAleatorio))
                ),
              )
          ),
          Positioned(
              left: 260,
              top: 300,
              child: Text("Player2",style: TextStyle(fontSize: 25),)
          ),
          Positioned(
              left: 220,
              top: 350,
              child: Container(
                height:160,
                width: 160,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                  image: DecorationImage(image: getImagen(numeroAleatorio2))
                ),
              )
          ),
          Positioned(child: elegirGanador()
          ),
          Positioned(
              top: 600,
              left: 50,
              width: 300,
              child: TextButton(
                onPressed: jugar,
                child: Text("Go!!",style: TextStyle(fontSize: 40, color: Colors.white)),
                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.red)),

              )
          )
        ],
      ),
    );
  }
}

