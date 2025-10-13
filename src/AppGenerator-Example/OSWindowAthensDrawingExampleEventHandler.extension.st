Extension { #name : 'OSWindowAthensDrawingExampleEventHandler' }

{ #category : '*AppGenerator-Example' }
OSWindowAthensDrawingExampleEventHandler >> visitMouseButtonPressEvent: anEvent [
	
	anEvent modifiers shift ifTrue: [ self error: 'Somebody click with shift' ].

	anEvent button = 1
		ifTrue: [ ^ athensExample startStrokeAt: anEvent position ].
				
	athensExample clearStrokes
]
