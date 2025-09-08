import 'package:flutter/material.dart';

class HotelServicesSection extends StatelessWidget {
  const HotelServicesSection({super.key});

  Widget buildCategory({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: Colors.black87),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }

  Widget buildSubList(List<String> items, {List<String>? paidItems}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((e) {
          final isPaid = paidItems != null && paidItems.contains(e);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              children: [
                const SizedBox(width: 8),
                Expanded(child: Text(e, style: const TextStyle(fontSize: 14))),
                if (isPaid)
                  const Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      'De pago',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Listas completas según la foto y tu lista
    final idealEstancia = [
      'Baño privado',
      'WiFi gratis',
      'Aire acondicionado',
      'TV de pantalla plana',
      'Parking',
      'Parking gratis',
      'Restaurante',
      'Habitaciones familiares',
      'Traslado aeropuerto',
      'Adaptado personas de movilidad reducida',
    ];
    final bano = [
      'Papel higiénico',
      'Toallas',
      'Bañera o ducha',
      'Baño privado',
      'WC',
      'Artículos de aseo gratis',
      'Ducha',
    ];
    final habitacion = ['Ropa de cama', 'Armario'];
    final exteriores = ['Situado frente a la playa'];
    final cocina = ['Hervidor eléctrico'];
    final instalacionesHabitacion = ['Perchero'];
    final actividades = ['Alquiler de bicicletas', 'Playa'];
    final actividadesPagas = ['Alquiler de bicicletas'];
    final zonaEstar = ['Escritorio'];
    final equipamiento = [
      'TV de pantalla plana',
      'Canales vía satélite',
      'Teléfono',
      'TV',
    ];
    final comidaBebida = [
      'Snack-bar',
      'Bar',
      'Restaurante',
      'Tetera / cafetera',
    ];
    final internet = [
      'Hay conexión a internet Wi-Fi disponible en todo el establecimiento. Gratis.',
    ];
    final aparcamiento = [
      'Hay parking gratis público en las inmediaciones. No es necesario reservar.',
      'Parking en la calle',
    ];
    final recepcion = [
      'Proporciona factura',
      'Registro de entrada / salida privado',
      'Servicio de conserjería',
      'Cajero automático en el hotel',
      'Guardaequipaje',
      'Cambio de moneda',
      'Registro de entrada y salida exprés',
      'Recepción 24 horas',
    ];
    final limpieza = [
      'Servicio de limpieza diario',
      'Servicio de planchado',
      'Servicio de lavandería',
    ];
    final limpiezaPagas = ['Servicio de planchado', 'Servicio de lavandería'];
    final negocios = ['Fax / fotocopiadora'];
    final seguridad = [
      'Extintores',
      'Cámaras de seguridad fuera del alojamiento',
      'Cámaras de seguridad en las zonas comunitarias',
      'Detectores de humo',
      'Alarma de seguridad',
      'Tarjeta de acceso',
      'Seguridad 24 horas',
      'Caja fuerte',
    ];
    final general = [
      'Servicio de traslado',
      'Zona TV / salón de uso compartido',
      'Máquina expendedora (aperitivos)',
      'Máquina expendedora (bebidas)',
      'Zona de fumadores',
      'Aire acondicionado',
      'Prohibido fumar en todo el alojamiento',
      'Servicio de despertador',
      'Suelo de baldosa / mármol',
      'Calefacción',
      'Insonorización',
      'Habitaciones insonorizadas',
      'Ascensor',
      'Habitaciones familiares',
      'Utensilios de planchado',
      'Adaptado personas de movilidad reducida',
      'Traslado aeropuerto',
      'Habitaciones sin humo',
      'Plancha para ropa',
    ];
    final generalPagas = ['Servicio de traslado', 'Traslado aeropuerto'];
    final accesibilidad = [
      'Cuerda de emergencia en el baño',
      'Lavamanos más bajo',
      'WC elevado',
      'WC con barras de apoyo',
      'Adaptado para sillas de ruedas',
    ];
    final idiomas = [
      'Alemán',
      'Inglés',
      'Croata',
      'Italiano',
      'Ruso',
      'Serbio',
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 40,
          runSpacing: 24,
          children: [
            SizedBox(
              width: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildCategory(
                    title: 'Ideal para tu estancia',
                    icon: Icons.hotel,
                    children: [buildSubList(idealEstancia)],
                  ),
                  buildCategory(
                    title: 'Baño',
                    icon: Icons.bathtub,
                    children: [buildSubList(bano)],
                  ),
                  buildCategory(
                    title: 'Habitación',
                    icon: Icons.bed,
                    children: [buildSubList(habitacion)],
                  ),
                  buildCategory(
                    title: 'Exteriores',
                    icon: Icons.beach_access,
                    children: [buildSubList(exteriores)],
                  ),
                  buildCategory(
                    title: 'Cocina',
                    icon: Icons.kitchen,
                    children: [buildSubList(cocina)],
                  ),
                  buildCategory(
                    title: 'Instalaciones de la habitación',
                    icon: Icons.chair,
                    children: [buildSubList(instalacionesHabitacion)],
                  ),
                  buildCategory(
                    title: 'Actividades',
                    icon: Icons.directions_bike,
                    children: [
                      buildSubList(actividades, paidItems: actividadesPagas),
                    ],
                  ),
                  buildCategory(
                    title: 'Zona de estar',
                    icon: Icons.event_seat,
                    children: [buildSubList(zonaEstar)],
                  ),
                  buildCategory(
                    title: 'Equipamiento audiovisual y tecnológico',
                    icon: Icons.tv,
                    children: [buildSubList(equipamiento)],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildCategory(
                    title: 'Comida y bebida',
                    icon: Icons.restaurant,
                    children: [buildSubList(comidaBebida)],
                  ),
                  buildCategory(
                    title: 'Internet',
                    icon: Icons.wifi,
                    children: [buildSubList(internet)],
                  ),
                  buildCategory(
                    title: 'Aparcamiento',
                    icon: Icons.local_parking,
                    children: [buildSubList(aparcamiento)],
                  ),
                  buildCategory(
                    title: 'Servicios de recepción',
                    icon: Icons.room_service,
                    children: [buildSubList(recepcion)],
                  ),
                  buildCategory(
                    title: 'Servicios de limpieza',
                    icon: Icons.cleaning_services,
                    children: [
                      buildSubList(limpieza, paidItems: limpiezaPagas),
                    ],
                  ),
                  buildCategory(
                    title: 'Instalaciones de negocios',
                    icon: Icons.business_center,
                    children: [buildSubList(negocios)],
                  ),
                  buildCategory(
                    title: 'Seguridad',
                    icon: Icons.security,
                    children: [buildSubList(seguridad)],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildCategory(
                    title: 'General',
                    icon: Icons.apps,
                    children: [buildSubList(general, paidItems: generalPagas)],
                  ),
                  buildCategory(
                    title: 'Accesibilidad',
                    icon: Icons.accessible,
                    children: [buildSubList(accesibilidad)],
                  ),
                  buildCategory(
                    title: 'Idiomas que se hablan',
                    icon: Icons.language,
                    children: [buildSubList(idiomas)],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
