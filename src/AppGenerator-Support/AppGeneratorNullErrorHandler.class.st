Class {
	#name : #AppGeneratorNullErrorHandler,
	#superclass : #Object,
	#category : #'AppGenerator-Support'
}

{ #category : #'as yet unclassified' }
AppGeneratorNullErrorHandler >> unhandledError: anError [

	"I cannot handle, let's kill the image"
	^ false
]
