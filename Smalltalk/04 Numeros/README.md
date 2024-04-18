# Consigna + Soluciones

El objetivo de este ejercicio es que implementen la suma, la resta, la multiplicación y la división entre números enteros y fraccionarios.

### Solución 2.0: ```numerosCompleto.image```
Nota: En la solución 3 hay una alternativa más limpia.

La solución final no debe tener if en los métodos que deben implementar y todos los test deben funcionar. La implementación suministrada de la operación fibonacci tampoco debe tener if. 

Los tests ni su setUp pueden ser modificados.

Como podrán ver cuando corran los tests, hay varios que funcionan y son los correspondientes a cuando se opera aritméticamente entre números del mismo tipo, o sea entre enteros o entre fracciones. Los test que fallan son los relacionados a las operaciones entre números de distinto tipo, o sea entre enteros y fracciones y viceversa.

### Solución 2.1: ```numerosSolucionTincho.image```
Esta solución está más copada porque evita el síndrome maradoniano de la clase Entero. La solución 3 se basa en esta estrategia.

```
Las subclases de Entero tienen un mensaje de clase llamado "xwith:", le puse ese nombre para que no se pisaran con el with: de Entero. Igualmente, esos mensajes no son nunca usados. Me olvidé de eliminarlos, el único que debe quedar presente en la imagen es Entero with:

~Tincho
```

### Solución 3: ```numerosExtremo.image```

Aquellos que estén interesados en llevar al extremo el reemplazo de if por polimorfismo (y practicar para el parcial), traten de sacar los ifs que ya venían en el ejercicio inicialmente y que tienen que ver con que no se puede dividir por cero, que el denominador no puede ser uno, etc. Las soluciones a este desafío son muy interesantes y distintas en para lenguajes de prototipación (ej. javascript) y clasificación.

Algunas aclaraciones:

- El archivo que deben abrir, y el modelo desde el que tienen que partir es Numeros-Ejercicio.st. Pre-Numeros-Ejercicio Solu.st es la solución al ejercicio de Pre-Numeros que estaba fuera del zip.
- Las fracciones no pueden tener denominador 1. Fracciones con denominador 1 se asumen enteros.
- Los enteros no pueden responder los mensajes #numerador y #denominador ya que no son fracciones.
- Cuando se opera aritméticamente con enteros, verán que se utilizan las operaciones aritméticas provistas por el sistema. Esto es para que sea más performante.

Ayuda:

Antes de empezar a resolver el problema, debuggeen los tests que funcionan para entender cómo es el modelo que se está presentando, analicen las clases Número, Entero y Fracción.

### Solución 1: ```numerosConIF.image```

Una vez que se sientan cómodos con el modelo, hagan pasar todos los tests implementando lo necesario utilizando ifs (investiguen el mensaje #isKindOf:). Una vez que los tests pasen, apliquen el algoritmo que vimos en clase para reemplazar if por polimorfismo. 

