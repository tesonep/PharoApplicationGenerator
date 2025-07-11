Class {
	#name : 'AppGeneratorFileResource',
	#superclass : 'Object',
	#instVars : [
		'generator',
		'origin',
		'destination'
	],
	#category : 'AppGenerator-Resources',
	#package : 'AppGenerator',
	#tag : 'Resources'
}

{ #category : 'as yet unclassified' }
AppGeneratorFileResource >> beDirectory [

	self assert: origin isDirectory 
]

{ #category : 'copying' }
AppGeneratorFileResource >> copyDirectory [
	
	| dest |
	
	dest := self resolvedDestination / origin basename.
	dest ensureCreateDirectory.
	dest ensureDeleteAllChildren.
	
	CopyVisitor copy: origin to: dest 

]

{ #category : 'copying' }
AppGeneratorFileResource >> copyFile [
	
	| destFile |
	
	destFile := self resolvedDestination isDirectory 
		ifTrue: [ self resolvedDestination / origin basename ]
		ifFalse: [ self resolvedDestination ].
	
	destFile parent ensureCreateDirectory.
	destFile ensureDelete.
	origin copyTo: destFile
]

{ #category : 'copying' }
AppGeneratorFileResource >> copyToDestination [
	
	self assert: origin exists.

	self isDirectory 
		ifTrue: [ self copyDirectory ]
		ifFalse: [ self copyFile ].
]

{ #category : 'accessing' }
AppGeneratorFileResource >> destination: aFileReference [ 
	destination := aFileReference
]

{ #category : 'accessing' }
AppGeneratorFileResource >> generator: anAppGeneratorOSXGenerator [ 
	generator := anAppGeneratorOSXGenerator
]

{ #category : 'testing' }
AppGeneratorFileResource >> isDirectory [
	
	^ origin isDirectory 
]

{ #category : 'accessing' }
AppGeneratorFileResource >> origin: aFileLocator [ 
	origin := aFileLocator
]

{ #category : 'accessing' }
AppGeneratorFileResource >> resolvedDestination [

	^ destination
		  ifNil: [ generator externalResourceTargetDirectory ]
		  ifNotNil: [ generator externalResourceTargetDirectory resolve: destination ]
]
