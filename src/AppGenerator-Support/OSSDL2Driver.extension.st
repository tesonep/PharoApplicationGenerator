Extension { #name : 'OSSDL2Driver' }

{ #category : '*AppGenerator-Support' }
OSSDL2Driver >> processEvent: sdlEvent [
	| mappedEvent |

	[
		mappedEvent := sdlEvent mapped.
		self evaluateUserInterrupt: mappedEvent.
		self eventFilter dispatchEvent: mappedEvent
	] on: UnhandledException do: [ :err |
		"It is critical, that event handling keep running despite errors.
		Normally, any errors in event handling requires immediate attention and fixing"
		
		(AppGeneratorSupport unhandledErrorDefaultAction: err exception)
			ifTrue: [ ^ self ].
		
		err freeze.
		[ err debug ] fork.
	 ]
]
