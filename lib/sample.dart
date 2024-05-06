// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// // Define your bloc class
// class MyBloc extends Cubit<int> {
//   MyBloc(int initialValue) : super(initialValue);

//   void increment() => emit(state + 1);
// }

// // Define your widgets
// class FirstWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final myBloc = MyBloc(0); // Create separate bloc instances
//     return BlocProvider.value(
//       value: myBloc, // Provide the bloc instance
//       child: BlocBuilder<MyBloc, int>(
//         builder: (context, state) {
//           return ElevatedButton(
//             onPressed: () {
//               BlocProvider.of<MyBloc>(context).increment();
//             },
//             child: Text('Increment in FirstWidget: $state'),
//           );
//         },
//       ),
//     );
//   }
// }

// class SecondWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final myBloc = MyBloc(10); // Create separate bloc instances
//     return BlocProvider.value(
//       value: myBloc, // Provide the bloc instance
//       child: BlocBuilder<MyBloc, int>(
//         builder: (context, state) {
//           return ElevatedButton(
//             onPressed: () {
//               BlocProvider.of<MyBloc>(context).increment();
//             },
//             child: Text('Increment in SecondWidget: $state'),
//           );
//         },
//       ),
//     );
//   }
// }

// // Main app
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//             title: Text('Multiple Widgets with Separate Bloc Instances')),
//         body: Column(
//           children: [
//             FirstWidget(),
//             SecondWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }
