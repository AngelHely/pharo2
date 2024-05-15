"
this smell arise when a branch nil useless is detected.
"
Class {
	#name : 'ReNilBranchRule',
	#superclass : 'ReNodeRewriteRule',
	#category : 'General-Rules-Design Flaws',
	#package : 'General-Rules',
	#tag : 'Design Flaws'
}

{ #category : 'accessing' }
ReNilBranchRule >> group [

	^ 'Design Flaws'
]

{ #category : 'initialization' }
ReNilBranchRule >> initialize [

	super initialize
		replace: '`@condition ifTrue: [ `@.statements] ifFalse: [ nil ]'
		with: '`@condition ifTrue: [ `@.statements]';
		replace: '`@condition ifFalse: [ `@.statements] ifTrue: [ nil ]'
		with: '`@condition ifFalse: [ `@.statements]'
]

{ #category : 'accessing' }
ReNilBranchRule >> name [ 

	^ 'branch nil is useless'
]
