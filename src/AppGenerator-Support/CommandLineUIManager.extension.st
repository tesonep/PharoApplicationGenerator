Extension { #name : #CommandLineUIManager }

{ #category : #'*AppGenerator-Support' }
CommandLineUIManager >> unhandledErrorDefaultAction: anException [


	"If handled"
	(AppGeneratorSupport unhandledErrorDefaultAction: anException)
		ifTrue: [ ^ self ].
		
	self quitFrom: anException signalerContext  withMessage: anException description.
	
	UIManager default == self ifFalse: [
		^ UIManager default unhandledErrorDefaultAction: anException
		]
]
