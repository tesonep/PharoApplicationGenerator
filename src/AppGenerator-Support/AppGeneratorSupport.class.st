Class {
	#name : 'AppGeneratorSupport',
	#superclass : 'Object',
	#classVars : [
		'ErrorHandler',
		'WindowTitle'
	],
	#category : 'AppGenerator-Support',
	#package : 'AppGenerator-Support'
}

{ #category : 'default actions' }
AppGeneratorSupport class >> errorHandler [

	^ ErrorHandler ifNil: [ AppGeneratorNullErrorHandler new ]
]

{ #category : 'default actions' }
AppGeneratorSupport class >> errorHandler: anErrorHandler [

	ErrorHandler := anErrorHandler
]

{ #category : 'testing' }
AppGeneratorSupport class >> isEmbedded [ 

	^ Smalltalk argumentsInclude: '--embedded'
		
]

{ #category : 'default actions' }
AppGeneratorSupport class >> unhandledErrorDefaultAction: anException [

	self isEmbedded ifFalse: [ ^ false ].
	
	^ self errorHandler unhandledError: anException.
]

{ #category : 'initialization' }
AppGeneratorSupport class >> windowTitle [

	^ self isEmbedded
		ifTrue: [ WindowTitle ifNil: [ 'Embedded image in working directory: ' , FileLocator workingDirectory fullName ] ]
		ifFalse: [ Smalltalk image imageFile fullName ]
]
