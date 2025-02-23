"
Checks for users of whileTrue: when the shorter to:do: would work.

For example
 
statements1. 
[index <= stop] 
	whileTrue: 
	[ 
	blockStmts1. 
	index := index + 1].
statements2
"
Class {
	#name : 'ReWhileTrueRule',
	#superclass : 'ReNodeMatchRule',
	#category : 'General-Rules-Coding Idiom Violation',
	#package : 'General-Rules',
	#tag : 'Coding Idiom Violation'
}

{ #category : 'accessing' }
ReWhileTrueRule class >> group [
	^ 'Coding Idiom Violation'
]

{ #category : 'accessing' }
ReWhileTrueRule class >> rationale [
	^ 'Checks for users of whileTrue: when the shorter to:do: would work.'
]

{ #category : 'accessing' }
ReWhileTrueRule class >> ruleName [
	^ 'Uses whileTrue: instead of to:do:'
]

{ #category : 'accessing' }
ReWhileTrueRule class >> uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"

	^'WhileTrueRule'
]

{ #category : 'initialization' }
ReWhileTrueRule >> initialize [
	super initialize.
	self matchesAny: #(
			'| `@temps |
			`@.Statements1.
			[`index <= `@stop]
				whileTrue:
					[| `@blockTemps |
					`@.BlockStmts1.
					`index := `index + 1].
			`@.Statements2'
			'| `@temps |
			`@.Statements1.
			[`index < `@stop]
				whileTrue:
					[| `@blockTemps |
					`@.BlockStmts1.
					`index := `index + 1].
			`@.Statements2'
			'| `@temps |
			`@.Statements1.
			[`index >= `@stop]
				whileTrue:
					[| `@blockTemps |
					`@.BlockStmts1.
					`index := `index - 1].
			`@.Statements2'
			'| `@temps |
			`@.Statements1.
			[`index > `@stop]
				whileTrue:
					[| `@blockTemps |
					`@.BlockStmts1.
					`index := `index - 1].
			`@.Statements2' )
]
