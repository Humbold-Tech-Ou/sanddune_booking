import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/widgets/checkin_checkout.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/booking_card.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/custom_review_section.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/faq_section.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/hotel_services_section.dart'
    show HotelServicesSection;
import 'package:sanddune_booking/presentation/widgets/new_desing/house_rules_section.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/image_gallery.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/important_information_section.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/payment_methods_section%206.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/popular_facilities_grid.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/question_section.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/restaurants_secition.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/room_availability_table.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/section_title.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/surroundings_section.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/things_to_consider_section.dart';
import 'package:sanddune_booking/presentation/widgets/room_persons.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool _showCart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 77, 78),
        elevation: 0,
        title: Row(
          children: [
            // Sand Dune Logo
            Image.asset(
              'assets/images/Max-power-10.png',
              height: 40,
              width: 40,
            ),
            const Spacer(),
            // Carrito
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
              tooltip: 'Ver carrito',
              onPressed: () {
                setState(() {
                  _showCart = !_showCart;
                });
              },
            ),
            // Language Selector
            IconButton(
              icon: const Icon(Icons.language, color: Colors.white),
              onPressed: () {},
            ),
            // Currency Selector
            IconButton(
              icon: const Icon(Icons.attach_money, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SelectionArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar Section
                  Container(
                    color: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: Row(
                          children: [
                            Expanded(flex: 2, child: CheckinCheckout()),
                            const SizedBox(width: 8),
                            Expanded(flex: 2, child: RoomPersons()),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                // Acción al confirmar disponibilidad
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: const Text('Confirmar disponibilidad'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Main Content Area
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        // Hotel Name, Rating, Location
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CA Sand Dune Hotel',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 18,
                                      ),
                                      Text(
                                        '8.9 Fabuloso',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleSmall,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '· 275 comentarios',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleSmall,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        '14 Triq il-Bajja s-Sabiħa, BBG1758 Birżebbuġa, Malta – Ubicación excelente – ',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                      Text(
                                        'Mostrar mapa',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                FilledButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_border),
                                  label: const Text('Guardar'),
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Theme.of(
                                      context,
                                    ).colorScheme.primaryContainer,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                FilledButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share),
                                  label: const Text('Compartir'),
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Theme.of(
                                      context,
                                    ).colorScheme.primaryContainer,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Image Gallery
                        ImageGallery(),
                        const SizedBox(height: 24),
                        // Main Content (Two Column Layout)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Hotel Description
                                  Text(
                                    'El CA Sand Dune Hotel está situado en Corralejo, a 200 metros de la playa de Corralejo y a 1,2 km del centro de Corralejo. Este hotel de 4 estrellas cuenta con piscina al aire libre, jardín y terraza. El establecimiento ofrece habitaciones con aire acondicionado, WiFi gratis y baño privado.',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(height: 24),
                                  // Popular Facilities
                                  SectionTitle(text: 'Servicios más populares'),
                                  const SizedBox(height: 8),
                                  PopularFacilitiesGrid(),
                                  const SizedBox(height: 32),
                                  // Availability Section
                                  SectionTitle(text: 'Disponibilidad'),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Introduce tus fechas para ver precios y disponibilidad',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 12),
                                  // Search Bar Section
                                  Container(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 24,
                                    ),
                                    child: Center(
                                      child: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          maxWidth: 1200,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: CheckinCheckout(),
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              flex: 2,
                                              child: RoomPersons(),
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              flex: 1,
                                              child: FilledButton(
                                                onPressed: () {},
                                                style: FilledButton.styleFrom(
                                                  backgroundColor: Theme.of(
                                                    context,
                                                  ).colorScheme.primary,
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        vertical: 18,
                                                      ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          4,
                                                        ),
                                                  ),
                                                ),
                                                child: const Text('Buscar'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 16),
                                  // Botón 'Comprobar disponibilidad' eliminado
                                  const SizedBox(height: 24),
                                  // Room Types
                                  RoomAvailabilityTable(),
                                  const SizedBox(height: 32),
                                  // Customer Reviews
                                  SectionTitle(
                                    text: 'Comentarios de los clientes',
                                  ),
                                  const SizedBox(height: 16),
                                  CustomerReviewsSection(),
                                  const SizedBox(height: 32),
                                  // Questions Section
                                  SectionTitle(
                                    text: 'Preguntas de otras personas',
                                  ),
                                  const SizedBox(height: 16),
                                  QuestionsSection(),
                                  const SizedBox(height: 32),
                                  // Hotel Surroundings
                                  SectionTitle(text: 'Alrededores del hotel'),
                                  const SizedBox(height: 16),
                                  SurroundingsSection(),
                                  const SizedBox(height: 32),
                                  // Restaurants
                                  SectionTitle(text: 'Restaurantes'),
                                  const SizedBox(height: 16),
                                  RestaurantsSection(),
                                  const SizedBox(height: 32),
                                  // Hotel Services
                                  SectionTitle(
                                    text: 'Servicios de CA Sand Dune Hotel',
                                  ),
                                  const SizedBox(height: 16),
                                  HotelServicesSection(),
                                  const SizedBox(height: 32),
                                  // House Rules
                                  SectionTitle(text: 'Normas de la casa'),
                                  const SizedBox(height: 16),
                                  HouseRulesSection(),
                                  const SizedBox(height: 32),
                                  // Important Information
                                  SectionTitle(text: 'Información importante'),
                                  const SizedBox(height: 16),
                                  ImportantInformationSection(),
                                  const SizedBox(height: 32),
                                  // Payment Methods
                                  SectionTitle(
                                    text: 'Métodos de pago aceptados',
                                  ),
                                  const SizedBox(height: 16),
                                  PaymentMethodsSection(),
                                  const SizedBox(height: 32),
                                  // Things to Consider
                                  SectionTitle(text: 'A tener en cuenta'),
                                  const SizedBox(height: 16),
                                  ThingsToConsiderSection(),
                                  const SizedBox(height: 32),
                                  // FAQ
                                  SectionTitle(
                                    text:
                                        'Preguntas frecuentes sobre CA Sand Dune Hotel',
                                  ),
                                  const SizedBox(height: 16),
                                  FAQSection(),
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),
                            // Booking Card (Right Side)
                            Expanded(flex: 1, child: BookingCard()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Footer
              // Footer eliminado
            ],
          ),
        ),
      ),
      // Carrito flotante
      if (_showCart)
        Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          child: Container(
            width: 350,
            color: Colors.white,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Carrito', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _showCart = false;
                        });
                      },
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 16),
                const Text('Aquí aparecerán los productos agregados al carrito.'),
                // Puedes agregar aquí la lista de habitaciones seleccionadas, etc.
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}
