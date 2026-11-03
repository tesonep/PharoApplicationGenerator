Class {
	#name : 'AppGeneratorNullErrorHandler',
	#superclass : 'Object',
	#category : 'AppGenerator-Support',
	#package : 'AppGenerator-Support'
}

{ #category : 'error handling' }
AppGeneratorNullErrorHandler >> handleWarning: aWarning [

	"I cannot handle, let's do the default action"
	^ false
]

{ #category : 'error handling' }
AppGeneratorNullErrorHandler >> unhandledError: anError [

	"I cannot handle, let's kill the image"
	^ false
]
