Class {
	#name : 'AppGeneratorExampleCommandLineHandler',
	#superclass : 'CommandLineHandler',
	#category : 'AppGenerator-Example',
	#package : 'AppGenerator-Example'
}

{ #category : 'accessing' }
AppGeneratorExampleCommandLineHandler class >> commandName [

	^ 'appGeneratorExample'
]

{ #category : 'activation' }
AppGeneratorExampleCommandLineHandler >> activate [

	OSWindowDriver current startUp: true.
	
	AppGeneratorSupport errorHandler: AppGeneratorSDLMessageErrorHandler new.
	SDL2AthensDrawingExample new open.
	
]
