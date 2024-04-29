!classDefinition: #MyLinkedListTest category: #'Stack-Exercise'!
TestCase subclass: #MyLinkedListTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!MyLinkedListTest methodsFor: 'test' stamp: 'IB 4/21/2024 22:30:15'!
test01LinkedListShouldBeEmptyWhenCreated
	| list |
	list := MyLinkedList new.
	
	self assert: list class = EndNode.! !

!MyLinkedListTest methodsFor: 'test' stamp: 'IB 4/21/2024 22:35:04'!
test02AddingAnElementShouldHaveANewNode
	| list node |
	list := MyLinkedList new.
	
	node := Node with: 'aValue' before: list.
	
	self assert: node value = 'aValue'.
	self assert: node next class = EndNode.! !


!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #MyLinkedList category: #'Stack-Exercise'!
Object subclass: #MyLinkedList
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!MyLinkedList methodsFor: 'accessing' stamp: 'IB 4/21/2024 21:29:24'!
next
	^self subclassResponsibility.! !

!MyLinkedList methodsFor: 'accessing' stamp: 'IB 4/21/2024 21:29:27'!
value
	^self subclassResponsibility.! !


!MyLinkedList methodsFor: 'comparing' stamp: 'IB 4/21/2024 22:50:09'!
isEndNode

	^self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MyLinkedList class' category: #'Stack-Exercise'!
MyLinkedList class
	instanceVariableNames: ''!

!MyLinkedList class methodsFor: 'instance creation' stamp: 'IB 4/21/2024 22:21:24'!
new
	^EndNode new.! !


!classDefinition: #EndNode category: #'Stack-Exercise'!
MyLinkedList subclass: #EndNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EndNode methodsFor: 'accessing' stamp: 'IB 4/21/2024 21:25:30'!
next
	^self error: EndNode noNextElementError.! !

!EndNode methodsFor: 'accessing' stamp: 'IB 4/21/2024 21:26:15'!
value
	^self error: EndNode noValueError.! !


!EndNode methodsFor: 'comparing' stamp: 'IB 4/21/2024 22:37:22'!
isEndNode
	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EndNode class' category: #'Stack-Exercise'!
EndNode class
	instanceVariableNames: 'uniqueInstance'!

!EndNode class methodsFor: 'initialization' stamp: 'IB 4/21/2024 22:22:06'!
initialize

	uniqueInstance := self basicNew! !


!EndNode class methodsFor: 'instance creation' stamp: 'IB 4/21/2024 22:24:50'!
new
	^ self basicNew initialize! !


!EndNode class methodsFor: 'error handling' stamp: 'IB 4/21/2024 21:24:51'!
noNextElementError
	^'End node has no more elements'! !

!EndNode class methodsFor: 'error handling' stamp: 'IB 4/21/2024 23:04:00'!
noValueError
	^'stack is empty!!!!!!'
	"
	TODO: ver cómo hacer para que no haya acoplamiento entre el stack y la linked list...
	Lo ideal sería que desde el stack, al ver que te da este error, mapearlo a su error.
	El problema es que estaríamos usando on: do: // ifTrue: ifFalse:
	
	Básicamente habría que cambiar para NO hacer linked list y simplemente hacer todo en el stack
	"! !


!classDefinition: #Node category: #'Stack-Exercise'!
MyLinkedList subclass: #Node
	instanceVariableNames: 'nextNode nodeValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'accessing' stamp: 'IB 4/21/2024 21:07:30'!
next
	^nextNode! !

!Node methodsFor: 'accessing' stamp: 'IB 4/21/2024 21:07:13'!
value
	^nodeValue! !


!Node methodsFor: 'comparing' stamp: 'IB 4/21/2024 22:37:40'!
isEndNode
	^false! !


!Node methodsFor: 'initialization' stamp: 'IB 4/21/2024 21:27:19'!
initializeWith: aNodeValue before: aNode
	nodeValue := aNodeValue.
	nextNode := aNode.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Node class' category: #'Stack-Exercise'!
Node class
	instanceVariableNames: ''!

!Node class methodsFor: 'instance creation' stamp: 'IB 4/21/2024 21:40:48'!
with: aValue before: aNode
	^self basicNew initializeWith: aValue before: aNode.
	! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topNode stackSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'comparing' stamp: 'IB 4/21/2024 22:49:08'!
isEmpty
	^topNode isEndNode.
	"Alternativamente, stackSize = 0"! !

!OOStack methodsFor: 'comparing' stamp: 'IB 4/21/2024 22:39:13'!
size
	^stackSize! !


!OOStack methodsFor: 'initialization' stamp: 'IB 4/21/2024 22:39:02'!
initialize
	topNode := MyLinkedList new.
	stackSize := 0.! !


!OOStack methodsFor: 'operations' stamp: 'IB 4/21/2024 22:41:17'!
pop
	| popped |
	popped := self top.
	stackSize := stackSize - 1.
	topNode := topNode next.
	^popped! !

!OOStack methodsFor: 'operations' stamp: 'IB 4/21/2024 22:42:39'!
push: anElement
	topNode := Node with: anElement before: topNode.
	stackSize := stackSize + 1.! !

!OOStack methodsFor: 'operations' stamp: 'IB 4/21/2024 22:40:27'!
top
	^topNode value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

EndNode initialize!