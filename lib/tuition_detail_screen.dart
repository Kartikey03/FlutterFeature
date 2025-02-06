import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class TuitionDetailScreen extends StatefulWidget {
  final Map<String, dynamic> tuition;

  const TuitionDetailScreen({super.key, required this.tuition});

  @override
  State<TuitionDetailScreen> createState() => _TuitionDetailScreenState();
}

class _TuitionDetailScreenState extends State<TuitionDetailScreen> {
  // Controller for the carousel (provided by flutter_carousel_widget)
  final CarouselController carouselController = CarouselController();
  // Current page index for the dot indicator
  int activeIndex = 0;

  // Here we use a local list of slides.
  // In a production app you might load these from widget.tuition, for example.
  final List<Slide> slide = [
    Slide(color: "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600"),
    Slide(color: "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600"),
    Slide(color: "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600"),
    Slide(color: "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600"),
    Slide(color: "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600"),
    Slide(color: "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600"),
    Slide(color: "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a Stack or bottomNavigationBar to keep the buttons fixed.
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: Colors.white,
        child: Row(
          children: [
            // "First Free Day" button (Outlined)
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                child: const Text(
                  "First Free Day",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // "Buy Now" button (Elevated)
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Enroll Now",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // Make sure the content above can scroll behind the fixed bottom bar.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel with a dot indicator overlay
            Stack(
              alignment: Alignment.topCenter,
              children: [
                FlutterCarousel(
                  options: FlutterCarouselOptions(
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    slideIndicator: CircularWaveSlideIndicator(),
                    floatingIndicator: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: slide
                      .map((item) => CachedNetworkImage(imageUrl: item.color))
                      .toList(),
                ),
              ],
            ),
            // Details Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tuition Name and Rating
                  Text(
                    widget.tuition["name"]!,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 25),
                      const SizedBox(width: 5),
                      Text(
                        "4.5 (120 Reviews)",
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Fees and Offer
                  Text(
                    "Fees: ${widget.tuition["price"]!}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Offer: ${widget.tuition["offer"]!}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                  const SizedBox(height: 20),
                  // About Tuition Section
                  const Text(
                    "About Tuition",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "This tuition center offers high-quality education with experienced instructors. "
                        "Our curriculum is designed to help students achieve academic success by providing "
                        "personalized attention. Join us to experience a learning environment that fosters growth "
                        "and excellence.",
                    style: TextStyle(fontSize: 16, height: 1.4),
                  ),
                  const SizedBox(height: 24),
                  // Tuition Facilities Section (Additional scrollable content)
                  const Text(
                    "Tuition Facilities",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Here you can add a list or grid of facility features.
                  // This is just a sample list of facilities.
                  FacilityItem(
                    icon: Icons.book,
                    title: "Well-Equipped Library",
                  ),
                  const SizedBox(height: 12),
                  FacilityItem(
                    icon: Icons.computer,
                    title: "Smart Classrooms",
                  ),
                  const SizedBox(height: 12),
                  FacilityItem(
                    icon: Icons.group,
                    title: "Expert Faculty",
                  ),
                  const SizedBox(height: 12),
                  FacilityItem(
                    icon: Icons.wifi,
                    title: "High-Speed Internet",
                  ),
                  const SizedBox(height: 24),
                  // You can add more content here if needed.
                ],
              ),
            ),
            // Extra bottom padding to ensure scrollable content doesn't hide behind fixed buttons.
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

// A simple model class to store the image URL.
class Slide {
  Slide({
    required this.color,
  });
  final String color;
}

// A widget to represent a facility item.
class FacilityItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const FacilityItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue, size: 28),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
