import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/base_widget.dart';
import '../view_model/science_cubit.dart';
import '../view_model/science_state.dart';

class ScienceScreen extends BaseWidget {
  ScienceScreen({Key? key}) : super(key: key);

  @override
  State<ScienceScreen> createState() => _ScienceScreenState();
}

class _ScienceScreenState extends State<ScienceScreen> {
  final ScienceCubit _scienceCubit = ScienceCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _scienceCubit,
      child: Scaffold(
        appBar: AppBar(title: Text('Learn Science'), backgroundColor: Colors.blue),
        body: Center(
          child: Text(
            'Science content coming soon!',
            style: widget.setFont(TextStyle(fontSize: 24)),
          ),
        ),
      ),
    );
  }
}
