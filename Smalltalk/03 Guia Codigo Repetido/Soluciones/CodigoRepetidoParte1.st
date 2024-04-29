!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'IB 4/9/2024 00:17:02'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := self setupTestCustomers: #() suspended: #().
	
	self evaluarBloque: [customerBook addCustomerNamed: 'John Lennon'.] umbralTiempo: (50* millisecond).
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IB 4/9/2024 00:16:57'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	
	customerBook := self setupTestCustomers: #('Paul McCartney') suspended: #().
	 
	self evaluarBloque: [customerBook removeCustomerNamed: 'Paul McCartney'] umbralTiempo: (100 * millisecond).
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IB 4/9/2024 00:16:52'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := self setupTestCustomers: #() suspended: #().

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IB 4/9/2024 00:16:46'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
			
	customerBook := self setupTestCustomers: #('John Lennon') suspended: #().
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IB 4/9/2024 10:43:35'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook instanceInfo|
	
	customerBook := self setupTestCustomers: #('Paul McCartney') suspended: #('Paul McCartney').
	
	instanceInfo := self retrieveInfoFrom: customerBook andCheckCustomers: #('Paul McCartney').
	
	self assert: 0 equals: (instanceInfo at:#active).
	self assert: 1 equals: (instanceInfo at:#suspended).
	self assert: 1 equals: (instanceInfo at:#total).
	self assert: (instanceInfo at:#'Paul McCartney').
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IB 4/9/2024 10:45:26'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook instanceInfo |
	
	customerBook := self setupTestCustomers: #('Paul McCartney') suspended: #('Paul McCartney').
	customerBook removeCustomerNamed: 'Paul McCartney'.
	
	instanceInfo := self retrieveInfoFrom: customerBook andCheckCustomers: #('Paul McCartney').
	
	self assert: 0 equals: (instanceInfo at:#active).
	self assert: 0 equals: (instanceInfo at:#suspended).
	self assert: 0 equals: (instanceInfo at:#total).
	self deny: (instanceInfo at: #'Paul McCartney').


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IB 4/9/2024 10:51:24'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook |
			
	customerBook := self setupTestCustomers: #('John Lennon') suspended: #().
	
	[ customerBook suspendCustomerNamed: 'George Harrison'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | | instanceInfo |
			instanceInfo := self retrieveInfoFrom: customerBook andCheckCustomers: #('John Lennon').
			self assert: (instanceInfo at: #total) = 1.
			self assert: (instanceInfo at:#'John Lennon')]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IB 4/9/2024 10:52:24'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook |
			
	customerBook := self setupTestCustomers: #('John Lennon') suspended: #('John Lennon').
	
	[ customerBook suspendCustomerNamed: 'John Lennon'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | | instanceInfo |
			instanceInfo := self retrieveInfoFrom: customerBook andCheckCustomers: #('John Lennon').
			self assert: (instanceInfo at:#total) = 1.
			self assert: (instanceInfo at:#'John Lennon') ]
! !


!CustomerBookTest methodsFor: 'refactors' stamp: 'IB 4/8/2024 21:42:40'!
evaluarBloque:unBloque umbralTiempo:unTiempoEnMilisegundos
	
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	unBloque value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < unTiempoEnMilisegundos.! !

!CustomerBookTest methodsFor: 'refactors' stamp: 'IB 4/9/2024 10:37:18'!
retrieveInfoFrom:customerBook andCheckCustomers: aSetOfCustomers
	| instanceInfo |
	
	instanceInfo := Dictionary new.
	
	instanceInfo add: #active -> customerBook numberOfActiveCustomers.
	instanceInfo add: #suspended -> customerBook numberOfSuspendedCustomers.
	instanceInfo add: #total -> customerBook numberOfCustomers.
	
	aSetOfCustomers do:[:customer |
		instanceInfo add: (customer asSymbol) -> (customerBook includesCustomerNamed: customer).
		].
	
	^instanceInfo.! !

!CustomerBookTest methodsFor: 'refactors' stamp: 'IB 4/8/2024 21:53:26'!
setupTestCustomers: setOfCustomers suspended:subsetOfSuspendedCustomers
	|customerBook|
	customerBook := CustomerBook new.
	
	setOfCustomers do: [:customer | customerBook addCustomerNamed: customer].
	
	subsetOfSuspendedCustomers do: [:customer | customerBook suspendCustomerNamed: customer].
	
	^customerBook .! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:52'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:56'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
