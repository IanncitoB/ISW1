!classDefinition: #I category: #Romanos!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #Romanos!
I class
	instanceVariableNames: ''!

!I class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:14:36'!
* aMultiplicand
	^aMultiplicand.! !

!I class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:14:41'!
+ anAdder
	^anAdder next.! !

!I class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:14:47'!
- aSustrahend
	^self error: 'outOfRange'.! !

!I class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:14:53'!
/ aDividend
	"Acá metí un condicional pero la división sin condicionales te la regalo..."
	|variable|
	
	(aDividend isEqualTo: I) ifTrue: [variable :=self] ifFalse: [variable := self error: 'outOfRange'].
	
	^variable.! !

!I class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:39:29'!
<= aRoman
	^true.! !

!I class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:10:58'!
next
	^II.! !

!I class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:15:02'!
previous
	^self error:'outOfRange'! !

!I class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:15:07'!
restarleA: aNumber
	"aNumber - 1: Le resta uno el número pasado por parámetro"
	^aNumber previous.! !


!classDefinition: #II category: #Romanos!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #Romanos!
II class
	instanceVariableNames: 'Previo'!

!II class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:14:14'!
* aMultiplicand
	^aMultiplicand + (self previous * aMultiplicand).
	! !

!II class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:14:07'!
+ anAdder
	^self previous + anAdder next.! !

!II class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:14:21'!
- aSustrahend
	^aSustrahend restarleA: self.! !

!II class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:41:05'!
/ aDividend
	"TODO: Cambiar. Hace una iteración demás, pero si uso '<', devuelve ceil(self / aDividend) "
	|cociente|
	
	cociente := I.
	[cociente * aDividend <= self] whileTrue: [cociente := cociente next].
	
	^cociente previous.! !

!II class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:38:41'!
<= aRoman
	(aRoman = I) ifTrue: [^false].
	^(self previous <= aRoman previous).
	! !

!II class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := I.! !

!II class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:18:36'!
nameOfNext
	"Del __899 al __900"
	(self name endsWith: 'DCCCXCIX') ifTrue:[^(self name withoutSuffix:'DCCCXCIX'), 'CM'].
	"Del __999 al __1000"
	(self name endsWith: 'CMXCIX') ifTrue:[^(self name withoutSuffix:'CMXCIX'), 'M'].

	"Del __399 al __400"
	(self name endsWith: 'CCCXCIX') ifTrue:[^(self name withoutSuffix:'CCCXCIX'), 'CD'].
	"Del __499 al __500"
	(self name endsWith: 'CDXCIX') ifTrue:[^(self name withoutSuffix:'CDXCIX'), 'D'].

	"Del ___89 al ___90"
	(self name endsWith: 'LXXXIX') ifTrue:[^(self name withoutSuffix:'LXXXIX'), 'XC'].
	"Del ___99 al __100"
	(self name endsWith: 'XCIX') ifTrue:[^(self name withoutSuffix:'XCIX'), 'C'].
	
	"Del ___39 al ___40"
	(self name endsWith: 'XXXIX') ifTrue:[^(self name withoutSuffix:'XXXIX'), 'XL'].
	"Del ___49 al ___50"
	(self name endsWith: 'XLIX') ifTrue:[^(self name withoutSuffix:'XLIX'), 'L'].
	
	"Del ___8 al ___9"
	(self name endsWith: 'VIII') ifTrue:[^(self name withoutSuffix:'VIII'), 'IX'].
	"Del ___9 al ___10"
	(self name endsWith: 'IX') ifTrue:[^(self name withoutSuffix:'IX'), 'X'].
	
	"Del ___3 al ___4"
	(self name endsWith: 'III') ifTrue:[^(self name withoutSuffix: 'III'), 'IV'].
	"Del ___4 al ___5"
	(self name endsWith: 'IV') ifTrue:[^(self name withoutSuffix:'IV'), 'V'].
	
	"Suma 1 normal"
	^self name, 'I'.! !

!II class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:13:04'!
next
	| siguiente |
	siguiente := II createChildNamed:self nameOfNext.
	siguiente previo: self.
	^siguiente.! !

!II class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:13:41'!
previo: unPrevio
	Previo := unPrevio.! !

!II class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:13:49'!
previous
	^Previo.! !

!II class methodsFor: '-- all --' stamp: 'IB 3/28/2024 18:13:56'!
restarleA: aNumber
	"aNumber - self"
	^self previous restarleA: aNumber previous.! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := I.! !


!classDefinition: #III category: #Romanos!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #Romanos!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := II.! !


!classDefinition: #IV category: #Romanos!
II subclass: #IV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IV class' category: #Romanos!
IV class
	instanceVariableNames: ''!

!IV class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := III.! !


!classDefinition: #IX category: #Romanos!
II subclass: #IX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IX class' category: #Romanos!
IX class
	instanceVariableNames: ''!

!IX class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := VIII.! !


!classDefinition: #V category: #Romanos!
II subclass: #V
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'V class' category: #Romanos!
V class
	instanceVariableNames: ''!

!V class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := IV.! !


!classDefinition: #VI category: #Romanos!
II subclass: #VI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VI class' category: #Romanos!
VI class
	instanceVariableNames: ''!

!VI class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := V.! !


!classDefinition: #VII category: #Romanos!
II subclass: #VII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VII class' category: #Romanos!
VII class
	instanceVariableNames: ''!

!VII class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := VI.! !


!classDefinition: #VIII category: #Romanos!
II subclass: #VIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VIII class' category: #Romanos!
VIII class
	instanceVariableNames: ''!

!VIII class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := VII.! !


!classDefinition: #X category: #Romanos!
II subclass: #X
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'X class' category: #Romanos!
X class
	instanceVariableNames: ''!

!X class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := IX.! !


!classDefinition: #XI category: #Romanos!
II subclass: #XI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XI class' category: #Romanos!
XI class
	instanceVariableNames: ''!

!XI class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := X.! !


!classDefinition: #XII category: #Romanos!
II subclass: #XII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XII class' category: #Romanos!
XII class
	instanceVariableNames: ''!

!XII class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := XI.! !


!classDefinition: #XIII category: #Romanos!
II subclass: #XIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIII class' category: #Romanos!
XIII class
	instanceVariableNames: ''!

!XIII class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := XII.! !


!classDefinition: #XIV category: #Romanos!
II subclass: #XIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIV class' category: #Romanos!
XIV class
	instanceVariableNames: ''!

!XIV class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := XIII.! !


!classDefinition: #XIX category: #Romanos!
II subclass: #XIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIX class' category: #Romanos!
XIX class
	instanceVariableNames: ''!

!XIX class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := XVIII.! !


!classDefinition: #XV category: #Romanos!
II subclass: #XV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XV class' category: #Romanos!
XV class
	instanceVariableNames: ''!

!XV class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := XIV.! !


!classDefinition: #XVI category: #Romanos!
II subclass: #XVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVI class' category: #Romanos!
XVI class
	instanceVariableNames: ''!

!XVI class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := XV.! !


!classDefinition: #XVII category: #Romanos!
II subclass: #XVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVII class' category: #Romanos!
XVII class
	instanceVariableNames: ''!

!XVII class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := XVI.! !


!classDefinition: #XVIII category: #Romanos!
II subclass: #XVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVIII class' category: #Romanos!
XVIII class
	instanceVariableNames: ''!

!XVIII class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := XVII.! !


!classDefinition: #XX category: #Romanos!
II subclass: #XX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XX class' category: #Romanos!
XX class
	instanceVariableNames: ''!

!XX class methodsFor: '--** private fileout/in **--' stamp: 'IB 3/28/2024 18:42:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Previo := XIX.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IV initializeAfterFileIn!
IX initializeAfterFileIn!
V initializeAfterFileIn!
VI initializeAfterFileIn!
VII initializeAfterFileIn!
VIII initializeAfterFileIn!
X initializeAfterFileIn!
XI initializeAfterFileIn!
XII initializeAfterFileIn!
XIII initializeAfterFileIn!
XIV initializeAfterFileIn!
XIX initializeAfterFileIn!
XV initializeAfterFileIn!
XVI initializeAfterFileIn!
XVII initializeAfterFileIn!
XVIII initializeAfterFileIn!
XX initializeAfterFileIn!