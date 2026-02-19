import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarritoScreen(),
    );
  }
}

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWeb = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.search),
        title: const Text(
          "Carrito",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: isWeb ? 500 : double.infinity),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "¡Agregado a tu carrito!",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://raw.githubusercontent.com/Mulato-Aaron/imagenes1/refs/heads/main/header.jpg",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 25),
                const Text(
                  "Resident Evil 4",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Mex \$559.00",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),

                const SizedBox(height: 30),

                // BOTONES CON ANIMACIÓN REINSTALADA
                BotonAnimado(
                  texto: "Seguir comprando", 
                  color: Colors.grey.shade300, 
                  textoColor: Colors.black
                ),
                const SizedBox(height: 15),
                BotonAnimado(
                  texto: "Ver mi carrito", 
                  color: Colors.lightBlue.shade200, 
                  textoColor: Colors.black
                ),
                
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        // Mantener los labels para que los iconos no desaparezcan en Web
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Ofertas"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: "Biblioteca"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}

// Clase separada para manejar la animación del botón
class BotonAnimado extends StatefulWidget {
  final String texto;
  final Color color;
  final Color textoColor;

  const BotonAnimado({
    super.key, 
    required this.texto, 
    required this.color, 
    required this.textoColor
  });

  @override
  State<BotonAnimado> createState() => _BotonAnimadoState();
}

class _BotonAnimadoState extends State<BotonAnimado> {
  double _escala = 1.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click, // Para que el mouse cambie en Web
      child: GestureDetector(
        onTapDown: (_) => setState(() => _escala = 0.95), // Se encoge
        onTapUp: (_) => setState(() => _escala = 1.0),   // Vuelve a su tamaño
        onTapCancel: () => setState(() => _escala = 1.0),
        child: AnimatedScale(
          scale: _escala,
          duration: const Duration(milliseconds: 100),
          child: Container(
            width: 300,
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            child: Text(
              widget.texto,
              style: TextStyle(
                color: widget.textoColor, 
                fontWeight: FontWeight.bold, 
                fontSize: 16
              ),
            ),
          ),
        ),
      ),
    );
  }
}
