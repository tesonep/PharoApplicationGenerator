Class {
	#name : #AppGeneratorCommandLineHandler,
	#superclass : #CommandLineHandler,
	#category : #'AppGenerator-Example'
}

{ #category : #accessing }
AppGeneratorCommandLineHandler class >> commandName [

	^ 'appGeneratorExample'
]

{ #category : #activation }
AppGeneratorCommandLineHandler >> activate [

	OSWindowDriver current startUp: true.

	SDL2AthensDrawingExample new open.
	
]
