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
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        title: Text('Select Your Age'),
        centerTitle: true,
        backgroundColor: Colors.purple[300],
      ),
      body: BlocProvider(
        create: (context) => _ageCubit,
        child: BlocBuilder(
          bloc: _ageCubit,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: ages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final age = ages[index];
                  return GestureDetector(
                    onTap: () {
                      _ageCubit.selectAge(context, age);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent.shade100,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade300, blurRadius: 6),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '$age',
                        style: widget.setFont(
                          TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          fontSize: 36,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
