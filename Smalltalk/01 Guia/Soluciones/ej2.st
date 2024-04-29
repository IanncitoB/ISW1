!classDefinition: #Bill category: #ej2!
DenotativeObject subclass: #Bill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bill class' category: #ej2!
Bill class
	instanceVariableNames: 'energia'!

!Bill class methodsFor: 'acciones' stamp: 'i 3/15/2024 12:24:29'!
caminar: unaCantidadDeKilometros
	energia:= energia - (unaCantidadDeKilometros + 3).
	^self.! !

!Bill class methodsFor: 'acciones' stamp: 'i 3/15/2024 12:24:26'!
comer: unaCantidadDeKilosDeCerebro
	energia:=energia + (4 * unaCantidadDeKilosDeCerebro).
	^self.! !

!Bill class methodsFor: 'acciones' stamp: 'i 3/14/2024 20:00:38'!
energia
	^energia asNumber.! !

!Bill class methodsFor: 'acciones' stamp: 'i 3/15/2024 12:51:35'!
initialize
	"inicializa en 28"
	energia:= 28.
	^self.! !


!Bill class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/22/2024 00:59:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energia := 18.! !


!classDefinition: #TestsBill category: #ej2!
DenotativeObject subclass: #TestsBill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestsBill class' category: #ej2!
TestsBill class
	instanceVariableNames: ''!

!TestsBill class methodsFor: 'accionesSimples' stamp: 'i 3/15/2024 12:54:11'!
testCamina2Kilometros
	|nuevo|
	nuevo := Bill initialize.
	
	Assert that:(nuevo caminar: 2) energia isEqualTo: (28 - (2+3)).! !

!TestsBill class methodsFor: 'accionesSimples' stamp: 'i 3/15/2024 12:54:15'!
testCome2Kilos
	|nuevo|
	nuevo:=Bill initialize.
	Assert that: ((nuevo comer: 2) energia) isEqualTo: (28+(2*4)).! !

!TestsBill class methodsFor: 'accionesSimples' stamp: 'i 3/15/2024 12:53:43'!
testInicializacion	
	|nuevo|
	nuevo := Bill initialize.
	Assert that: (nuevo energia) isEqualTo: 28.! !


!TestsBill class methodsFor: 'accionesAnidadas' stamp: 'i 3/15/2024 12:54:23'!
testCaminaVariasVeces
	
	|nuevo|
	nuevo := Bill initialize.
	nuevo caminar: 1.
	Assert that: nuevo energia isEqualTo: (28 - 4).
	
	nuevo caminar: 3.
	Assert that: nuevo energia isEqualTo:(28-4-6).! !

!TestsBill class methodsFor: 'accionesAnidadas' stamp: 'i 3/15/2024 12:54:32'!
testCaminaYcome
	|nuevo|
	nuevo := Bill initialize.
	
	nuevo caminar: 3.
	Assert that: nuevo energia isEqualTo: (28-6).
	
	nuevo comer:2.
	Assert that: nuevo energia isEqualTo:(28-6+(2*4)).! !

!TestsBill class methodsFor: 'accionesAnidadas' stamp: 'i 3/15/2024 12:54:27'!
testComeVariasVeces
	
	|nuevo|
	nuevo := Bill initialize.
	nuevo comer: 1.
	Assert that: nuevo energia isEqualTo: (28 + 4).
	
	nuevo comer: 3.
	Assert that: nuevo energia isEqualTo:(28+4+(3*4)).! !

!TestsBill class methodsFor: 'accionesAnidadas' stamp: 'i 3/15/2024 12:54:37'!
testComeYcamina
	|nuevo|
	nuevo := Bill initialize.
	
	nuevo comer: 3.
	Assert that: nuevo energia isEqualTo: (28+(4*3)).
	
	nuevo caminar:2.
	Assert that: nuevo energia isEqualTo:(28+(4*3)-(3+2)).! !

Bill initialize!
Bill initializeAfterFileIn!