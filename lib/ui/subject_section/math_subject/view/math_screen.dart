import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/base_widget.dart';
import '../view_model/math_cubit.dart';
import '../view_model/math_state.dart';

class MathScreen extends BaseWidget {
  MathScreen({Key? key}) : super(key: key);

  @override
  State<MathScreen> createState() => _MathScreenState();
}

class _MathScreenState extends State<MathScreen> {
  final MathCubit _mathCubit = MathCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _mathCubit,
      child: Scaffold(
        appBar: AppBar(title: Text('Learn Math'), backgroundColor: Colors.green),
        body: Center(
          child: Text(
            'Math content coming soon!',
            style: widget.setFont(TextStyle(fontSize: 24)),
          ),
        ),
      ),
    );
  }
}
