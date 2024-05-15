"
Manage coding idiom violation rules
"
Class {
	#name : 'ReCodingIdiomViolationRuleManager',
	#superclass : 'ReRuleManager',
	#classInstVars : [
		'civSetting'
	],
	#category : 'Renraku-Utility',
	#package : 'Renraku',
	#tag : 'Utility'
}

{ #category : 'accessing' }
ReCodingIdiomViolationRuleManager class >> civSetting [
	civSetting ifNil: [ civSetting := false ].
	^ civSetting
]

{ #category : 'accessing' }
ReCodingIdiomViolationRuleManager class >> civSetting: anObject [

	civSetting := anObject
]

{ #category : 'setting' }
ReCodingIdiomViolationRuleManager class >> ruleToggleSettingsCodingIdiomViolationRuleOn: aBuilder [
	<systemsettings>
	
	|codingIdiomViolationRules| 
	codingIdiomViolationRules := self visibleRuleClasses select: [ :cl | cl packageTag name = 'Coding Idiom Violation'].
	(aBuilder setting: #civSetting  )
		target: self;
		selector: #enabled;
		default: true;
		iconName: #smallConfiguration;
		label: 'Coding Idiom Violation rules';
		description: 'Select which coding idiom violation rules do you want to see in the live feedback';
		parentName: self ruleToggleGroupID;
		with: [self subSettingsOn: aBuilder with: codingIdiomViolationRules ].

]
