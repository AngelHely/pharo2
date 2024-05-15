"
Manage design flaws rules
"
Class {
	#name : 'ReDesignFlawsRuleManager',
	#superclass : 'ReRuleManager',
	#classInstVars : [
		'designFlawsSetting'
	],
	#category : 'Renraku-Utility',
	#package : 'Renraku',
	#tag : 'Utility'
}

{ #category : 'accessing' }
ReDesignFlawsRuleManager class >> designFlawsSetting [
	designFlawsSetting ifNil: [ designFlawsSetting := false ].
	^ designFlawsSetting
]

{ #category : 'accessing' }
ReDesignFlawsRuleManager class >> designFlawsSetting: anObject [

	designFlawsSetting := anObject
]

{ #category : 'setting' }
ReDesignFlawsRuleManager class >> ruleToggleSettingsDesignFlawsRuleOn: aBuilder [
	<systemsettings>
	
	|designFlawsRules| 
	designFlawsRules := self visibleRuleClasses select: [ :cl | cl packageTag name = 'Design Flaws'].
	(aBuilder setting: #designFlawsSetting  )
		target: self;
		selector: #enabled;
		default: true;
		iconName: #smallConfiguration;
		label: 'Design Flaws rules';
		description: 'Select which design flaws rules do you want to see in the live feedback';
		parentName: self ruleToggleGroupID;
		with: [ self subSettingsOn: aBuilder  with: designFlawsRules ].

]
