// main.dart
import 'package:flutter/material.dart';
import 'package:newflutter/batch_booking.dart';


class TuitionApp extends StatelessWidget {
  const TuitionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tuition Classes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ClassListScreen(),
    );
  }
}

class ClassInfo {
  final String className;
  final String description;
  final List<String> subjects;
  final String timings;
  final String fees;

  ClassInfo({
    required this.className,
    required this.description,
    required this.subjects,
    required this.timings,
    required this.fees,
  });
}

class ClassListScreen extends StatelessWidget {
  final List<ClassInfo> classes = [
    ClassInfo(
      className: 'Class 1',
      description: 'Foundation building year with focus on basics',
      subjects: ['English', 'Mathematics', 'Environmental Science'],
      timings: 'Mon-Fri: 3:00 PM - 4:30 PM',
      fees: '₹2000/month',
    ),
    ClassInfo(
      className: 'Class 2',
      description: 'Strengthening fundamental concepts',
      subjects: ['English', 'Mathematics', 'Environmental Science'],
      timings: 'Mon-Fri: 4:30 PM - 6:00 PM',
      fees: '₹2200/month',
    ),
    ClassInfo(
      className: 'Class 3',
      description: 'Strengthening fundamental concepts',
      subjects: ['English', 'Mathematics', 'Environmental Science'],
      timings: 'Mon-Fri: 4:30 PM - 6:00 PM',
      fees: '₹1200/month',
    ),
    ClassInfo(
      className: 'Class 4',
      description: 'Strengthening fundamental concepts',
      subjects: ['English', 'Mathematics', 'Environmental Science'],
      timings: 'Mon-Fri: 4:30 PM - 6:00 PM',
      fees: '₹2600/month',
    ),
    // Add similar entries for classes 3-12
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tuition Classes'),
      ),
      body: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text('Class ${index + 1}'),
              subtitle: Text('Click for more details'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BatchBooking(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

