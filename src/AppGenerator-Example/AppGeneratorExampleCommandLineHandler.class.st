Class {
	#name : 'AppGeneratorExampleCommandLineHandler',
	#superclass : 'ClapApplication',
	#category : 'AppGenerator-Example',
	#package : 'AppGenerator-Example'
}

{ #category : 'accessing' }
AppGeneratorExampleCommandLineHandler class >> commandSpecification [ 

	<commandline>

	^ (ClapCommandSpec id: #appGeneratorExample)
		description: 'App Generator Example';
		commandClass: self;
		addFlag: #embedded description: 'If we are running embedded';
		yourself
]

{ #category : 'execution' }
AppGeneratorExampleCommandLineHandler >> execute [
	
	OSWindowDriver current startUp: true.
	
	AppGeneratorSupport errorHandler: AppGeneratorSDLMessageErrorHandler new.
	SDL2AthensDrawingExample new open.
	
	self context doNotObeyExits
]
