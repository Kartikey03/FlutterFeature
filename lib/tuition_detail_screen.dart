import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TuitionDetailScreen extends StatefulWidget {
  final Map<String, dynamic> tuition;

  const TuitionDetailScreen({super.key, required this.tuition});

  @override
  State<TuitionDetailScreen> createState() => _TuitionDetailScreenState();
}


class _TuitionDetailScreenState extends State<TuitionDetailScreen> {
  // Controller for the carousel
  final CarouselController carouselController = CarouselController();
  // Current page index for the dot indicator
  int activeIndex = 0;


  final List<Slide> slide = [
    Slide(color: "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600"),
    Slide(color: "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600"),
    Slide(color: "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600"),
    Slide(color: "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600"),
    Slide(color: "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600"),
    Slide(color: "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600"),
    Slide(color: "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600"),

  ] ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tuition["name"]!),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                FlutterCarousel(
                  options: FlutterCarouselOptions(
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    slideIndicator: CircularWaveSlideIndicator(),
                    floatingIndicator: false,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: slide.map((item) => CachedNetworkImage(imageUrl: item.color)).toList(),
                ),
                // Dot indicators
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.tuition["name"]!,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 25),
                      const SizedBox(width: 5),
                      Text("4.5 (120 Reviews)",
                          style:
                          TextStyle(fontSize: 16, color: Colors.grey[700])),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Fees: ${widget.tuition["price"]!}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Offer: ${widget.tuition["offer"]!}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: const Text("Enroll Now"),
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

class Slide {
  Slide({
    required this.color,
  });

  final String color;
}