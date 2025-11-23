import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/base_widget.dart';
import '../view_model/subject_cubit.dart';
import '../view_model/subject_state.dart';

class SubjectScreen extends BaseWidget {
  final int age;
  SubjectScreen({required this.age, Key? key}) : super(key: key);

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  final SubjectCubit _subjectCubit = SubjectCubit();

  // 👇 Added dynamic type to support mixed values (String, Color)
  final List<Map<String, dynamic>> subjects = [
    {
      'name': 'English',
      'iconPath': 'assets/icons/english.png',
      'color': Colors.redAccent,
    },
    {
      'name': 'Math',
      'iconPath': 'assets/icons/math.png',
      'color': Colors.green,
    },
    {
      'name': 'Science',
      'iconPath': 'assets/icons/science.png',
      'color': Colors.blueAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('Subjects for Age ${widget.age}'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: BlocProvider(
        create: (context) => _subjectCubit,
        child: ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            var subject = subjects[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: subject["color"] as Color, // ✅ Cast to Color
                  child: ClipOval(
                    child: Image.asset(
                      subject['iconPath'] as String, // ✅ Cast to String
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                title: Text(
                  subject['name'] as String,
                  style: widget.setFont(
                    TextStyle(fontFamily: 'ComicNeue'),
                    fontSize: 24,
                  ),
                ),
                onTap: () {
                  _subjectCubit.navigateToSubject(context, subject['name'] as String);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
