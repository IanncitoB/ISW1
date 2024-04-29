!classDefinition: #Falso category: #ej3!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: #ej3!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'operaciones' stamp: 'i 3/15/2024 12:29:08'!
no
	^Verdadero.! !

!Falso class methodsFor: 'operaciones' stamp: 'i 3/15/2024 12:35:37'!
o: unBool
	^unBool.! !

!Falso class methodsFor: 'operaciones' stamp: 'IB 3/18/2024 21:25:25'!
siFalso: unaAccionARealizarUIgnorar
	"Realiza la acción"
	^unaAccionARealizarUIgnorar value.! !

!Falso class methodsFor: 'operaciones' stamp: 'i 3/15/2024 13:23:35'!
siVerdadero: unaAccionARealizarUIgnorar
	"Realiza la acción"
	^nil.! !

!Falso class methodsFor: 'operaciones' stamp: 'i 3/15/2024 12:34:11'!
y: unBool
	^Falso.! !


!classDefinition: #Verdadero category: #ej3!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: #ej3!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'operaciones' stamp: 'i 3/15/2024 12:28:47'!
no
	^Falso.! !

!Verdadero class methodsFor: 'operaciones' stamp: 'i 3/15/2024 12:35:25'!
o: unBool
	^Verdadero.! !

!Verdadero class methodsFor: 'operaciones' stamp: 'i 3/15/2024 12:40:19'!
siFalso: unaAccionARealizarUIgnorar
	"Ignora la acción"
	^nil.! !

!Verdadero class methodsFor: 'operaciones' stamp: 'IB 3/18/2024 21:27:45'!
siVerdadero: unaAccionARealizarUIgnorar
	"Realiza la acción"
	^unaAccionARealizarUIgnorar value.! !

!Verdadero class methodsFor: 'operaciones' stamp: 'i 3/15/2024 12:34:26'!
y: unBool
	^unBool.! !


!classDefinition: #testsVF category: #ej3!
DenotativeObject subclass: #testsVF
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'testsVF class' category: #ej3!
testsVF class
	instanceVariableNames: ''!

!testsVF class methodsFor: 'operaciones simples' stamp: 'i 3/15/2024 12:31:28'!
testNo
	Assert that: Verdadero no isEqualTo: Falso.
	Assert that: Falso no isEqualTo: Verdadero.! !

!testsVF class methodsFor: 'operaciones simples' stamp: 'i 3/15/2024 12:35:11'!
testO
	Assert that: (Verdadero o: Verdadero) isEqualTo: Verdadero.
	Assert that: (Verdadero o: Falso) isEqualTo: Verdadero.
	Assert that: (Falso o: Verdadero) isEqualTo: Verdadero.
	Assert that: (Falso o: Falso) isEqualTo: Falso.! !

!testsVF class methodsFor: 'operaciones simples' stamp: 'i 3/15/2024 12:33:05'!
testY
	Assert that: (Verdadero y: Verdadero) isEqualTo: Verdadero.
	Assert that: (Verdadero y: Falso) isEqualTo: Falso.
	Assert that: (Falso y: Verdadero) isEqualTo: Falso.
	Assert that: (Falso y: Falso) isEqualTo: Falso.! !


!testsVF class methodsFor: 'operaciones condicionales' stamp: 'IB 3/18/2024 21:26:46'!
testTodasLasVariantes
	|result|
	result := 'CualquierCosaNoNil'.
	"Verdadero no ejecuta"
	result := Verdadero siFalso:[result:='Ejecuta'].
	Assert that: result isEqualTo: nil.
	
	result := 'CualquierCosaNoNil'.
	"Verdadero ejecuta"
	result := Verdadero siVerdadero:[result:='Ejecuta'].
	Assert that: result isEqualTo:'Ejecuta'.
	
	result := 'CualquierCosaNoNil'.	
	"Falso ejecuta"
	result := Falso siFalso:[result:='Ejecuta'].
	Assert that: result isEqualTo: 'Ejecuta'.
	
	result := 'CualquierCosaNoNil'.
	"Falso no ejecuta"
	result := Falso siVerdadero:[result:='Ejecuta'].
	Assert that:result isEqualTo: nil.	! !
