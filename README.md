# taskflow

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Alcance de TaskFlow

Problema: necesito organizar actividades académicas y saber cuáles faltan.
Usuario objetivo: estudiante que planifica entregas semanales.

Las cinco tareas actuales del proyecto son preparar la pantalla de detalle,
revisar el código de TaskFlow, capturar la lista de tareas, revisar la lista
en una ventana pequeña y subir el avance a GitHub.

### Historias de usuario y criterios de aceptación

1. Como estudiante, quiero listar mis tareas para ver qué debo hacer.
   Criterio: la lista muestra título, prioridad y estado de cada tarea.

2. Como estudiante, quiero abrir una tarea para leer su descripción.
   Criterio: al tocar una tarjeta aparece el detalle de la tarea elegida.

3. Como estudiante, quiero crear una tarea para registrar un pendiente.
   Criterio: el formulario guarda una tarea válida y la lista la muestra.

4. Como estudiante, quiero editar una tarea para corregir sus datos.
   Criterio: los cambios guardados aparecen en lista y detalle.

5. Como estudiante, quiero eliminar una tarea terminada para limpiar la lista.
   Criterio: después de confirmar, la tarea desaparece de la lista.

### Modelo de datos

Task contiene las siguientes propiedades.

| Propiedad | Tipo | Significado |
|---|---|---|
| id | int | Identificador único de la tarea. |
| title | String | Título de la tarea. |
| description | String | Descripción completa. |
| priority | String | Prioridad Alta, Media o Baja. |
| isCompleted | bool | Indica si la tarea está completada. |
| userId | int | Identificador del usuario de prueba. |

Task.fromJson convierte un mapa con estas propiedades en un objeto Task.

### Pantallas previstas

- Lista. Tarjetas de tareas y acción para crear.
- Detalle. Información completa y futuras acciones de editar o eliminar.
- Formulario. Campos de título, descripción y prioridad.

### Requisitos no funcionales

- La navegación debe tener textos comprensibles.
- Un id inexistente debe mostrar un mensaje en vez de cerrar la app.

### Contrato de API que necesitaremos

| Método | Ruta | Operación |
|---|---|---|
| GET | /tasks | Listar tareas. |
| GET | /tasks/:id | Consultar el detalle. |
| POST | /tasks | Crear una tarea. |
| PATCH | /tasks/:id | Actualizar una tarea. |
| DELETE | /tasks/:id | Eliminar una tarea. |

La API concreta se elegirá después. Estas rutas describen las operaciones
previstas para el proyecto.

Las historias de crear, editar y eliminar tareas se implementarán
en sesiones posteriores.

## API de tareas

TaskFlow consulta tareas de JSONPlaceholder mediante Dio.

- Método HTTP: GET.
- URL exacta: https://jsonplaceholder.typicode.com/todos?userId=2
- Parámetro de consulta: userId=2, para obtener las tareas del usuario 2.
- El valor elegido está definido en la constante userId de TaskApiService.

### Campos recibidos

La API entrega userId, id, title y completed.
Task.fromJson convierte completed en isCompleted.

### Valores predeterminados

La API no entrega description ni priority. TaskFlow completa estos campos con:

- description: "Sin descripción (API)".
- priority: "Sin prioridad (API)".

Estos valores los agrega la aplicación y no proceden del servidor.

### Cambios de estado

Marcar una tarea como completada o pendiente solo modifica la copia en memoria.
No se envía una actualización al servidor. Al reiniciar la aplicación,
se consultan nuevamente los datos originales de la API.

### Recorrido de los datos

TaskApiService conoce la URL y realiza la consulta HTTP con Dio.
Task.fromJson convierte cada objeto JSON en una Task.
RemoteTaskRepository obtiene las tareas del Service.
TasksViewModel espera el resultado y llama a notifyListeners para actualizar
las pantallas mediante Provider.

## Estados de la lista de tareas

TaskFlow distingue cuatro estados:

- Carga: muestra un indicador y el mensaje "Cargando tus tareas...".
  Mientras carga, el botón superior de actualización está deshabilitado.
- Éxito: muestra las tareas remotas y permite abrir su detalle.
- Vacío: muestra "No hay tareas para el usuario seleccionado."
  y el botón Actualizar.
- Error: muestra un mensaje comprensible y el botón Reintentar.

### Cómo comprobar cada estado

1. Éxito: con internet y userId=2, cargar el listado y abrir una tarea.
2. Error: desconectar internet y pulsar Actualizar tareas.
3. Reintento: recuperar internet y pulsar Reintentar.
   La lista vuelve sin reiniciar la aplicación.
4. Vacío: cambiar temporalmente userId a 9999 en TaskApiService
   y reiniciar la aplicación.
5. Carga: pulsar Actualizar tareas y observar el indicador.
   Si la respuesta es muy rápida, limitar temporalmente la red
   desde las herramientas de desarrollo de Chrome.

Al finalizar las pruebas, restaurar userId=2 y quitar la limitación de red.

Actualizar vuelve a consultar el servidor y puede reemplazar los cambios
de estado realizados localmente.