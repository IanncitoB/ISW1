!classDefinition: #MarsRoversTests category: #TDDMarsRovers!
TestCase subclass: #MarsRoversTests
	instanceVariableNames: 'NmarsRovers EmarsRovers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRovers'!

!MarsRoversTests methodsFor: 'setUp/tearDown' stamp: 'IB 5/13/2024 14:54:53'!
setUp
	NmarsRovers := MarsRovers at: 0@0 facing: $N.
	EmarsRovers := MarsRovers at: 0@0 facing: $E.! !


!MarsRoversTests methodsFor: 'testing' stamp: 'IB 5/13/2024 14:53:18'!
test01MarsRoversInstanceCreation

	NmarsRovers := MarsRovers at: 0@0 facing: $N.
	
	self assertMarsRovers: NmarsRovers isAtPosition: 0@0 andFacing: $N.! !

!MarsRoversTests methodsFor: 'testing' stamp: 'IB 5/13/2024 15:07:54'!
test02InvalidCardinalCharacterRaisesError
	self 
		should: [MarsRovers at: 0@0 facing: $T]
		raise: 	Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException description equals: 'Error: ', CardinalDirection incorrectCardinalCharacterMessage.
			]! !

!MarsRoversTests methodsFor: 'testing' stamp: 'IB 5/13/2024 14:53:39'!
test03ForwardingNorthResultsInADiferentPosition
	
	NmarsRovers do: 'f'.
	
	self assertMarsRovers: NmarsRovers isAtPosition: 0@1 andFacing: $N.! !

!MarsRoversTests methodsFor: 'testing' stamp: 'IB 5/13/2024 14:53:50'!
test04MultipleForwardingNorthResultsInCompositePosition

	NmarsRovers do: 'fff'.
	
	self assertMarsRovers: NmarsRovers isAtPosition: 0@3 andFacing: $N.! !

!MarsRoversTests methodsFor: 'testing' stamp: 'IB 5/13/2024 14:54:03'!
test05BackwardingNorthResultsNegativeDirection

	NmarsRovers do: 'b'.
	
	self assertMarsRovers: NmarsRovers isAtPosition: 0@-1 andFacing: $N.
	! !

!MarsRoversTests methodsFor: 'testing' stamp: 'IB 5/13/2024 14:55:16'!
test06ForwardingEastChangesFirstCoordenate
	
	EmarsRovers do: 'f'.
	
	self assertMarsRovers: EmarsRovers isAtPosition: 1@0 andFacing: $E.
	! !

!MarsRoversTests methodsFor: 'testing' stamp: 'IB 5/13/2024 14:55:34'!
test07BackwardingEastChangesFirstCoordenate

	EmarsRovers do: 'b'.
	
	self assertMarsRovers: EmarsRovers isAtPosition: -1@0 andFacing: $E.
	! !

!MarsRoversTests methodsFor: 'testing' stamp: 'IB 5/13/2024 14:55:45'!
test08RotatingRightFromNorthChangesDirectionToEast

	NmarsRovers do: 'r'.
	
	self assertMarsRovers: NmarsRovers isAtPosition: 0@0 andFacing: $E.
	! !

!MarsRoversTests methodsFor: 'testing' stamp: 'IB 5/13/2024 14:55:58'!
test09RotatingRightMultipleTimesAffectsOnlyDirection
	
	NmarsRovers do: 'r'.
	
	self assertMarsRovers: NmarsRovers isAtPosition: 0@0 andFacing: $E.

	NmarsRovers do: 'r'.
	
	self assertMarsRovers: NmarsRovers isAtPosition: 0@0 andFacing: $S.
	
	NmarsRovers do: 'r'.
	
	self assertMarsRovers: NmarsRovers isAtPosition: 0@0 andFacing: $W.! !

!MarsRoversTests methodsFor: 'testing' stamp: 'IB 5/13/2024 14:56:10'!
test10RotatingLeftFromNorthChangesDirectionToWest

	NmarsRovers do: 'l'.
	
	self assertMarsRovers: NmarsRovers isAtPosition: 0@0 andFacing: $W.
! !

!MarsRoversTests methodsFor: 'testing' stamp: 'IB 5/13/2024 14:56:20'!
test11RotatingLeftMultipleTimesAffectsOnlyDirection

	NmarsRovers do: 'll'.
	
	self assertMarsRovers: NmarsRovers isAtPosition: 0@0 andFacing: $S.
	
	NmarsRovers do: 'l'.
	
	self assertMarsRovers: NmarsRovers isAtPosition: 0@0 andFacing: $E.
	
	NmarsRovers do: 'l'.
	
	self assertMarsRovers: NmarsRovers isAtPosition: 0@0 andFacing: $N.! !

!MarsRoversTests methodsFor: 'testing' stamp: 'IB 5/13/2024 14:56:32'!
test12ReadingAnInvalidInstructionStopsProcessingCommands
	
	NmarsRovers do: 'ffrfpf'.
	
	self assertMarsRovers: NmarsRovers isAtPosition: 1@2 andFacing: $E.! !


!MarsRoversTests methodsFor: 'assertions' stamp: 'IB 5/13/2024 14:46:02'!
assertMarsRovers: marsRovers isAtPosition: position andFacing: cardinal

	self assert: position equals: marsRovers position.
	self assert: cardinal equals: marsRovers direction! !


!classDefinition: #CardinalDirection category: #TDDMarsRovers!
Object subclass: #CardinalDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRovers'!

!CardinalDirection methodsFor: 'rotation' stamp: 'IB 5/13/2024 14:04:49'!
rotateLeft

	self subclassResponsibility! !

!CardinalDirection methodsFor: 'rotation' stamp: 'IB 5/13/2024 14:00:21'!
rotateRight

	self subclassResponsibility! !


!CardinalDirection methodsFor: 'converting' stamp: 'IB 5/13/2024 14:15:56'!
asCharacter

	self subclassResponsibility! !


!CardinalDirection methodsFor: 'displacement' stamp: 'IB 5/13/2024 14:25:32'!
displacement

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalDirection class' category: #TDDMarsRovers!
CardinalDirection class
	instanceVariableNames: ''!

!CardinalDirection class methodsFor: 'instance creation' stamp: 'IB 5/13/2024 15:07:04'!
facing: cardinalChar

	self assertCorrectCardinalCharacter: cardinalChar.

	cardinalChar = $N ifTrue: [^NorthDirection new].
	cardinalChar = $S ifTrue: [^SouthDirection new].
	cardinalChar = $E ifTrue: [^EastDirection new].
	cardinalChar = $W ifTrue: [^WestDirection new].! !


!CardinalDirection class methodsFor: 'error handling' stamp: 'IB 5/13/2024 15:06:12'!
assertCorrectCardinalCharacter: cardinalChar

	self assert: (cardinalChar isKindOf: Character).
	
	(cardinalChar = $N or: 
	cardinalChar = $S or: 
	cardinalChar = $E or: 
	cardinalChar = $W) 
		ifFalse: [self errorIncorrectCardinalCharacter]! !

!CardinalDirection class methodsFor: 'error handling' stamp: 'IB 5/13/2024 15:03:12'!
errorIncorrectCardinalCharacter
	^self error: self incorrectCardinalCharacterMessage.! !

!CardinalDirection class methodsFor: 'error handling' stamp: 'IB 5/13/2024 15:03:05'!
incorrectCardinalCharacterMessage
	^'Cardinal character must be N, S, E or W'.! !


!classDefinition: #EastDirection category: #TDDMarsRovers!
CardinalDirection subclass: #EastDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRovers'!

!EastDirection methodsFor: 'rotation' stamp: 'IB 5/13/2024 14:05:35'!
rotateLeft
	^NorthDirection new! !

!EastDirection methodsFor: 'rotation' stamp: 'IB 5/13/2024 14:02:56'!
rotateRight
	^SouthDirection new! !


!EastDirection methodsFor: 'converting' stamp: 'IB 5/13/2024 14:16:24'!
asCharacter
	^$E.! !


!EastDirection methodsFor: 'displacement' stamp: 'IB 5/13/2024 14:25:56'!
displacement
	^1@0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EastDirection class' category: #TDDMarsRovers!
EastDirection class
	instanceVariableNames: 'uniqueInstance'!

!EastDirection class methodsFor: 'instance creation' stamp: 'IB 5/13/2024 14:02:16'!
new
	uniqueInstance ifNil: [uniqueInstance := self basicNew initialize].
	^ uniqueInstance! !


!classDefinition: #NorthDirection category: #TDDMarsRovers!
CardinalDirection subclass: #NorthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRovers'!

!NorthDirection methodsFor: 'rotation' stamp: 'IB 5/13/2024 14:04:27'!
rotateLeft
	^WestDirection new! !

!NorthDirection methodsFor: 'rotation' stamp: 'IB 5/13/2024 14:00:12'!
rotateRight
	^EastDirection new! !


!NorthDirection methodsFor: 'displacement' stamp: 'IB 5/13/2024 14:25:27'!
displacement
	^0@1! !


!NorthDirection methodsFor: 'converting' stamp: 'IB 5/13/2024 14:15:39'!
asCharacter
	^$N.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NorthDirection class' category: #TDDMarsRovers!
NorthDirection class
	instanceVariableNames: 'uniqueInstance'!

!NorthDirection class methodsFor: 'instance creation' stamp: 'IB 5/13/2024 14:01:23'!
new
	uniqueInstance ifNil: [uniqueInstance := self basicNew initialize].
	^ uniqueInstance! !


!classDefinition: #SouthDirection category: #TDDMarsRovers!
CardinalDirection subclass: #SouthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRovers'!

!SouthDirection methodsFor: 'rotation' stamp: 'IB 5/13/2024 14:05:27'!
rotateLeft
	^EastDirection new! !

!SouthDirection methodsFor: 'rotation' stamp: 'IB 5/13/2024 14:03:10'!
rotateRight
	^WestDirection new! !


!SouthDirection methodsFor: 'converting' stamp: 'IB 5/13/2024 14:16:07'!
asCharacter
	^$S.! !


!SouthDirection methodsFor: 'displacement' stamp: 'IB 5/13/2024 14:25:44'!
displacement
	^0@-1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SouthDirection class' category: #TDDMarsRovers!
SouthDirection class
	instanceVariableNames: 'uniqueInstance'!

!SouthDirection class methodsFor: 'instance creation' stamp: 'IB 5/13/2024 14:01:48'!
new
	uniqueInstance ifNil: [uniqueInstance := self basicNew initialize].
	^ uniqueInstance! !


!classDefinition: #WestDirection category: #TDDMarsRovers!
CardinalDirection subclass: #WestDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRovers'!

!WestDirection methodsFor: 'rotation' stamp: 'IB 5/13/2024 14:05:15'!
rotateLeft
	^SouthDirection new! !

!WestDirection methodsFor: 'rotation' stamp: 'IB 5/13/2024 14:03:29'!
rotateRight
	^NorthDirection new! !


!WestDirection methodsFor: 'converting' stamp: 'IB 5/13/2024 14:16:14'!
asCharacter
	^$W.! !


!WestDirection methodsFor: 'displacement' stamp: 'IB 5/13/2024 14:26:06'!
displacement
	^-1@0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WestDirection class' category: #TDDMarsRovers!
WestDirection class
	instanceVariableNames: 'uniqueInstance'!

!WestDirection class methodsFor: 'instance creation' stamp: 'IB 5/13/2024 14:02:03'!
new
	uniqueInstance ifNil: [uniqueInstance := self basicNew initialize].
	^ uniqueInstance! !


!classDefinition: #MarsRovers category: #TDDMarsRovers!
Object subclass: #MarsRovers
	instanceVariableNames: 'position facing'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRovers'!

!MarsRovers methodsFor: 'initialization' stamp: 'IB 5/13/2024 14:08:16'!
initializeAt: point facing: cardinalDirection 
	
	position := point.
	facing := cardinalDirection.! !


!MarsRovers methodsFor: 'accessing' stamp: 'IB 5/13/2024 14:14:47'!
direction
	^facing asCharacter.! !

!MarsRovers methodsFor: 'accessing' stamp: 'IB 5/13/2024 12:30:50'!
position
	^position! !


!MarsRovers methodsFor: 'operations' stamp: 'IB 5/13/2024 15:11:13'!
do: anInstructionString
	
	anInstructionString do: [:instruction |
		
		(self isValidInstruction: instruction) ifFalse: [^self].
		
		self processInstruction: instruction.
		
		].
	! !

!MarsRovers methodsFor: 'operations' stamp: 'IB 5/13/2024 15:12:10'!
processInstruction: instructionCharacter

	(instructionCharacter = $f or: instructionCharacter = $b)
		ifTrue: [
			| displacement |
			displacement := facing displacement.
			
			instructionCharacter = $b ifTrue: [displacement := displacement * -1].
			
			position := position + displacement.
			].
		
	instructionCharacter = $r
		ifTrue: [facing := facing rotateRight].
	
	instructionCharacter = $l
		ifTrue: [		facing := facing rotateLeft	]! !


!MarsRovers methodsFor: 'private' stamp: 'IB 5/13/2024 14:37:19'!
isValidInstruction: instructionCharacter 
	
	^(instructionCharacter = $f or: instructionCharacter = $b or: instructionCharacter = $r or: instructionCharacter = $l).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRovers class' category: #TDDMarsRovers!
MarsRovers class
	instanceVariableNames: ''!

!MarsRovers class methodsFor: 'instance creation' stamp: 'IB 5/13/2024 15:07:33'!
at: point facing: cardinalChar
	
	| direction |
	direction := CardinalDirection facing: cardinalChar.
	
	^self new initializeAt: point facing: direction.! !
