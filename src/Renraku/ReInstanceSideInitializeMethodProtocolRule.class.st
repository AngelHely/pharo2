"
Instance side #initialize method should be in 'initialization' protocol
"
Class {
	#name : 'ReInstanceSideInitializeMethodProtocolRule',
	#superclass : 'ReProperInstanceMethodProtocolRule',
	#category : 'Renraku-Rules',
	#package : 'Renraku',
	#tag : 'Rules'
}

{ #category : 'accessing' }
ReInstanceSideInitializeMethodProtocolRule class >> protocolName [

	^ 'initialization'
]

{ #category : 'accessing' }
ReInstanceSideInitializeMethodProtocolRule class >> selector [

	^ #initialize
]

{ #category : 'accessing - defaults' }
ReInstanceSideInitializeMethodProtocolRule >> protocolName [

	^ 'initialization'
]

{ #category : 'accessing - defaults' }
ReInstanceSideInitializeMethodProtocolRule >> selector [

	^ #initialize
]
