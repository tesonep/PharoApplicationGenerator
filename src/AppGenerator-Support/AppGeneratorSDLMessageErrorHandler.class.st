Class {
	#name : 'AppGeneratorSDLMessageErrorHandler',
	#superclass : 'Object',
	#category : 'AppGenerator-Support',
	#package : 'AppGenerator-Support'
}

{ #category : 'error handling' }
AppGeneratorSDLMessageErrorHandler >> handleWarning: aWarning [

	SDL2
		showSimpleMessageBox: aWarning messageText
		title: 'An Warning has occured...' 
		flags: 16r00000020
		window: ExternalAddress null.
			
	^ true
]

{ #category : 'error handling' }
AppGeneratorSDLMessageErrorHandler >> unhandledError: anError [

	SDL2
		showSimpleMessageBox: anError messageText
		title: 'An Error has occured...' 
		flags: 16r00000010
		window: ExternalAddress null.
	
	Smalltalk snapshot: false andQuit: true.
		
	^ true
]
