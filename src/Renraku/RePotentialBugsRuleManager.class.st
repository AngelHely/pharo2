"
Manage potential bugs rules
"
Class {
	#name : 'RePotentialBugsRuleManager',
	#superclass : 'ReRuleManager',
	#classInstVars : [
		'potentialBugsSetting'
	],
	#category : 'Renraku-Utility',
	#package : 'Renraku',
	#tag : 'Utility'
}

{ #category : 'accessing' }
RePotentialBugsRuleManager class >> potentialBugsSetting [
	potentialBugsSetting ifNil: [ potentialBugsSetting:= false ].
	^ potentialBugsSetting
]

{ #category : 'accessing' }
RePotentialBugsRuleManager class >> potentialBugsSetting: anObject [

	potentialBugsSetting := anObject
]

{ #category : 'setting' }
RePotentialBugsRuleManager class >> ruleToggleSettingsPotentialBugsRuleOn: aBuilder [
	<systemsettings>
	
	|potentialBugsRules| 
	potentialBugsRules := self visibleRuleClasses select: [ :cl | cl packageTag name = 'Potential Bugs'].
	(aBuilder setting: #potentialBugsSetting  )
		target: self;
		selector: #enabled;
		default: true;
		iconName: #smallConfiguration;
		label: 'Potential Bugs rules';
		description: 'Select which potential bugs rules do you want to see in the live feedback';
		parentName: self ruleToggleGroupID;
		with: [ self subSettingsOn: aBuilder with: potentialBugsRules ].

]
