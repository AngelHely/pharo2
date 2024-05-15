"
Manage clean code rules
"
Class {
	#name : 'ReCleanCodeRuleManager',
	#superclass : 'ReRuleManager',
	#classInstVars : [
		'cleanCodeSetting'
	],
	#category : 'Renraku-Utility',
	#package : 'Renraku',
	#tag : 'Utility'
}

{ #category : 'accessing' }
ReCleanCodeRuleManager class >> cleanCodeSetting [
	cleanCodeSetting ifNil: [ cleanCodeSetting:= false ].
	^ cleanCodeSetting
]

{ #category : 'accessing' }
ReCleanCodeRuleManager class >> cleanCodeSetting: anObject [

	cleanCodeSetting := anObject
]

{ #category : 'setting' }
ReCleanCodeRuleManager class >> ruleToggleSettingsCleanCodeRuleOn: aBuilder [
	<systemsettings>
	
	|cleanCodeRules| 
	cleanCodeRules := self visibleRuleClasses select: [ :cl | cl packageTag name = 'Clean Code'].
	(aBuilder setting: #cleanCodeSetting  )
		target: self;
		selector: #enabled;
		default: true;
		iconName: #smallConfiguration;
		label: 'Clean Code rules';
		description: 'Select which clean code rules do you want to see in the live feedback';
		parentName: self ruleToggleGroupID;
		with: [ self subSettingsOn: aBuilder with: cleanCodeRules ].

]
