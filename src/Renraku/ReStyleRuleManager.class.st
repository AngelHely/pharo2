"
Manage style rules
"
Class {
	#name : 'ReStyleRuleManager',
	#superclass : 'ReRuleManager',
	#classInstVars : [
		'styleSetting'
	],
	#category : 'Renraku-Utility',
	#package : 'Renraku',
	#tag : 'Utility'
}

{ #category : 'settings' }
ReStyleRuleManager class >> ruleToggleSettingsOptimzationRuleOn: aBuilder [

	<systemsettings>
	| styleRules |
	styleRules := self visibleRuleClasses select: [ :cl |
		              cl packageTag name = 'Style' ].
	(aBuilder setting: #styleSetting)
		target: self;
		selector: #enabled;
		default: true;
		iconName: #smallConfiguration;
		label: 'Style rules';
		description:
			'Select which style rules do you want to see in the live feedback';
		parentName: self ruleToggleGroupID;
		with: [ self subSettingsOn: aBuilder with: styleRules ]
]

{ #category : 'accessing' }
ReStyleRuleManager class >> styleSetting [
	styleSetting ifNil: [ styleSetting:= false ].
	^ styleSetting
]

{ #category : 'accessing' }
ReStyleRuleManager class >> styleSetting: anObject [

	styleSetting := anObject
]
