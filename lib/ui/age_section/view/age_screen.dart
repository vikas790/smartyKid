import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/base/base_widget.dart';
import '../../core/base/api_render_state.dart';
import '../view_model/age_cubit.dart';
import '../view_model/age_state.dart';

class AgeScreen extends BaseWidget {
  AgeScreen({Key? key}) : super(key: key);

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  final AgeCubit _ageCubit = AgeCubit();
  final List<int> ages = [2, 3, 4, 5, 6, 7, 8];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Static Background Color - light blue gradient
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
                  child: Text(
                    'Select Your Age',
                    style: widget.setFont(
                      widget.poppinsTightBold700,
                      fontSize: 28,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Expanded(
                  child: BlocProvider(
                    create: (context) => _ageCubit,
                    child: BlocBuilder(
                      bloc: _ageCubit,
                      builder: (context, state) {
                        return GridView.builder(
                          padding: const EdgeInsets.all(16),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 1, // Makes cards square (200x200)
                          ),
                          itemCount: ages.length,
                          itemBuilder: (context, index) {
                            final age = ages[index];
                            // Color palette similar to the uploaded image
                            final colors = [
                              Color(0xFFFFB74D), // Orange
                              Color(0xFF81C784), // Green
                              Color(0xFF64B5F6), // Blue
                              Color(0xFFBA68C8), // Purple
                              Color(0xFFFF8A65), // Coral
                              Color(0xFF4DD0E1), // Cyan
                              Color(0xFFFFD54F), // Yellow
                            ];
                            final cardColor = colors[index % colors.length];
                            
                            return GestureDetector(
                              onTap: () {
                                _ageCubit.selectAge(context, age);
                              },
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: cardColor.withOpacity(0.9),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Large age number
                                      Text(
                                        '$age',
                                        style: widget.setFont(
                                          widget.poppinsTightBold700,
                                          fontSize: 64,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      // "Years Old" text
                                      Text(
                                        'YEARS OLD',
                                        textAlign: TextAlign.center,
                                        style: widget.setFont(
                                          widget.poppinsTightSemiBold600,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
