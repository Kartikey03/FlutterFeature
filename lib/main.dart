import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newflutter/post_request.dart';
import 'package:newflutter/tuition_detail_screen.dart';
import 'package:http/http.dart' as http;

import 'QR_file.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QRCodeDisplay(message: 'Flutter is Amazing',),
    );
  }
}

class TListScreen extends StatelessWidget {
  // Updated to include multiple images for each tuition
  final List<Map<String, dynamic>> tuitions = [
    {
      "images": [
        "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/4145153/pexels-photo-4145153.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/4145190/pexels-photo-4145190.jpeg?auto=compress&cs=tinysrgb&w=600",
      ],
      "name": "Hindi Tuition",
      "price": "₹999/Month",
      "offer": "First Day Free"
    },
    {
      "images": [
        "https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/4145153/pexels-photo-4145153.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/4145190/pexels-photo-4145190.jpeg?auto=compress&cs=tinysrgb&w=600",
      ],
      "name": "Maths Tuition",
      "price": "₹1199/Month",
      "offer": "First day free"
    }
  ];

  TListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Popular Nearby Tuitions")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Popular Nearby Tuitions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tuitions.length,
                itemBuilder: (context, index) {
                  return TuitionCard(tuitions[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TuitionCard extends StatelessWidget {
  final Map<String, dynamic> tuition;

  const TuitionCard(this.tuition, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TuitionDetailScreen(tuition: tuition),
          ),
        );
      },
      child: SizedBox(
        width: 300,
        height: 500,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: tuition["name"]!,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: CachedNetworkImage(
                    imageUrl: tuition["images"][0],
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tuition["name"]!,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      tuition["offer"]!,
                      style: TextStyle(fontSize: 12, color: Colors.indigo),
                    ),
                    SizedBox(height: 5),
                    Text(
                      tuition["price"]!,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PostsWidget(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Text("Free Day"),
                          ),
                        ),
                        SizedBox(width: 8),
                        Flexible(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TuitionDetailScreen(tuition: tuition),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Text("Buy Now"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}