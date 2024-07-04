Class {
	#name : 'ReReturnDifferentTypeRuleTest',
	#superclass : 'ReAbstractRuleTestCase',
	#category : 'General-Rules-Tests-Potential Bugs',
	#package : 'General-Rules-Tests',
	#tag : 'Potential Bugs'
}

{ #category : 'test-helper' }
ReReturnDifferentTypeRuleTest >> method [

	| arg arg2 |
	arg := 3.
	arg2 := #(  ).
	1 > 3 ifTrue: [ ^ arg ].
	^ arg2
]

{ #category : 'tests' }
ReReturnDifferentTypeRuleTest >> testRuleNotViolated [

	| critiques | 
	
	self class compile: 'method ^ 1 ' classified: 'test-helper'.
	[ critiques := self myCritiquesOnMethod: self class >> #method.
	self assertEmpty: critiques ] ensure: [ (self class >> #method) removeFromSystem ]
]

{ #category : 'tests' }
ReReturnDifferentTypeRuleTest >> testRuleNotViolatedWithBlock [

	| critiques | 
	
	self class compile: 'method 1 > 3 ifTrue: [ ^ #() ]. ^ #() ' classified: 'test-helper'.
	[ critiques := self myCritiquesOnMethod: self class >> #method.
	self assertEmpty: critiques ] ensure: [ (self class >> #method) removeFromSystem ]
]

{ #category : 'tests' }
ReReturnDifferentTypeRuleTest >> testRuleWithBlock [

	| critiques | 
	
	self class compile: 'method 1 > 3 ifTrue: [ ^ 3 ]. ^ #() ' classified: 'test-helper'.
	[ critiques := self myCritiquesOnMethod: self class >> #method.
	self assert: critiques size equals: 1 ] ensure: [ (self class >> #method) removeFromSystem ]
]

{ #category : 'tests' }
ReReturnDifferentTypeRuleTest >> testRuleWithManyTempories [

	| critiques | 
	
	self class compile: 'method | arg arg2 | arg := 3. arg2 := #(). 1 > 3 ifTrue: [ ^ arg ]. ^ arg2 ' classified: 'test-helper'.
	[ critiques := self myCritiquesOnMethod: self class >> #method.
	self assert: critiques size equals: 1 ] ensure: [ (self class >> #method)  ]
]

{ #category : 'tests' }
ReReturnDifferentTypeRuleTest >> testRuleWithTempories [

	| critiques | 
	
	self class compile: 'method | arg | arg := 3. 1 > 3 ifTrue: [ ^ arg ]. ^ #() ' classified: 'test-helper'.
	[ critiques := self myCritiquesOnMethod: self class >> #method.
	self assert: critiques size equals: 1 ] ensure: [ (self class >> #method) removeFromSystem ]
]
