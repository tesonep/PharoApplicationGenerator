Class {
	#name : 'AppGeneratorSupport',
	#superclass : 'Object',
	#classVars : [
		'AfterWindowTitleSetBlock',
		'AppErrorHandler',
		'WindowTitle',
		'WorldIcon'
	],
	#category : 'AppGenerator-Support',
	#package : 'AppGenerator-Support'
}

{ #category : 'initialization' }
AppGeneratorSupport class >> afterWindowOpenedWithImageFile: imageFile onWindow: osWindow onDriver: driver [

	^ (self isEmbedded and: [ AfterWindowTitleSetBlock isNotNil ])
		  ifTrue: [ AfterWindowTitleSetBlock value: driver value: osWindow ]
		  ifFalse: [ driver afterSetWindowTitle: imageFile onWindow: osWindow ]
]

{ #category : 'default actions' }
AppGeneratorSupport class >> checkSystemErrorHandler [

	| systemErrorHandler |
	
	ErrorHandler default class = AppGeneratorSystemErrorHandler ifTrue: [ ^ self ].
	
	systemErrorHandler := AppGeneratorSystemErrorHandler new.
	systemErrorHandler previousHandler: ErrorHandler default.
	
	ErrorHandler default: systemErrorHandler
]

{ #category : 'default actions' }
AppGeneratorSupport class >> errorHandler [

	^ AppErrorHandler ifNil: [ AppGeneratorNullErrorHandler new ]
]

{ #category : 'default actions' }
AppGeneratorSupport class >> errorHandler: anErrorHandler [

	AppErrorHandler := anErrorHandler.
	self checkSystemErrorHandler
]

{ #category : 'testing' }
AppGeneratorSupport class >> isEmbedded [ 

	^ Smalltalk arguments includes: '--embedded'
]

{ #category : 'error handling' }
AppGeneratorSupport class >> unhandledErrorDefaultAction: anException [

	(anException isKindOf: Warning)
		ifTrue: [  ErrorHandler default handleWarning: anException ]
		ifFalse: [ ErrorHandler default handleError: anException ].

	^ true
]

{ #category : 'initialization' }
AppGeneratorSupport class >> whenWorldWindowTitleChangedDo: aBlock [

	AfterWindowTitleSetBlock := aBlock
]

{ #category : 'initialization' }
AppGeneratorSupport class >> windowTitle [

	^ self isEmbedded
		ifTrue: [ WindowTitle ifNil: [ 'Embedded image in working directory: ' , FileLocator workingDirectory fullName ] ]
		ifFalse: [ Smalltalk image imageFile fullName ]
]

{ #category : 'initialization' }
AppGeneratorSupport class >> windowTitle: aTitle [

	WindowTitle := aTitle
]

{ #category : 'initialization' }
AppGeneratorSupport class >> worldIcon [

	^ (self isEmbedded and: [ WorldIcon isNotNil ])
		ifTrue: [ WorldIcon ]
		ifFalse: [ Smalltalk ui icons iconNamed: #pharoBig ]
]

{ #category : 'initialization' }
AppGeneratorSupport class >> worldIcon: aForm [

	WorldIcon := aForm
]
