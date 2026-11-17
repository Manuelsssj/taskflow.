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