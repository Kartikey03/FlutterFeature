// main.dart
import 'package:flutter/material.dart';

class BatchBooking extends StatelessWidget {
  const BatchBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ClassScheduleScreen(),
    );
  }
}

// class_schedule_screen.dart
class ClassScheduleScreen extends StatefulWidget {
  const ClassScheduleScreen({super.key});

  @override
  State<ClassScheduleScreen> createState() => _ClassScheduleScreenState();
}

class _ClassScheduleScreenState extends State<ClassScheduleScreen> {
  final List<Map<String, dynamic>> classes = [
    {
      'name': 'Mathematics',
      'teacher': 'Dr. Smith',
      'room': '101',
      'time': '9:00 AM - 10:30 AM',
      'subjects': ['Algebra', 'Calculus', 'Geometry']
    },
    {
      'name': 'Physics',
      'teacher': 'Prof. Johnson',
      'room': '202',
      'time': '11:00 AM - 12:30 PM',
      'subjects': ['Mechanics', 'Thermodynamics', 'Optics']
    },
    {
      'name': 'Hindi',
      'teacher': 'Prof. Andrew',
      'room': '302',
      'time': '10:30 AM - 11:00 AM',
      'subjects': ['Mechanics', 'Thermodynamics', 'Optics']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Schedule'),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.person),
            onPressed: () => _showTeachersDialog(context),
            label: Text("View Teachers"),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index) {
          final classData = classes[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(classData['name']),
              subtitle: Text(
                  '${classData['time']}\nRoom: ${classData['room']}'),
              trailing: ElevatedButton(
                onPressed: () => _showSubjectsDialog(context, classData),
                child: const Text('View Details'),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.edit),
      ),
    );
  }

  void _showTeachersDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Teachers for this Batch'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: classes
                  .map((c) =>
                  ListTile(
                    title: Text(c['teacher']),
                    subtitle: Text(c['name']),
                  ))
                  .toList(),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
    );
  }

  void _showSubjectsDialog(BuildContext context,
      Map<String, dynamic> classData) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text('${classData['name']} Topics'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: (classData['subjects'] as List)
                  .map((subject) => ListTile(title: Text(subject)))
                  .toList(),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
    );
  }
}