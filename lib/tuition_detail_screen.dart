import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TuitionDetailScreen extends StatelessWidget {
  final Map<String, String> tuition;

  const TuitionDetailScreen({super.key, required this.tuition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tuition["name"]!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: tuition["name"]!,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                    bottom: Radius.circular(15)
                  ),
                  child: CachedNetworkImage(
                    imageUrl: tuition["image"]!,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                tuition["name"]!,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 25),
                  SizedBox(width: 5),
                  Text("4.5 (120 Reviews)", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Fees: ${tuition["price"]!}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.green),
              ),
              SizedBox(height: 10),
              Text(
                "Offer: ${tuition["offer"]!}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text("Enroll Now"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
