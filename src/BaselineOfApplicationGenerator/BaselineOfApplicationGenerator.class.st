Class {
	#name : 'BaselineOfApplicationGenerator',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfApplicationGenerator',
	#package : 'BaselineOfApplicationGenerator'
}

{ #category : 'baselines' }
BaselineOfApplicationGenerator >> baseline: spec [
	<baseline>

	spec for: #common do: [ 
		spec 
			package: 'AppGenerator';
			package: 'AppGenerator-Support';
			package: 'AppGenerator-OSX' with: [ spec requires: #('AppGenerator')];
			package: 'AppGenerator-Windows' with: [ spec requires: #('AppGenerator')];
			package: 'AppGenerator-Example' with: [ spec requires: #('Core')];
			
			group: 'Core' with: #('AppGenerator' 'AppGenerator-Support' 'AppGenerator-Windows' 'AppGenerator-OSX');
			group: 'Support' with: #('AppGenerator-Support');
			group: 'default' with: #('Core' 'Support') ].

	spec
		for: #'pharo11.x'
		do: [ 
			spec package: 'AppGenerator-Support-P11';
				  group: 'Support' with: #('AppGenerator-Support' 'AppGenerator-Support-P11') ]
]
