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
      home: TiendaScreen(),
    );
  }
}

class TiendaScreen extends StatelessWidget {
  const TiendaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 100, // Un poco más de altura para acomodar las dos líneas
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea el contenido al inicio (izquierda)
          children: [
            // Línea 1: Nombre del negocio a la izquierda
            const Text(
              "Steam de Mulato",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            // Línea 2: Contenedor que ocupa todo el ancho para centrar "Tienda"
            SizedBox(
              width: double.infinity,
              child: const Text(
                "Tienda",
                textAlign: TextAlign.center, // ESTO centra la palabra
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        // Acciones: El icono pegado a la derecha
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 16), // Ajustamos posición vertical
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 28,
              color: Colors.blue.shade700,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://raw.githubusercontent.com/Mulato-Aaron/imagenes1/refs/heads/main/header.jpg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Juegos Destacados",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://raw.githubusercontent.com/Mulato-Aaron/imagenes1/refs/heads/main/descarga.jpg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Ofertas"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: "Biblioteca"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}