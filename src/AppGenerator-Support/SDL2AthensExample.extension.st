Extension { #name : #SDL2AthensExample }

{ #category : #'*AppGenerator-Support' }
SDL2AthensExample >> destroy [
	"This function must be called when the window is closed"
	drawingProcess terminate.
	Smalltalk quitPrimitive
]
