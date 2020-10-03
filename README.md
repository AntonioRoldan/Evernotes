# everpobre

## Error en la versión anterior

Todo el problema se debía que en la clase `_NoteSliverState` le estaba pasando una clave
(`Key`) que no era única, al contrario de lo que pensaba.

Cuando se reciclan Widgets, como es el caso de una tabla, la clave que identifica al Widget ha
de ser única, para evitar que el Widget sea reutilizado donde no se debe. Algo parecido a lo que ocurre
en iOS también con el `cellId`.

En nuestro caso concreto que ocurría era lo siguiente:

1. Se eliminaba una nota del modelo, dentro de `onDismissed`, lo cual también elimina la vista (`NoteSliver` así como su estado.)
1. El modelo avisaba al Widget de Notas (`NotesListView`), que procede a llamar a su función `build`, lo cual reconstruye los `NoteSliver`s, reciclando en la medida de lo posible.
1. Al reciclar, Flutter se encontraba con una `NoteSliver` que tiene **la misma `Key` que la qu efue eliminada** (por que la `Key` proporcionada no era única). Daba por hehco que ésta era la que tendría que haber sido eliminada, y se arma la de Dios.

Al modificar el código de `build` de `_NoteSliverState` usando un `UniqueKey`, se resuelve el problema:

```
@override
  Widget build(BuildContext context) {
    DateFormat fmt = DateFormat("yyyy-mm-dd");

    return Dismissible(
      key: UniqueKey(),
```

## PRACTICA

Consta de dos partes, la primera obligatoria, y la segunda opcional (para aquellos que quieran seguir con Flutter).

### OBLIGATORIO

1. Repasa el código actual de Everpobre y asegúrate de entender lo que hace.
1. Crea una clase `Notebooks` en el dominio. Representa una lista de `Notebook`. 
1. Añádele un construictor que carga datos de pruebas: varios `Notebooks` que contienen a varias `Notes`.
1. Crea un Widget de tipo `ListView`  para mostrarlos.
1. Se debe de poder crear nuevos `Notebooks` mediante un `FloatingActionButton` y eliminarlos mediante un `Dismissable`.
1. Crea dos rutas que permiten navegar desde el Grid de Notebooks a la lista de Notes que contiene dicho `Notebook`. 


### OPCIONAL

1. Crea un Widget de detalle de Note que permita editar su contenido.
1. Mira la documentación de `EditableText` para ver como implementar texto editable (es muy similar a iOS).