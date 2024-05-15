"
Manage bugs rules
"
Class {
	#name : 'ReBugsRuleManager',
	#superclass : 'ReRuleManager',
	#classInstVars : [
		'bugsSetting'
	],
	#category : 'Renraku-Utility',
	#package : 'Renraku',
	#tag : 'Utility'
}

{ #category : 'accessing' }
ReBugsRuleManager class >> bugsSetting [
	bugsSetting ifNil: [ bugsSetting:= false ].
	^ bugsSetting
]

{ #category : 'accessing' }
ReBugsRuleManager class >> bugsSetting: anObject [

	bugsSetting := anObject
]

{ #category : 'setting' }
ReBugsRuleManager class >> ruleToggleSettingsBugsRuleOn: aBuilder [
	<systemsettings>
	
	|bugsRules| 
	bugsRules := self visibleRuleClasses select: [ :cl | cl packageTag name = 'Bugs'].
	(aBuilder setting: #bugsSetting  )
		target: self;
		selector: #enabled;
		default: true;
		iconName: #smallConfiguration;
		label: 'Bugs rules';
		description: 'Select which bugs rules do you want to see in the live feedback';
		parentName: self ruleToggleGroupID;
		with: [ self subSettingsOn: aBuilder with: bugsRules ].

]
