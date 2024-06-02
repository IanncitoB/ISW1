!classDefinition: #MarsRoverLoggerTest category: #'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverLoggerTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'IB 6/1/2024 11:44:32'!
test01
	
	| positionLogger marsRover |
	
	marsRover := MarsRover at: (1@1) heading: MarsRoverHeadingNorth.
	
	positionLogger := MarsRoverLogger positionFor: marsRover.
	
	self assert: OrderedCollection new equals: positionLogger log.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'IB 6/1/2024 11:44:37'!
test02
	
	| positionLogger marsRover expected |
	
	marsRover := MarsRover at: (1@1) heading: MarsRoverHeadingNorth.
	
	positionLogger := MarsRoverLogger positionFor: marsRover.
	
	marsRover process: 'ff'.
	
	expected := OrderedCollection with: '1@2' with: '1@3'.
	
	self assert: expected equals: positionLogger log.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'IB 6/1/2024 11:44:40'!
test03
	
	| headingLogger marsRover expected |
	
	marsRover := MarsRover at: (1@1) heading: MarsRoverHeadingNorth.
	
	headingLogger := MarsRoverLogger headingFor: marsRover.
	
	marsRover process: ''.
	
	expected := OrderedCollection new.
	
	self assert: expected equals: headingLogger log.! !

!MarsRoverLoggerTest methodsFor: 'tests' stamp: 'IB 6/1/2024 15:30:15'!
test04
	
	| headingLogger marsRover expected |
	
	marsRover := MarsRover at: (1@1) heading: MarsRoverHeadingNorth.
	
	headingLogger := MarsRoverLogger headingFor: marsRover.
	
	marsRover process: 'rr'.
	
	expected := OrderedCollection with: 'East' with: 'South'.
	
	self assert: expected equals: headingLogger log.! !


!classDefinition: #MarsRoverTest category: #'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:21:23'!
test01DoesNotMoveWhenNoCommand

	self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: '' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:12'!
test02IsAtFailsForDifferentPosition

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@2 heading: self north)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:31'!
test03IsAtFailsForDifferentHeading

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@1 heading: self south)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:17'!
test04IncrementsYAfterMovingForwardWhenHeadingNorth

	self 
		assertIsAt: 1@3 
		heading: self north 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 6/1/2024 17:27:41'!
test05TRUE
	"El mejor test de la historia. Me agarra un ataque si veo que voy por el test X+1 y me pasan X tests"! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:11'!
test06DecrementsYAfterMovingBackwardsWhenHeadingNorth

	self 
		assertIsAt: 1@1 
		heading: self north 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:59'!
test07PointToEashAfterRotatingRightWhenHeadingNorth

	self 
		assertIsAt: 1@2 
		heading: self east 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:51'!
test08PointsToWestAfterRotatingLeftWhenPointingNorth

	self 
		assertIsAt: 1@2 
		heading: self west 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:45'!
test09DoesNotProcessInvalidCommand

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: self north.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: self north) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:39'!
test10CanProcessMoreThanOneCommand

	self 
		assertIsAt: 1@4 
		heading: self north 
		afterProcessing: 'ff' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:31'!
test11IncrementsXAfterMovingForwareWhenHeadingEast

	self 
		assertIsAt: 2@2 
		heading: self east 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:19'!
test12DecrementsXAfterMovingBackwardWhenHeadingEast

	self 
		assertIsAt: 0@2 
		heading: self east 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:14'!
test13PointsToSouthAfterRotatingRightWhenHeadingEast

		self 
		assertIsAt: 1@2 
		heading: self south 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:05'!
test14PointsToNorthAfterRotatingLeftWhenPointingEast

		self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:00'!
test15ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingSouth

	self 
		assertIsAt: 1@1 
		heading: self west 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self south 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:52'!
test16ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingWest

	self 
		assertIsAt: 0@2 
		heading: self north 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self west 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 6/1/2024 15:31:18'!
test17EmptyPositionLog
	| marsRover positionLogger |
	
	marsRover := MarsRover at: (1@1) heading: self north.
	
	positionLogger := MarsRoverLogger positionFor: marsRover.
	
	self assert: OrderedCollection new equals: positionLogger log.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 6/1/2024 15:31:41'!
test18OnePositionLog
	| marsRover expected positionLogger |
	
	marsRover := MarsRover at: (1@1) heading: self north.
	
	positionLogger := MarsRoverLogger positionFor: marsRover.
	
	marsRover process: 'f'.
	
	expected := OrderedCollection with: '1@2'.
	
	self assert: expected equals: positionLogger log.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 6/1/2024 15:32:01'!
test19ManyPositionLog
	| marsRover expected positionLogger |
	
	marsRover := MarsRover at: (1@1) heading: self north.
	
	positionLogger := MarsRoverLogger positionFor: marsRover.
	
	marsRover process: 'ff'.
	
	expected := OrderedCollection with: '1@2' with: '1@3'.
	
	self assert: expected equals: positionLogger log.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 6/1/2024 15:32:41'!
test20OneHeadingLog
	| marsRover expected headingLogger |
	
	marsRover := MarsRover at: (1@1) heading: self north.
	
	headingLogger := MarsRoverLogger headingFor: marsRover.
	
	marsRover process: 'r'.
	
	expected := OrderedCollection with: 'East'.
	
	self assert: expected equals: headingLogger log.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 6/1/2024 15:33:03'!
test21ManyHeadingLog
	| marsRover expected headingLogger |
	
	marsRover := MarsRover at: (1@1) heading: self north.
	
	headingLogger := MarsRoverLogger headingFor: marsRover.
	
	marsRover process: 'rl'.
	
	expected := OrderedCollection with: 'East' with: 'North'.
	
	self assert: expected equals: headingLogger log.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 6/1/2024 17:30:52'!
test22ManyBothLog
	| marsRover expected positionAndHeadingLogger |
	
	marsRover := MarsRover at: (1@1) heading: self north.
	
	positionAndHeadingLogger := MarsRoverLogger positionAndHeadingFor: marsRover.
	
	marsRover process: 'fr'.
	
	expected := OrderedCollection with: '1@2' with: 'East'.
	
	self assert: expected equals: positionAndHeadingLogger log.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 6/1/2024 16:36:13'!
test23EmptyHeadingWindowOnePositionWindow
	| marsRover positionWindow headingWindow |
	
	marsRover := MarsRover at: (1@1) heading: self north.
	
	positionWindow := MarsRoverWindow positionFor: marsRover.
	headingWindow := MarsRoverWindow headingFor: marsRover.
	
	marsRover process: 'f'.
	
	self assert: '1@2' equals: positionWindow window.
	self assert: '' equals: headingWindow window.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'IB 6/1/2024 16:36:57'!
test24ManyHeadingWindowManyPositionWindow
	| marsRover headingWindow positionWindow |
	
	marsRover := MarsRover at: (1@1) heading: self north.
	
	positionWindow := MarsRoverWindow positionFor: marsRover.
	headingWindow := MarsRoverWindow headingFor: marsRover.
	
	marsRover process: 'frfr'.
	
	self assert: '2@2' equals: positionWindow window.
	self assert: 'South' equals: headingWindow window.! !


!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:31'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:38'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:45'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:54'!
west

	^ MarsRoverHeadingWest ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'HAW 10/7/2021 20:20:47'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !


!classDefinition: #MarsRoverWindowTest category: #'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverWindowTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'IB 6/1/2024 15:56:12'!
test01
	
	| positionWindow marsRover |
	
	marsRover := MarsRover at: (1@1) heading: MarsRoverHeadingNorth.
	
	positionWindow := MarsRoverWindow positionFor: marsRover.
	
	self assert: '' equals: positionWindow window.! !

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'IB 6/1/2024 15:57:14'!
test02
	
	| positionWindow marsRover |
	
	marsRover := MarsRover at: (1@1) heading: MarsRoverHeadingNorth.
	
	positionWindow := MarsRoverWindow positionFor: marsRover.
	
	marsRover process: 'ff'.
	
	self assert: '1@3' equals: positionWindow window.! !

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'IB 6/1/2024 16:33:42'!
test03
	
	| headingWindow marsRover |
	
	marsRover := MarsRover at: (1@1) heading: MarsRoverHeadingNorth.
	
	headingWindow := MarsRoverWindow headingFor: marsRover.
	
	self assert: '' equals: headingWindow window.! !

!MarsRoverWindowTest methodsFor: 'tests' stamp: 'IB 6/1/2024 16:33:59'!
test04
	
	| headingWindow marsRover |
	
	marsRover := MarsRover at: (1@1) heading: MarsRoverHeadingNorth.
	
	headingWindow := MarsRoverWindow headingFor: marsRover.
	
	marsRover process: 'rr'.
	
	self assert: 'South' equals: headingWindow window.! !


!classDefinition: #MarsRover category: #'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'IB 6/1/2024 16:41:33'!
initializeAt: aPosition heading: aHeadingType
	
	position := ActiveVariable for: aPosition.
	head := ActiveVariable for: (aHeadingType for: self).! !


!MarsRover methodsFor: 'heading' stamp: 'IB 6/1/2024 16:42:56'!
headEast
	
	head value:​ (MarsRoverHeadingEast for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'IB 6/1/2024 16:43:17'!
headNorth
	
	head value: (MarsRoverHeadingNorth for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'IB 6/1/2024 16:43:30'!
headSouth
	
	head value:​ (MarsRoverHeadingSouth for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'IB 6/1/2024 16:43:45'!
headWest
	
	head value: (MarsRoverHeadingWest for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'IB 6/1/2024 16:39:17'!
rotateLeft
	
	head rotateLeft.! !

!MarsRover methodsFor: 'heading' stamp: 'IB 6/1/2024 16:39:20'!
rotateRight
	
	head rotateRight.! !


!MarsRover methodsFor: 'testing' stamp: 'IB 6/1/2024 16:51:49'!
isAt: aPosition heading: aHeadingType

	^position value = aPosition and: [ head isHeading: aHeadingType ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'moving' stamp: 'IB 6/1/2024 16:38:39'!
moveBackward
	
	head moveBackward.! !

!MarsRover methodsFor: 'moving' stamp: 'IB 6/1/2024 12:36:21'!
moveEast
	
	position value:​ position value + (1@0)! !

!MarsRover methodsFor: 'moving' stamp: 'IB 6/1/2024 16:38:37'!
moveForward
	
	head moveForward.! !

!MarsRover methodsFor: 'moving' stamp: 'IB 6/1/2024 12:36:05'!
moveNorth
	
	position value:​ position value + (0@1)! !

!MarsRover methodsFor: 'moving' stamp: 'IB 6/1/2024 12:36:32'!
moveSouth
	
	position value:​ position value + (0@-1)! !

!MarsRover methodsFor: 'moving' stamp: 'IB 6/1/2024 12:36:48'!
moveWest
	
	position value:​ position value + (-1@0)! !


!MarsRover methodsFor: 'command processing' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 8/22/2019 12:08:50'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'observer' stamp: 'IB 6/1/2024 21:44:35'!
attachHeadingObserverFor: aMarsRoverObserver 
	
	head addObserver: aMarsRoverObserver.! !

!MarsRover methodsFor: 'observer' stamp: 'IB 6/1/2024 21:44:41'!
attachPositionObserverFor: aMarsRoverObserver 
	
	position addObserver: aMarsRoverObserver.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:10:30'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !


!classDefinition: #MarsRoverHeading category: #'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:11:59'!
initializeFor: aMarsRover 
	
	marsRover := aMarsRover.! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'printing' stamp: 'IB 6/1/2024 16:24:43'!
asString

	self subclassResponsibility! !

!MarsRoverHeading methodsFor: 'printing' stamp: 'IB 5/27/2024 21:42:20'!
printString

	self subclassResponsibility! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:15:38'!
isHeading: aHeadingType

	^self isKindOf: aHeadingType ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: #'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:11:35'!
for: aMarsRover 
	
	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverHeadingEast category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headSouth! !


!MarsRoverHeadingEast methodsFor: 'printing' stamp: 'IB 5/27/2024 21:42:13'!
printString
	^ 'East'! !


!classDefinition: #MarsRoverHeadingNorth category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headEast! !


!MarsRoverHeadingNorth methodsFor: 'printing' stamp: 'IB 6/1/2024 16:24:43'!
asString
	^'Apuntando al Norte'! !

!MarsRoverHeadingNorth methodsFor: 'printing' stamp: 'IB 5/27/2024 21:42:34'!
printString
	^ 'North'! !


!classDefinition: #MarsRoverHeadingSouth category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headWest! !


!MarsRoverHeadingSouth methodsFor: 'printing' stamp: 'IB 6/1/2024 16:24:43'!
asString
	^'Apuntando al Sur'! !

!MarsRoverHeadingSouth methodsFor: 'printing' stamp: 'IB 5/27/2024 21:42:43'!
printString
	^ 'South'! !


!classDefinition: #MarsRoverHeadingWest category: #'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	^marsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headNorth! !


!MarsRoverHeadingWest methodsFor: 'printing' stamp: 'IB 6/1/2024 16:24:43'!
asString
	^'Apuntando al Oeste'! !

!MarsRoverHeadingWest methodsFor: 'printing' stamp: 'IB 5/27/2024 21:42:51'!
printString
	^ 'West'! !


!classDefinition: #MarsRoverLogger category: #'MarsRover-WithHeading'!
Object subclass: #MarsRoverLogger
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLogger methodsFor: 'accessing' stamp: 'IB 6/1/2024 15:29:04'!
log
	^ log copy! !


!MarsRoverLogger methodsFor: 'initialization' stamp: 'IB 6/1/2024 11:44:01'!
initialize
	log := OrderedCollection new.! !

!MarsRoverLogger methodsFor: 'initialization' stamp: 'IB 6/1/2024 15:28:35'!
initializeHeadingFor: aMarsRover
	aMarsRover attachHeadingObserverFor: self.! !

!MarsRoverLogger methodsFor: 'initialization' stamp: 'IB 6/1/2024 15:28:39'!
initializePositionFor: aMarsRover
	aMarsRover attachPositionObserverFor: self.! !


!MarsRoverLogger methodsFor: 'updates' stamp: 'IB 6/1/2024 16:30:36'!
notification: newValue
	log add: newValue printString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverLogger class' category: #'MarsRover-WithHeading'!
MarsRoverLogger class
	instanceVariableNames: ''!

!MarsRoverLogger class methodsFor: 'instance creation' stamp: 'IB 6/1/2024 15:13:00'!
headingFor: marsRover
	^self new initializeHeadingFor: marsRover ! !

!MarsRoverLogger class methodsFor: 'instance creation' stamp: 'IB 6/1/2024 15:35:06'!
positionAndHeadingFor: aMarsRover 
	^(self new initializePositionFor: aMarsRover) initializeHeadingFor: aMarsRover.! !

!MarsRoverLogger class methodsFor: 'instance creation' stamp: 'IB 6/1/2024 13:15:09'!
positionFor: aMarsRover 
	^self new initializePositionFor: aMarsRover! !


!classDefinition: #MarsRoverWindow category: #'MarsRover-WithHeading'!
Object subclass: #MarsRoverWindow
	instanceVariableNames: 'window'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverWindow methodsFor: 'accessing' stamp: 'IB 6/1/2024 15:41:46'!
window
	^window! !


!MarsRoverWindow methodsFor: 'initialization' stamp: 'IB 6/1/2024 15:37:30'!
initialize
	window := ''.! !

!MarsRoverWindow methodsFor: 'initialization' stamp: 'IB 6/1/2024 16:21:48'!
initializeHeadingFor: marsRover
	marsRover attachHeadingObserverFor: self.! !

!MarsRoverWindow methodsFor: 'initialization' stamp: 'IB 6/1/2024 15:41:08'!
initializePositionFor: marsRover
	
	marsRover attachPositionObserverFor: self.! !


!MarsRoverWindow methodsFor: 'updates' stamp: 'IB 6/1/2024 16:30:40'!
notification: newValue
	window := newValue printString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverWindow class' category: #'MarsRover-WithHeading'!
MarsRoverWindow class
	instanceVariableNames: ''!

!MarsRoverWindow class methodsFor: 'instance creation' stamp: 'IB 6/1/2024 16:21:24'!
headingFor: marsRover
	^self new initializeHeadingFor: marsRover ! !

!MarsRoverWindow class methodsFor: 'instance creation' stamp: 'IB 6/1/2024 15:40:27'!
positionFor: marsRover 
	^self new initializePositionFor: marsRover! !


!classDefinition: #ActiveVariable category: #'MarsRover-WithHeading'!
ProtoObject subclass: #ActiveVariable
	instanceVariableNames: 'variable observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!ActiveVariable methodsFor: 'add' stamp: 'IB 6/1/2024 13:20:47'!
addObserver: anObserver
	observers add: anObserver.! !


!ActiveVariable methodsFor: 'initialization' stamp: 'IB 6/1/2024 13:11:34'!
initialize
	observers := OrderedCollection new.! !

!ActiveVariable methodsFor: 'initialization' stamp: 'IB 6/1/2024 13:11:58'!
initializeFor: aVariable
	variable := aVariable.! !


!ActiveVariable methodsFor: 'not understand' stamp: 'IB 6/1/2024 16:46:28'!
doesNotUnderstand: aMessage
	^aMessage sendTo: variable.! !


!ActiveVariable methodsFor: 'notify' stamp: 'IB 6/1/2024 13:14:07'!
notify: anObserver
	
	anObserver notification: self value.! !


!ActiveVariable methodsFor: 'value' stamp: 'IB 6/1/2024 13:12:14'!
value
	^variable! !

!ActiveVariable methodsFor: 'value' stamp: 'IB 6/1/2024 13:13:29'!
value: newValue
	
	variable := newValue.
	observers do: [:observer | self notify: observer].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ActiveVariable class' category: #'MarsRover-WithHeading'!
ActiveVariable class
	instanceVariableNames: ''!

!ActiveVariable class methodsFor: 'instance creation' stamp: 'IB 6/1/2024 13:10:52'!
for: aVariable
	^self new initializeFor: aVariable.! !
