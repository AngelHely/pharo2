"
Instance side #finalize method should be in 'finalization' protocol
"
Class {
	#name : 'ReInstanceSideFinalizeMethodProtocolRule',
	#superclass : 'ReProperInstanceMethodProtocolRule',
	#category : 'Renraku-Rules',
	#package : 'Renraku',
	#tag : 'Rules'
}

{ #category : 'accessing' }
ReInstanceSideFinalizeMethodProtocolRule class >> protocolName [

	^ 'finalization'
]

{ #category : 'accessing' }
ReInstanceSideFinalizeMethodProtocolRule class >> selector [

	^ #finalize
]

{ #category : 'accessing - defaults' }
ReInstanceSideFinalizeMethodProtocolRule >> protocolName [

	^ 'finalization'
]

{ #category : 'accessing - defaults' }
ReInstanceSideFinalizeMethodProtocolRule >> selector [

	^ #finalize
]
