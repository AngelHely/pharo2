"
Instance side #= method should be in 'comparing' protocol
"
Class {
	#name : 'ReInstanceSideEqualsMethodProtocolRule',
	#superclass : 'ReProperInstanceMethodProtocolRule',
	#category : 'Renraku-Rules',
	#package : 'Renraku',
	#tag : 'Rules'
}

{ #category : 'accessing' }
ReInstanceSideEqualsMethodProtocolRule class >> protocolName [

	^ 'comparing'
]

{ #category : 'accessing' }
ReInstanceSideEqualsMethodProtocolRule class >> selector [

	^ #=
]

{ #category : 'accessing - defaults' }
ReInstanceSideEqualsMethodProtocolRule >> protocolName [

	^ 'comparing'
]

{ #category : 'accessing - defaults' }
ReInstanceSideEqualsMethodProtocolRule >> selector [

	^ #=
]
