!classDefinition: #CrewTest category: #'ISW1-2022-2C-1erParcial'!
TestCase subclass: #CrewTest
	instanceVariableNames: 'island crew crewPosition treePosition map digPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!CrewTest methodsFor: 'setUp/tearDown' stamp: 'IB 4/28/2024 22:13:55'!
setUp
	self setUpWithDigPosition: 3@3! !

!CrewTest methodsFor: 'setUp/tearDown' stamp: 'IB 4/28/2024 19:27:44'!
setUpWithDigPosition: aDigPosition
	
	crewPosition := 1@1.
	treePosition := 1@2.
	digPosition := aDigPosition.
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: digPosition).
	
	map := Map of: island crewStartsAt: crewPosition.

	crew := Crew 
		at: island 
		composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
		at: crewPosition.
	! !

!CrewTest methodsFor: 'setUp/tearDown' stamp: 'IB 4/28/2024 19:53:09'!
setUpWithMoveAndBuryTreasure

	self setUpWithDigPosition: 2@2.
	
	crew moveTo: 2@1.
	crew buryTreasureAt: 2@2! !


!CrewTest methodsFor: 'assertions' stamp: 'IB 4/28/2024 19:41:42'!
assertCrewDidNotMoveToATreePosition

	self assertCrewNotAt: treePosition inseadAt: crewPosition.! !

!CrewTest methodsFor: 'assertions' stamp: 'IB 4/28/2024 19:41:03'!
assertCrewNotAt: firstPosition inseadAt: nextPosition

	self deny: (island hasCrewAt: firstPosition).
	self assert: (island hasCrewAt: nextPosition)! !

!CrewTest methodsFor: 'assertions' stamp: 'IB 4/28/2024 19:49:46'!
assertMapSize: anInteger andLastPositionIs: aPosition

	self assert: map stepsSize equals: anInteger. 
	self assert: map lastPosition equals: aPosition! !

!CrewTest methodsFor: 'assertions' stamp: 'IB 4/28/2024 19:46:38'!
assertPositionEmpty: aPosition

	^ self assert: (island isEmptyAt: aPosition)! !

!CrewTest methodsFor: 'assertions' stamp: 'IB 4/28/2024 19:47:12'!
assertRemovedTree

	^ self assertPositionEmpty: treePosition.! !


!CrewTest methodsFor: 'tests' stamp: 'IB 4/28/2024 22:14:00'!
test01MovingCrewToTreePlaceDoesNotMove
	
	crew moveTo: treePosition.
	
	self assertCrewDidNotMoveToATreePosition.! !

!CrewTest methodsFor: 'tests' stamp: 'IB 4/28/2024 22:14:03'!
test02MovingCrewToTreePlaceFilibusteroRemovesTree
	
	self deny: (island isEmptyAt: treePosition).
				
	crew moveTo: treePosition.

	self assertRemovedTree.
	
	self assertCrewDidNotMoveToATreePosition.! !

!CrewTest methodsFor: 'tests' stamp: 'IB 4/28/2024 22:14:07'!
test03MovingCrewToFreePlace

	| nextPosition |
	
	nextPosition := 2@1.
	self assertPositionEmpty: nextPosition.
	
	crew moveTo: nextPosition.

	self assertCrewNotAt: crewPosition inseadAt: nextPosition.! !

!CrewTest methodsFor: 'tests' stamp: 'IB 4/28/2024 22:14:12'!
test04MovingCrewToFreePlaceCorsarioWritesDirectionInMap

	| nextPosition |
	
	nextPosition := 2@1.
	self assert: map isEmpty.

	crew moveTo: nextPosition.

	self assertMapSize: 1 andLastPositionIs: nextPosition.
! !

!CrewTest methodsFor: 'tests' stamp: 'IB 4/28/2024 19:27:41'!
test05CrewCannotBuryTreasureIfBucaneroCannotDig

	self setUpWithDigPosition: 2@2.
	
	self 
		should: [ crew buryTreasureAt: 3@1 ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :error | 
			self assert: error messageText equals: Bucanero cannotDigErrorDescription.
			self deny: map hasTreasureMark ]
			
	
	
	
! !

!CrewTest methodsFor: 'tests' stamp: 'IB 4/28/2024 19:53:09'!
test06CrewCanBuryTreasureIfBucaneroCanDig

	self setUpWithMoveAndBuryTreasure.
	
	self assert: map hasTreasureMark.
	
			
	
	
	
! !

!CrewTest methodsFor: 'tests' stamp: 'IB 4/28/2024 19:53:31'!
test07CaptainCanUseMap
	
	| pirate |
	
	self setUpWithMoveAndBuryTreasure.

	pirate := Bucanero new.
	pirate aCaptainIWasMeantToBe.
	
	self assert: (pirate searchTreasureIn: island with: map)! !

!CrewTest methodsFor: 'tests' stamp: 'IB 4/28/2024 19:53:47'!
test08SimplePirateCannotUseMap

	| pirate |
	
	self setUpWithMoveAndBuryTreasure.
	
	pirate := Bucanero new.
	
	self 
		should: [ pirate searchTreasureIn: island with: map ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: 'I am a simple pirate!!'
! !


!classDefinition: #Crew category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Crew
	instanceVariableNames: 'island pirates'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Crew methodsFor: 'initialization' stamp: 'FRT 9/17/2022 22:53:00'!
initializeWith: anIsland pirates: aPirates at: aPosition

	island := anIsland.
	pirates := aPirates.
	
	island crewAt: aPosition.! !


!Crew methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:05:24'!
buryTreasureAt: aPosition

	| terrain |
	
	terrain := island terrainAt: aPosition.
	
	pirates do: [:pirate | 
		terrain pirate: pirate buriesTreasureAt: aPosition withIsland: island.
		]
	! !

!Crew methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:08:44'!
moveTo: aPosition

	| acc terrain |
	
	terrain := island terrainAt: aPosition.
	
	acc := pirates inject: true into: [:total :pirate |
		(terrain movePirate: pirate to: aPosition withIsland: island)
			ifTrue: [total]
			ifFalse: [false]
		].

	"nos movemos si todos pueden moverse"
	acc ifTrue: [ island crewAt: aPosition ].
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Crew class' category: #'ISW1-2022-2C-1erParcial'!
Crew class
	instanceVariableNames: ''!

!Crew class methodsFor: 'instance creation' stamp: 'HAW 9/18/2022 19:21:29'!
at: anIsland composedBy: aCrew at: aPosition

	^ self new initializeWith: anIsland pirates: aCrew at: aPosition ! !


!classDefinition: #Island category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Island
	instanceVariableNames: 'boardSize treesAt digsAt crewAt treasureAt'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Island methodsFor: 'initialization' stamp: 'FRT 9/17/2022 15:23:00'!
initializeSized: size treesAt: treesPositions digsAt: digsPositions

	boardSize := size.
	treesAt := treesPositions.
	digsAt := digsPositions.
! !


!Island methodsFor: 'comparing' stamp: 'IB 4/28/2024 18:18:27'!
checkDigsAtPosition: aPosition

	^ digsAt includes: aPosition! !

!Island methodsFor: 'comparing' stamp: 'IB 4/28/2024 18:17:50'!
checkTreeAtPosition: aPosition

	^ treesAt includes: aPosition! !

!Island methodsFor: 'comparing' stamp: 'FRT 9/17/2022 15:45:56'!
hasCrewAt: aPosition

	^ crewAt = aPosition.! !

!Island methodsFor: 'comparing' stamp: 'IB 4/28/2024 18:17:50'!
isEmptyAt: aPosition

	^(self checkTreeAtPosition: aPosition) not! !


!Island methodsFor: 'treasure' stamp: 'IB 4/28/2024 20:36:24'!
clearTerrainAt: aPosition

	treesAt remove: aPosition ifAbsent:  [].
! !

!Island methodsFor: 'treasure' stamp: 'FRT 9/17/2022 15:37:10'!
crewAt: aPosition

	crewAt := aPosition.! !

!Island methodsFor: 'treasure' stamp: 'FRT 9/17/2022 15:27:44'!
receiveTreasureAt: aPosition

	treasureAt := aPosition.! !

!Island methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:18:27'!
terrainAt: aPosition

	(self checkTreeAtPosition: aPosition) ifTrue: [^ Tree new].
	(self checkDigsAtPosition: aPosition) ifTrue: [^ Diggable new].

	^Empty new.
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Island class' category: #'ISW1-2022-2C-1erParcial'!
Island class
	instanceVariableNames: ''!

!Island class methodsFor: 'instance creation' stamp: 'FRT 9/17/2022 15:46:50'!
sized: size treesAt: treesPositions digsAt: digsPositions

	^ self new initializeSized: size treesAt: treesPositions digsAt: digsPositions 
! !


!classDefinition: #Map category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Map
	instanceVariableNames: 'island startPosition steps treasureMarkPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Map methodsFor: 'comparing' stamp: 'IB 4/28/2024 18:39:06'!
hasTreasureMark

	^ (treasureMarkPosition = 'yet undefined') not.
	
	! !

!Map methodsFor: 'comparing' stamp: 'FRT 9/17/2022 16:43:52'!
isEmpty

	^ steps isEmpty
	
	! !


!Map methodsFor: 'accessing' stamp: 'IB 4/28/2024 18:37:12'!
lastPosition

	^startPosition + (steps sum: [:step | step ] ifEmpty: [0]).
		
	! !

!Map methodsFor: 'accessing' stamp: 'FRT 9/17/2022 16:33:43'!
startPosition

	^ startPosition
	
	! !

!Map methodsFor: 'accessing' stamp: 'FRT 9/17/2022 16:32:59'!
step: ix

	^ steps at: ix.
	
	! !

!Map methodsFor: 'accessing' stamp: 'FRT 9/17/2022 16:32:23'!
stepsSize

	^ steps size.
	
	! !


!Map methodsFor: 'updating' stamp: 'FRT 9/17/2022 16:39:01'!
nextStep: step

	^ steps add: step.
	
	! !

!Map methodsFor: 'updating' stamp: 'FRT 9/17/2022 19:01:06'!
treasureMarkAt: aPosition

	treasureMarkPosition := aPosition.
	
	! !


!Map methodsFor: 'initialization' stamp: 'IB 4/28/2024 18:38:31'!
initializeWith: anIsland crewStartsAt: aPosition

	island := anIsland.
	startPosition := aPosition.
	steps := OrderedCollection new.
	treasureMarkPosition := 'yet undefined'.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Map class' category: #'ISW1-2022-2C-1erParcial'!
Map class
	instanceVariableNames: ''!

!Map class methodsFor: 'instance creation' stamp: 'FRT 9/17/2022 16:28:38'!
of: island crewStartsAt: aPosition.

	^ self new initializeWith: island crewStartsAt: aPosition.! !


!classDefinition: #Pirate category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Pirate
	instanceVariableNames: 'rank'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Pirate methodsFor: 'initialization' stamp: 'IB 4/28/2024 18:52:55'!
initialize

	rank := Simple new! !


!Pirate methodsFor: 'treasure' stamp: 'IB 4/28/2024 17:51:08'!
buryTreasureWhenDiggableAt: aPosition withIsland: anIsland
	! !

!Pirate methodsFor: 'treasure' stamp: 'IB 4/28/2024 17:21:13'!
buryTreasureWhenNotDiggableAt: aPosition
	
	^self error: 'Arrgh!! I cannot dig this type of terrain!!'! !

!Pirate methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:57:36'!
searchTreasureIn: island with: aMap

	self subclassResponsibility! !


!Pirate methodsFor: 'captain' stamp: 'IB 4/28/2024 18:51:53'!
aCaptainIWasMeantToBe

	rank := Captain new! !


!classDefinition: #Bucanero category: #'ISW1-2022-2C-1erParcial'!
Pirate subclass: #Bucanero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Bucanero methodsFor: 'treasure' stamp: 'IB 4/28/2024 17:15:06'!
buryTreasureWhenDiggableAt: aPosition withIsland: anIsland
	
	^ anIsland receiveTreasureAt: aPosition.
! !

!Bucanero methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:07:41'!
moveTo: aPosition 
	^ true! !

!Bucanero methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:07:25'!
moveTo: aPosition withIsland: anIsland 
	^ false! !

!Bucanero methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:59:05'!
searchTreasureIn: island with: aMap
	
	^rank searchTreasueIn: island with: aMap.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bucanero class' category: #'ISW1-2022-2C-1erParcial'!
Bucanero class
	instanceVariableNames: ''!

!Bucanero class methodsFor: 'instance creation' stamp: 'FRT 9/17/2022 17:12:39'!
cannotDigErrorDescription

	^ 'Arrgh!! I cannot dig this type of terrain!!'.! !


!classDefinition: #Corsario category: #'ISW1-2022-2C-1erParcial'!
Pirate subclass: #Corsario
	instanceVariableNames: 'map'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Corsario methodsFor: 'treasure' stamp: 'IB 4/28/2024 17:13:50'!
buryTreasureWhenDiggableAt: aPosition withIsland: anIsland
	
	^ self drawTreasureMarkAt: aPosition! !

!Corsario methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:07:41'!
moveTo: aPosition 
	self drawDirectionTo: aPosition.
	^ true! !

!Corsario methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:07:25'!
moveTo: aPosition withIsland: anIsland 
	^ true! !

!Corsario methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:58:49'!
searchTreasureIn: island with: aMap

	^rank searchTreasureIn: island with: aMap
	! !


!Corsario methodsFor: 'initialization' stamp: 'IB 4/28/2024 18:52:32'!
initializeWith: aMap

	rank := Simple new.
	map := aMap! !


!Corsario methodsFor: 'draw' stamp: 'FRT 9/17/2022 22:43:57'!
drawDirectionTo: aPosition

	map nextStep: aPosition - (map lastPosition).
	
! !

!Corsario methodsFor: 'draw' stamp: 'FRT 9/17/2022 19:01:22'!
drawTreasureMarkAt: aPosition

	map nextStep: aPosition - map lastPosition.
	map treasureMarkAt: aPosition.
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Corsario class' category: #'ISW1-2022-2C-1erParcial'!
Corsario class
	instanceVariableNames: ''!

!Corsario class methodsFor: 'instance creation' stamp: 'FRT 9/15/2022 21:46:08'!
with: aMap

	^ self new initializeWith: aMap.! !


!classDefinition: #Filibustero category: #'ISW1-2022-2C-1erParcial'!
Pirate subclass: #Filibustero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Filibustero methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:07:42'!
moveTo: aPosition 
	^true! !

!Filibustero methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:07:26'!
moveTo: aPosition withIsland: anIsland 
	anIsland clearTerrainAt: aPosition.
	^ false! !

!Filibustero methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:58:57'!
searchTreasureIn: island with: aMap

	^rank searchTreasureIn: island with: aMap
	! !


!classDefinition: #PirateRanks category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #PirateRanks
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!PirateRanks methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:56:22'!
searchTreasueIn: island with: aMap

	self subclassResponsibility! !


!classDefinition: #Captain category: #'ISW1-2022-2C-1erParcial'!
PirateRanks subclass: #Captain
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Captain methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:55:28'!
searchTreasueIn: island with: aMap.
	^true "Aye, Aye!! La implementación está fuera del scope del parcial."! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Captain class' category: #'ISW1-2022-2C-1erParcial'!
Captain class
	instanceVariableNames: 'uniqueInstance'!

!Captain class methodsFor: 'instance creation' stamp: 'IB 4/28/2024 19:54:52'!
new
	uniqueInstance ifNil: [uniqueInstance := self basicNew initialize].
	^ uniqueInstance.
	! !


!classDefinition: #Simple category: #'ISW1-2022-2C-1erParcial'!
PirateRanks subclass: #Simple
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Simple methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:56:05'!
searchTreasueIn: island with: aMap
	^self error: 'I am a simple pirate!!'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Simple class' category: #'ISW1-2022-2C-1erParcial'!
Simple class
	instanceVariableNames: 'uniqueInstance'!

!Simple class methodsFor: 'instance creation' stamp: 'IB 4/28/2024 19:02:15'!
new
	uniqueInstance ifNil: [uniqueInstance := self basicNew initialize].
	^uniqueInstance.! !


!classDefinition: #Terrain category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Terrain
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Terrain methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:08:02'!
movePirate: aPirate to: aPosition withIsland: anIsland 

	self subclassResponsibility! !

!Terrain methodsFor: 'treasure' stamp: 'IB 4/28/2024 17:52:19'!
pirate: aPirate buriesTreasureAt: aPosition withIsland: anIsland

	self subclassResponsibility! !


!classDefinition: #Diggable category: #'ISW1-2022-2C-1erParcial'!
Terrain subclass: #Diggable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Diggable methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:08:02'!
movePirate: aPirate to: aPosition withIsland: anIsland 
	^ true
	! !

!Diggable methodsFor: 'treasure' stamp: 'IB 4/28/2024 17:13:32'!
pirate: aPirate buriesTreasureAt: aPosition withIsland: anIsland
	
	^ aPirate buryTreasureWhenDiggableAt: aPosition withIsland: anIsland.! !


!classDefinition: #Empty category: #'ISW1-2022-2C-1erParcial'!
Terrain subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Empty methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:08:02'!
movePirate: aPirate to: aPosition withIsland: anIsland 

	^ aPirate moveTo: aPosition ! !

!Empty methodsFor: 'treasure' stamp: 'IB 4/28/2024 17:17:40'!
pirate: aPirate buriesTreasureAt: aPosition withIsland: anIsland
	
	^ aPirate buryTreasureWhenNotDiggableAt: aPosition.! !


!classDefinition: #Tree category: #'ISW1-2022-2C-1erParcial'!
Terrain subclass: #Tree
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Tree methodsFor: 'treasure' stamp: 'IB 4/28/2024 18:08:02'!
movePirate: aPirate to: aPosition withIsland: anIsland 

	^ aPirate moveTo: aPosition withIsland: anIsland ! !

!Tree methodsFor: 'treasure' stamp: 'IB 4/28/2024 17:17:54'!
pirate: aPirate buriesTreasureAt: aPosition withIsland: anIsland
	
	^ aPirate buryTreasureWhenNotDiggableAt: aPosition.! !
