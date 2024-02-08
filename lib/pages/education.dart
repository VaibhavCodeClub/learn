import 'package:learn/widgets/drawer.dart';
import 'package:flutter/material.dart';

// Define a class to represent a School
class School {
  final String name;
  final String location;
  final String degree;
  final String major;
  final String year;

  School({
    required this.name,
    required this.location,
    required this.degree,
    required this.major,
    required this.year,
  });
}

class EducationPage extends StatelessWidget {
  final List<School> schools = [
    School(
      name: "Swami Vivekanand Vidya Mandir, Kaij",
      location: "Kaij, 431123",
      degree: "Primary and Secondary Education",
      major: "NA",
      year: "2009 - 2019",
    ),
    School(
      name: "Puranmal Lahoti Government Polytechnic",
      location: "Latur, 413531",
      degree: "Diploma",
      major: "Computer Engineering",
      year: "2019 - 2022",
    ),
    School(
      name: "Sinhgd College of Engineering",
      location: "Pune, 411041",
      degree: "Bachelor of Engineering",
      major: "Informtion Technology",
      year: "2022 - 2025",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education'),
      ),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: schools.length,
          itemBuilder: (context, index) {
            final school = schools[index];
            return ListTile(
              title: Text(
                school.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Location: ${school.location}"),
                  Text("Degree: ${school.degree}"),
                  Text("Major: ${school.major}"),
                  Text("Year: ${school.year}"),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 1,
              color: Colors.grey,
            );
          },
        ),
      ),
              drawer: const MyDrawer(), 

    );
  }
}
