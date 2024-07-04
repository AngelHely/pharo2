"
This rule verify that the method don't return differents types (e.g, a return with an integer and a return with a String) 
"
Class {
	#name : 'ReReturnDifferentTypeRule',
	#superclass : 'ReAbstractRule',
	#instVars : [
		'finderClass',
		'browserEnvironment'
	],
	#category : 'General-Rules-Potential Bugs',
	#package : 'General-Rules',
	#tag : 'Potential Bugs'
}

{ #category : 'testing - interest' }
ReReturnDifferentTypeRule class >> checksMethod [ 

	^ true
]

{ #category : 'accessing' }
ReReturnDifferentTypeRule class >> group [ 

	^ 'Potential Bug'
]

{ #category : 'accessing' }
ReReturnDifferentTypeRule class >> ruleName [ 

	^ 'There are different types returned in the method'
]

{ #category : 'adding' }
ReReturnDifferentTypeRule >> addReturnIn: aCollection fromBlockNodes: blockNodes [

	blockNodes do: [ :block |
		block statements collect: [ :statement |
			statement class = RBReturnNode ifTrue: [
				aCollection add: statement ] ] ]
]

{ #category : 'running' }
ReReturnDifferentTypeRule >> basicCheck: aMethod [

	| ast returnList |
	((aMethod pragmas collect: [ :pragma | pragma selector ]) includes: 'diffTypeReturn') ifTrue: [ ^ false ] .
	ast := aMethod methodNode.
	ast containsReturn ifFalse: [ ^ false ]. 
	returnList := ast statements select: [ :statement | statement class = RBReturnNode ].
	ast hasBlock ifTrue: [ self addReturnIn: returnList fromBlockNodes: ast blockNodes ].
	returnList size = 1 ifTrue: [ ^ false ].
	^ returnList anySatisfy: [ :return | (self typeOf: return equalTypeOf: returnList first) not]
]

{ #category : 'accessing' }
ReReturnDifferentTypeRule >> browserEnvironment [

	^ browserEnvironment
]

{ #category : 'accessing' }
ReReturnDifferentTypeRule >> finderClass [

	^ finderClass
]

{ #category : 'initialization' }
ReReturnDifferentTypeRule >> initialize [ 

	super initialize.
	finderClass := StFinderClassSearch new.
	browserEnvironment := RBBrowserEnvironment new.
]

{ #category : 'element - list' }
ReReturnDifferentTypeRule >> selectorBoolean [

	^ #(#and: #or: #& #| #not #xor #eqv: #==> #>= #> #< #<= #anySatisfy: #detect: ) 

	
]

{ #category : 'private' }
ReReturnDifferentTypeRule >> typeOf: anMessage [

	<diffTypeReturn>
	(self selectorBoolean includes: anMessage selector ) ifTrue: [ ^ Boolean ].
	anMessage selector = #new ifTrue: [ ^ (self finderClass searchByStringExactSensitiveCase: (anMessage receiver name asString) in:  self browserEnvironment) first content. ]

	
]

{ #category : 'testing' }
ReReturnDifferentTypeRule >> typeOf: anObject equalTypeOf: anotherObject [

	| object1 object2 |

	object1 := anObject value isMessage
		           ifTrue: [ self typeOf: anObject value ]
		           ifFalse: [ anObject value value class superclass ].
	object2 := anotherObject value isMessage
		           ifTrue: [ self typeOf: anotherObject value ]
		           ifFalse: [ anotherObject value value class superclass ].
	^ object1 = object2
]
