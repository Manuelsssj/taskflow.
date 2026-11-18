import '../domain/task.dart';
import 'task_repository.dart';

class LocalTaskRepository implements TaskRepository {
  final List<Task> _tasks = [
    const Task(
      id: 1,
      title: 'Preparar la pantalla de detalle',
      description: 'Definir los datos que se mostrarán al abrir una tarea',
      priority: 'Alta',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 2,
      title: 'Revisar el código de TaskFlow',
      description: 'Comprobar que flutter analyze termina sin avisos',
      priority: 'Alta',
      isCompleted: true,
      userId: 1,
    ),
    const Task(
      id: 3,
      title: 'Capturar la lista de tareas',
      description: 'Guardar evidencia del listado y de una tarea completada',
      priority: 'Media',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 4,
      title: 'Revisar la lista en una ventana pequeña',
      description: 'Comprobar que se puede llegar a la última tarjeta',
      priority: 'Media',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 5,
      title: 'Subir el avance a GitHub',
      description: 'Registrar el modelo y el alcance de TaskFlow',
      priority: 'Baja',
      isCompleted: false,
      userId: 1,
    ),
  ];

  @override
  List<Task> getTasks() => List.unmodifiable(_tasks);

  @override
  void save(Task task) {
    final index = _tasks.indexWhere((item) => item.id == task.id);
    if (index == -1) return;
    _tasks[index] = task;
  }
}
