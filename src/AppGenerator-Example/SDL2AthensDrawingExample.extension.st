Extension { #name : 'SDL2AthensDrawingExample' }

{ #category : '*AppGenerator-Example' }
SDL2AthensDrawingExample >> redraw [
	| font |
	self clearSurface.
	renderer drawDuring: [ :canvas | 
		font := LogicalFont familyName: 'Source Sans Pro' pointSize: 14.
		canvas pathTransform translateX: 0 Y: 25.
		canvas setPaint: Color black.
		canvas setFont: font.
		canvas drawString: 'Left-Click to draw, Shift-Click to produce error, RightClick to clear'].
	strokes
		do:
			[ :stroke |
			| path |
			path := renderer athensSurface
				createPath: [ :builder |
					builder
						absolute;
						moveTo: stroke first.
					stroke do: [ :point | builder lineTo: point ] ].
			renderer drawDuring: [ :canvas |
					canvas
						setStrokePaint: Color black;
						setShape: path;
						draw ] ]
]
