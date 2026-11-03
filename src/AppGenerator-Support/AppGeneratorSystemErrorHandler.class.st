Class {
	#name : 'AppGeneratorSystemErrorHandler',
	#superclass : 'ErrorHandler',
	#instVars : [
		'previousHandler'
	],
	#category : 'AppGenerator-Support',
	#package : 'AppGenerator-Support'
}

{ #category : 'testing' }
AppGeneratorSystemErrorHandler class >> isValidForCurrentSystemConfiguration [

	^ false
]

{ #category : 'error handling' }
AppGeneratorSystemErrorHandler >> handleError: anError log: shouldLog [

	(AppGeneratorSupport errorHandler unhandledError: anError)
		ifTrue: [ ^ self ].
		
	previousHandler handleError: anError log: shouldLog
]

{ #category : 'error handling' }
AppGeneratorSystemErrorHandler >> handleWarning: aWarning [

	(AppGeneratorSupport errorHandler handleWarning: aWarning) ifTrue: [ ^ self ].

	previousHandler handleWarning: aWarning
]

{ #category : 'error handling' }
AppGeneratorSystemErrorHandler >> handleWarningDebugRequest: aWarningDebugRequest fromDebuggerSystem: anOupsDebuggerSystem [

	^ previousHandler handleWarningDebugRequest: aWarningDebugRequest fromDebuggerSystem: anOupsDebuggerSystem
]

{ #category : 'accessing' }
AppGeneratorSystemErrorHandler >> previousHandler: aHandler [

	^ previousHandler := aHandler 
]
