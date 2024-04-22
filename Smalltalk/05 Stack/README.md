# Consigna + Soluciones

El ejercicio tiene dos partes:

## Parte a) 

El objetivo de la primera parte es encarar un primer modelado de un problema y seguir ejercitando reemplazar if por polimorfismo, en particular implementando un Stack.

Hay que hacer pasar todos los tests del ejercicio y la implementación del Stack no debe tener if.

No se pueden modificar los tests.

Ayudas:
1) Primero hagan pasar todos los tests usando if ```stackConIF.image``` y después apliquen la técnica para sacar if que vimos.
2) Si les sirve, utilicen una metáfora. Una muy útil es la de representar el juego de los bebes donde se apilan platos en una especie de torre de Hanoi.

Importante: Tampoco se puede usar handleo de excepciones para ocultar lo que sería en definitiva un if.

### Stack usando una lista enlazada: ```stackLinkedList.image```

Tuve un error de diseño en esta solución. La lista enlazada tiene que levantar el error "Stack is empty!!!" produciendo acoplamiento entre las clases.

Para evitar esto, una solución posible es fusionar la lista y el stack en la clase OOStack. Con las subclases Node y EndNode pero con mensajes correspondientes del stack (add, top, pop, etc...). Notemos que MyLinkedList está implementada de forma básica y sin un montón de mensajes que le dan la escencia de lista enlazada.

## Parte b)

b) El Stack de la primera parte es utilizado para almacenar oraciones de cualquier longitud. 

Se debe implementar el mensaje find (elección de nombre del mensaje y colaboradores externos es parte del ejercicio) 
de SentenceFinderByPrefix que dado un prefijo se encarga de devolver todas las oraciones almacenadas en el Stack que contengan dicho prefijo.

Por ej. si el prefijo es 'Wint', y las oraciones en el Stack son 'winter is coming', 'winning is everything', 'The winds of Winter' y 'Winter is here' sólo debería devolver la última.

El prefijo es case sensitive, no puede ser vacío, ni contener espacios vacíos y el Stack al terminar la operación de búsqueda debe de mantener las mismas oraciones en idéntico orden.

La implementación de find debe ser lo más declarativa posible.

Además de implementar find, se debe testear dicha funcionalidad. Para ello escriba todos los tests que crea necesario en SentenceFinderByPrefixTest.

Aclaración: No se pueden agregar mensajes adicionales a Stack y la idea es se trabaje sobre el stack original y no clonarlo, ni transformarlo en otro tipo de colección para utilizarlo. La respuesta del sentenceFinder podría ser una OrderedCollection con las oraciones encontradas.
