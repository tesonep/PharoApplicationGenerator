Class {
	#name : #AppGeneratorSDLMessageErrorHandler,
	#superclass : #Object,
	#category : #'AppGenerator-Support'
}

{ #category : #'as yet unclassified' }
AppGeneratorSDLMessageErrorHandler >> unhandledError: anError [

	SDL2
		showSimpleMessageBox: anError messageText
		title: 'An Error has occured...' 
		flags: 16r00000010
		window: ExternalAddress null.
	
	Smalltalk snapshot: false andQuit: true.
		
	^ true
]
