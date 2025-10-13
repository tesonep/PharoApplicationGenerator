Extension { #name : 'SDL2AthensExample' }

{ #category : '*AppGenerator-Example' }
SDL2AthensExample >> defaultExtent [
	^ 700@500
]

{ #category : '*AppGenerator-Example' }
SDL2AthensExample >> open [
	| attrs |
	attrs := OSWindowAttributes new.
	attrs
		extent: self defaultExtent;
		resizable: false;
		position: 200@200.

	window := OSWindow createWithAttributes: attrs.

	renderer := window newAthensRenderer.

	self initializeFromSurface.

	window eventHandler: (self createEventHandler).

	drawingProcess := self createDrawingProcess
]
