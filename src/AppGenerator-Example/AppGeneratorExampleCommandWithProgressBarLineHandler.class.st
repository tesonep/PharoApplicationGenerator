Class {
	#name : 'AppGeneratorExampleCommandWithProgressBarLineHandler',
	#superclass : 'ClapApplication',
	#category : 'AppGenerator-Example',
	#package : 'AppGenerator-Example'
}

{ #category : 'accessing' }
AppGeneratorExampleCommandWithProgressBarLineHandler class >> commandSpecification [ 

	<commandline>

	^ (ClapCommandSpec id: #appGeneratorExampleWithProgressBar)
		description: 'App Generator Example with ProgressBar';
		commandClass: self;
		addFlag: #embedded description: 'If we are running embedded';
		yourself
]

{ #category : 'activation' }
AppGeneratorExampleCommandWithProgressBarLineHandler >> applicationLoadingEnded [

	<primitive: primitiveApplicationLoadingEnded>
	
	self primitiveFailed
]

{ #category : 'activation' }
AppGeneratorExampleCommandWithProgressBarLineHandler >> applicationLoadingProgress: aValue [

	<primitive: primitiveApplicationLoadingProgress>
	
	self primitiveFailed
]

{ #category : 'execution' }
AppGeneratorExampleCommandWithProgressBarLineHandler >> execute [

	0 to: 100 by: 5 do: [ :i |
		self applicationLoadingProgress: i.
		0.5 second wait ].
	
	OSWindowDriver current startUp: true.
	
	AppGeneratorSupport errorHandler: AppGeneratorSDLMessageErrorHandler new.
	SDL2AthensDrawingExample new open.
	
	self applicationLoadingEnded.
	
	self context doNotObeyExits
]
