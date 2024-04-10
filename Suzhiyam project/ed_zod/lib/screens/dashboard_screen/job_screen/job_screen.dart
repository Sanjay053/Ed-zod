import 'package:ed_zod/screens/dashboard_screen/dashboard_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: const DashboardAppBar(isDashboard: true),
      body: Center(
        child: SizedBox(
          width: 200, // Example width
          height: 50, // Example height
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed('JobDetail');
            },
            child: const Text('clicks'),
          ),
        ),
      ),
    );
  }
}
