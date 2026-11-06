import 'package:flutter_test/flutter_test.dart';
import 'package:taskflow/main.dart';

void main() {
  testWidgets('El panel permite agregar y completar tareas', (tester) async {
    await tester.pumpWidget(const TaskFlowApp());

    expect(find.text('Tareas pendientes: 3'), findsOneWidget);

    await tester.tap(find.text('Agregar tarea'));
    await tester.pump();
    expect(find.text('Tareas pendientes: 4'), findsOneWidget);

    await tester.tap(find.text('Completar una tarea'));
    await tester.pump();
    expect(find.text('Tareas pendientes: 3'), findsOneWidget);
  });
}
