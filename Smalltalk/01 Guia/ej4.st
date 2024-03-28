!classDefinition: #I category: #ej4!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #ej4!
I class
	instanceVariableNames: ''!

!I class methodsFor: '-- all --' stamp: 'IB 3/21/2024 21:44:45'!
* aMultiplicand

	|variable|
	
	(aMultiplicand isEqualTo: I) ifTrue: [variable :=self] ifFalse: [variable := self + (self * (aMultiplicand previous))].
	
	^variable.! !

!I class methodsFor: '-- all --' stamp: 'IB 3/21/2024 21:36:55'!
+ anAdder

	|variable|
	
	(anAdder isEqualTo: I) ifTrue: [variable :=self next] ifFalse: [variable := self next + (anAdder previous)].
	
	^variable.! !

!I class methodsFor: '-- all --' stamp: 'IB 3/21/2024 21:35:04'!
- aSustrahend

	|variable|
	
	(aSustrahend isEqualTo: I) ifTrue: [variable :=self previous] ifFalse: [variable := self previous - (aSustrahend previous)].
	
	^variable.
	! !

!I class methodsFor: '-- all --' stamp: 'IB 3/21/2024 22:01:20'!
/ aDividend

	|variable|
	
	(self isEqualTo: I) ifTrue: [variable :=self] ifFalse: [variable := I + (self - aDividend) / aDividend].
	
	^variable.! !

!I class methodsFor: '-- all --' stamp: 'IB 3/21/2024 21:01:10'!
next
	"TODO: Chequear si existe el siguiente"
	^self createChildNamed:(self name,'I').! !

!I class methodsFor: '-- all --' stamp: 'IB 3/21/2024 21:14:27'!
previous
	^self parent! !


!classDefinition: #II category: #ej4!
I subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej4'!


!classDefinition: #III category: #ej4!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej4'!


!classDefinition: #IIII category: #ej4!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej4'!


!classDefinition: #IIIII category: #ej4!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej4'!


!classDefinition: #IIIIII category: #ej4!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej4'!


!classDefinition: #IIIIIII category: #ej4!
IIIIII subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej4'!


!classDefinition: #IIIIIIII category: #ej4!
IIIIIII subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej4'!


!classDefinition: #IIIIIIIII category: #ej4!
IIIIIIII subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej4'!


!classDefinition: #IIIIIIIIII category: #ej4!
IIIIIIIII subclass: #IIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej4'!


!classDefinition: #IIIIIIIIIII category: #ej4!
IIIIIIIIII subclass: #IIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej4'!


!classDefinition: #IIIIIIIIIIII category: #ej4!
IIIIIIIIIII subclass: #IIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ej4'!
