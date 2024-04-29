!classDefinition: #NumeroTest category: #'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 4/15/2021 16:45:35'!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: #'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:02'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:09'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de número inválido!!!!!!'! !


!classDefinition: #Entero category: #'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:38:19'!
* aMultiplier 
	^aMultiplier multiplicarEntero: self.
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:01:32'!
+ anAdder 
	^anAdder sumarEntero: self.
	
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:26:28'!
- aSubtrahend 
	^(aSubtrahend restarEntero: self) negated.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IB 4/14/2024 11:36:31'!
/ aDivisor
	^aDivisor dividirleAEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IB 4/14/2024 11:36:31'!
dividirleAEntero: anIntegerDivisor
	^Fraccion with: anIntegerDivisor over: self value.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IB 4/14/2024 11:36:44'!
dividirleAFraccion: aFraccionDivisor
	"aDraccionDivisor / self"
	|newNumerator newDenominator |
	newNumerator := aFraccionDivisor numerator.
	newDenominator := self value * aFraccionDivisor denominator.
	^ Fraccion with: newNumerator over: newDenominator.
	
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IB 4/17/2024 10:53:18'!
fibonacci
	^self subclassResponsibility.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IB 4/16/2024 17:05:59'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:36:38'!
multiplicarEntero: anIntegerMultiplier 
	^self class with: value * anIntegerMultiplier integerValue.

	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:42:42'!
multiplicarFraccion: aFractionMultiplier
	| newNumerator newDenominator |
	
	newNumerator := (Entero with: value)​ * aFractionMultiplier numerator.
	newDenominator := aFractionMultiplier denominator.
	
	^ newNumerator / newDenominator.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:24:13'!
restarEntero: anIntegerSubtrahend 
	^ self class with: value - anIntegerSubtrahend integerValue.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:35:40'!
restarFraccion: aFractionSubtrahend
	| newNumerator newDenominator |
	
	newNumerator := (aFractionSubtrahend denominator * (Entero with: value)) - aFractionSubtrahend numerator.
	newDenominator := aFractionSubtrahend denominator.
	^newNumerator / newDenominator.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 18:53:18'!
sumarEntero: anIntegerAdder 
	^self class with: value + anIntegerAdder integerValue.
	
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:20:37'!
sumarFraccion: aFraccionAdder
	|newNumerator newDenominator|
	newNumerator := self value * aFraccionAdder denominator + aFraccionAdder numerator.
	newDenominator := aFraccionAdder denominator.
	^newNumerator / newDenominator.
	
! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/15/2021 16:42:24'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos!!!!!!'! !

!Entero class methodsFor: 'instance creation' stamp: 'IB 4/17/2024 10:43:45'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	(aValue = 0) ifTrue:[^Cero new initalizeWith:0].
	(aValue = 1) ifTrue:[^Uno new initalizeWith:1].
	(aValue < 0) ifTrue:[^Negativo new initalizeWith:aValue].
	
	^Positivo new initalizeWith:aValue.
	
	"Atenti el gcd que trollea bastante: devuelve Positivo: 1, que debería ser Uno: 1"! !


!classDefinition: #Cero category: #'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'arithmeticOperations' stamp: 'IB 4/14/2024 11:57:50'!
fibonacci
	^Entero with: 1.! !

!Cero methodsFor: 'arithmeticOperations' stamp: 'IB 4/17/2024 10:49:35'!
isNegative
	^false.! !

!Cero methodsFor: 'arithmeticOperations' stamp: 'IB 4/17/2024 10:48:23'!
isOne
	^false.! !

!Cero methodsFor: 'arithmeticOperations' stamp: 'IB 4/17/2024 10:48:54'!
isZero
	^true.! !


!Cero methodsFor: 'initialization' stamp: 'IB 4/17/2024 12:18:47'!
initializeFractionWithSelfOver: aDenominator
	^self error: 'una fraccion no puede ser cero'.
	"Notar: acá no es necesario crear el mensaje initializeFractionWithANumeratorOverSelf porque el numerador sería 0."! !


!classDefinition: #Negativo category: #'Numero-Exercise'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Negativo methodsFor: 'arithmeticOperations' stamp: 'IB 4/14/2024 11:59:28'!
fibonacci
	^Entero error: Entero negativeFibonacciErrorDescription.! !

!Negativo methodsFor: 'arithmeticOperations' stamp: 'IB 4/17/2024 10:49:41'!
isNegative
	^true.! !

!Negativo methodsFor: 'arithmeticOperations' stamp: 'IB 4/17/2024 10:48:18'!
isOne
	^false.! !

!Negativo methodsFor: 'arithmeticOperations' stamp: 'IB 4/17/2024 10:48:59'!
isZero
	^false.! !


!Negativo methodsFor: 'initialization' stamp: 'IB 4/17/2024 12:12:23'!
initializeFractionWithANumeratorOverSelf: aNumerator

	^Fraccion new initializeSanitizedWith: aNumerator over: self.! !

!Negativo methodsFor: 'initialization' stamp: 'IB 4/17/2024 12:14:26'!
initializeFractionWithSelfOver: aDenominator
	^aDenominator initializeFractionWithANumeratorOverSelf: self.! !


!classDefinition: #Positivo category: #'Numero-Exercise'!
Entero subclass: #Positivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Positivo methodsFor: 'arithmeticOperations' stamp: 'IB 4/14/2024 11:59:59'!
fibonacci
	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci.! !

!Positivo methodsFor: 'arithmeticOperations' stamp: 'IB 4/17/2024 10:49:46'!
isNegative
	^false.! !

!Positivo methodsFor: 'arithmeticOperations' stamp: 'IB 4/17/2024 10:48:14'!
isOne
	^false.! !

!Positivo methodsFor: 'arithmeticOperations' stamp: 'IB 4/17/2024 10:49:03'!
isZero
	^false.! !


!Positivo methodsFor: 'initialization' stamp: 'IB 4/17/2024 12:12:16'!
initializeFractionWithANumeratorOverSelf: aNumerator

	^Fraccion new initializeSanitizedWith: aNumerator over: self.! !

!Positivo methodsFor: 'initialization' stamp: 'IB 4/17/2024 12:14:12'!
initializeFractionWithSelfOver: aDenominator
	^aDenominator initializeFractionWithANumeratorOverSelf: self.! !


!classDefinition: #Uno category: #'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'arithmeticOperations' stamp: 'IB 4/14/2024 11:58:36'!
fibonacci
	^Entero with: 1.! !

!Uno methodsFor: 'arithmeticOperations' stamp: 'IB 4/17/2024 10:49:50'!
isNegative
	^false.! !

!Uno methodsFor: 'arithmeticOperations' stamp: 'IB 4/17/2024 10:48:00'!
isOne
	^true.! !

!Uno methodsFor: 'arithmeticOperations' stamp: 'IB 4/17/2024 10:49:07'!
isZero
	^false.! !


!Uno methodsFor: 'initialization' stamp: 'IB 4/17/2024 12:11:37'!
initializeFractionWithANumeratorOverSelf: aNumerator
	^self error: 'una fraccion no puede tener denominador 1 porque sino es un entero'.! !

!Uno methodsFor: 'initialization' stamp: 'IB 4/17/2024 12:14:02'!
initializeFractionWithSelfOver: aDenominator
	^aDenominator initializeFractionWithANumeratorOverSelf: self.! !


!classDefinition: #Fraccion category: #'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:43:14'!
* aMultiplier 
	^aMultiplier multiplicarFraccion: self.
	
	
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:13:38'!
+ anAdder 
	^anAdder sumarFraccion: self.
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:34:54'!
- aSubtrahend 
	^(aSubtrahend restarFraccion: self) negated.
	
	
	
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IB 4/14/2024 12:15:10'!
/ aDivisor 
	^aDivisor dividirleAFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IB 4/14/2024 11:36:31'!
dividirleAEntero: anIntegerDivisor 
	| num den |
	num := self numerator.
	den := self denominator.
	
	^ Fraccion with: den * anIntegerDivisor over: num.
	
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IB 4/14/2024 11:36:44'!
dividirleAFraccion: aFractionDivisor 
	| newNumerator newDenominator |
	newNumerator := denominator * aFractionDivisor numerator.
	newDenominator := numerator * aFractionDivisor denominator.
	^Fraccion with: newNumerator over: newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:37:52'!
multiplicarEntero: anIntegerMultiplier 
	| num den |
	num := self numerator.
	den := self denominator.
	
	^ Fraccion with: (num * anIntegerMultiplier) over: den.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:39:16'!
multiplicarFraccion: aFractionMultiplier 
	^(numerator * aFractionMultiplier numerator) / (denominator * aFractionMultiplier denominator)
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:27:53'!
restarEntero: anIntegerSubtrahend
	| num den |
	num := self numerator.
	den := self denominator.
	
	^ Fraccion with: (num - (den * anIntegerSubtrahend)) over: den.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:29:27'!
restarFraccion: aFractionSubtrahend
	 | newNumerator newDenominator |
	
	newNumerator := (numerator * aFractionSubtrahend denominator) - (denominator * aFractionSubtrahend numerator).
	newDenominator := denominator * aFractionSubtrahend denominator.
	
	^newNumerator / newDenominator.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:14:36'!
sumarEntero: anIntegerAdder 
	
	| num den |
	num := self numerator.
	den := self denominator.
	
	^ Fraccion with: (den * anIntegerAdder + num) over: den.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'IB 4/13/2024 19:05:39'!
sumarFraccion: aFractionAdder 
	| newNumerator newDenominator |
	
	newNumerator := (numerator * aFractionAdder denominator) + (denominator * aFractionAdder numerator).
	newDenominator := denominator * aFractionAdder denominator.
	
	^newNumerator / newDenominator 
	! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'IB 4/17/2024 12:19:51'!
initializeSanitizedWith: aNumerator over: aDenominator
	"Denies: 
	aNumerator isZero
	aDenominator isOne
	"
	
	numerator := aNumerator.
	denominator := aDenominator.! !

!Fraccion methodsFor: 'initialization' stamp: 'IB 4/17/2024 12:08:10'!
initializeWith: aNumerator over: aDenominator
	
	^aNumerator initializeFractionWithSelfOver: aDenominator.! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'IB 4/16/2024 17:05:12'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
