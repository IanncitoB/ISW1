# Soluciones

### Solución simple: ```MarsRoverSolucion.image```

Adaptamos las variables internas "position" y "head" para que, cada vez que se modifiquen, notifiquen a su colección de interesados (ActiveVariable).

En este modelo, tenemos un MarsRovers que tiene variables observables y estas al momento de actualizarse, notifican a cada observador. El MarsRovers NO notifica nada, sólamente se encarga de agregarle los observadores a su correspondiente variable (attach).

Observación: Las variables observables no saben qué tipo de variable son, por lo que no saben qué mensaje de actualización enviar. 

### Solución más general: ```MarsRoverSolucionFachera.image```

En vez de que una ActiveVariable solamente "notifique el cambio de variable", evalúe un bloque en el contexto de ejecución de su observador.

De esta manera, si tenemos 2 instancias de un mismo observador, podemos "customizar" su notificación. Por ejemplo:

|Instancia  | Bloque                          | Resultado             |
|-----------|---------------------------------|-----------------------|
|window1    |[:newValue \| value asString]    | 'East'                |
|window2    |[:newValue \| value prettyPrint] | 'Apuntando al Este'   |

Ambos observadores son instancias de la clase MarsRoverWindow y observan el heading. Pero cada vez que se actualiza, muestran distintas cosas.