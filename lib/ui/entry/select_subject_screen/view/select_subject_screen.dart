import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartykids/ui/core/base/base_widget.dart';
import '../view_model/select_subject_cubit.dart';
import '../view_model/select_subject_state.dart';

class SelectSubjectScreen extends BaseWidget {
  final int age;
  SelectSubjectScreen({required this.age, Key? key}) : super(key: key);

  @override
  State<SelectSubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SelectSubjectScreen> {
  final SelectSubjectCubit _subjectCubit = SelectSubjectCubit();

  final List<Map<String, dynamic>> subjects = [
    {
      'name': 'English',
      'iconPath': 'assets/drawables/icons/english.png',
      'color': Color(0xFFFF8A65), // Coral
      'emoji': '📚',
    },
    {
      'name': 'Math',
      'iconPath': 'assets/drawables/icons/math.png',
      'color': Color(0xFF81C784), // Green
      'emoji': '🔢',
    },
    {
      'name': 'Science',
      'iconPath': 'assets/drawables/icons/science.png',
      'color': Color(0xFF64B5F6), // Blue
      'emoji': '🔬',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Static Background Color - light gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFB3E5FC),
                  Color(0xFFE1F5FE),
                ],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      Text(
                        'Select Subject',
                        style: widget.setFont(
                          widget.poppinsTightBold700,
                          fontSize: 28,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Age ${widget.age}',
                        style: widget.setFont(
                          widget.poppinsTightMedium500,
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: BlocProvider(
                    create: (context) => _subjectCubit,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1, // Square cards
                      ),
                      itemCount: subjects.length,
                      itemBuilder: (context, index) {
                        final subject = subjects[index];
                        final color = subject['color'] as Color;
                        
                        return GestureDetector(
                          onTap: () {
                            _subjectCubit.navigateToSubject(
                              context,
                              subject['name'] as String,
                            );
                          },
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: color.withOpacity(0.9),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Emoji icon
                                  Text(
                                    subject['emoji'] as String,
                                    style: TextStyle(fontSize: 50),
                                  ),
                                  SizedBox(height: 8),
                                  // Subject name
                                  Text(
                                    subject['name'] as String,
                                    textAlign: TextAlign.center,
                                    style: widget.setFont(
                                      widget.poppinsTightBold700,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
