Class {
	#name : #BaselineOfApplicationGenerator,
	#superclass : #BaselineOf,
	#category : #BaselineOfApplicationGenerator
}

{ #category : #baselines }
BaselineOfApplicationGenerator >> baseline: spec [
	<baseline>

	spec for: #common do: [ 
		spec 
			package: 'AppGenerator-Support';
			package: 'AppGenerator-Example';
			package: 'AppGenerator-OSX';
			package: 'AppGenerator-Windows' ].

	spec
		for: #'pharo11.x'
		do: [ spec package: 'AppGenerator-Support-P11' ]
]
