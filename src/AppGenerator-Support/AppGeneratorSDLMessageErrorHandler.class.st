Class {
	#name : #AppGeneratorSDLMessageErrorHandler,
	#superclass : #Object,
	#category : #'AppGenerator-Support'
}

{ #category : #'as yet unclassified' }
AppGeneratorSDLMessageErrorHandler >> unhandledError: anError [

	SDL2
		showSimpleMessageBox: anError messageText utf8Encoded
		title: 'An Error has occured...' utf8Encoded 
		flags: 16r00000010
		window: ExternalAddress null.
	
	Smalltalk snapshot: false andQuit: true.
		
	^ true
]
