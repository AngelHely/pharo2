"
Manage Optimization rules
"
Class {
	#name : 'ReOptimizationRuleManager',
	#superclass : 'ReRuleManager',
	#classInstVars : [
		'optimizationSetting'
	],
	#category : 'Renraku-Utility',
	#package : 'Renraku',
	#tag : 'Utility'
}

{ #category : 'accessing' }
ReOptimizationRuleManager class >> optimizationSetting [
	optimizationSetting ifNil: [ optimizationSetting:= false ].
	^ optimizationSetting
]

{ #category : 'accessing' }
ReOptimizationRuleManager class >> optimizationSetting: anObject [

	optimizationSetting := anObject
]

{ #category : 'settings' }
ReOptimizationRuleManager class >> ruleToggleSettingsOptimzationRuleOn: aBuilder [
	<systemsettings>
	
	|optimizationRules| 
	optimizationRules := self visibleRuleClasses select: [ :cl | cl packageTag name = 'Optimization'].
	(aBuilder setting: #optimizationSetting )
		target: self;
		selector: #enabled;
		default: true;
		iconName: #smallConfiguration;
		label: 'Optimization rules';
		description: 'Select which optimization rules do you want to see in the live feedback';
		parentName: self ruleToggleGroupID ;
		with: [ self subSettingsOn: aBuilder with: optimizationRules ].

]
