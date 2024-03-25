Class {
	#name : #AppGeneratorAbstractGenerator,
	#superclass : #Object,
	#instVars : [
		'properties',
		'outputDirectory'
	],
	#category : #'AppGenerator-Support'
}

{ #category : #private }
AppGeneratorAbstractGenerator class >> repositoryLocation [

	^ (IceRepository repositoryNamed: 'PharoApplicationGenerator') location
]

{ #category : #accessing }
AppGeneratorAbstractGenerator >> appName [
	
	^ properties at: #AppName
]

{ #category : #copying }
AppGeneratorAbstractGenerator >> copyTemplate: inputTemplate to: outputFile [

	| generatedContent template |
	template := inputTemplate contents.
	generatedContent := template format: properties.
	outputFile writeStreamDo: [ :s |
		s truncate.
		s nextPutAll: generatedContent ]
]

{ #category : #utilities }
AppGeneratorAbstractGenerator >> fillWithDefaults [
	
	properties at: #AppName ifAbsentPut: 'MyApp'.
	properties at: #InfoString ifAbsentPut: 'My Test Application'.

	properties at: #ShortVersion ifAbsentPut: '0.0.1'.
	properties at: #Version ifAbsentPut: (properties at: #ShortVersion).
	properties at: #DisplayName ifAbsentPut: 'My App'.

	properties at: #ImageFile ifAbsentPut: Smalltalk imageFile.
	properties at: #ImageName ifAbsentPut: (properties at: #ImageFile) basename.
	properties at: #ImageDir ifAbsentPut: (properties at: #ImageFile) resolve parent fullName.
	properties at: #ChangesName ifAbsentPut: ((properties at: #ImageFile) resolve withExtension: 'changes') basename.

	properties at: #CommandLineHandler ifAbsentPut: 'appGeneratorExample'.

	properties at: #VMIncludeZipFile ifAbsentPut: 'latest10.zip'.	
	properties at: #VMZipFile ifAbsentPut: 'latest10.zip'.	

]

{ #category : #translating }
AppGeneratorAbstractGenerator >> generate [

	self fillWithDefaults.

	outputDirectory ensureCreateDirectory. 

]

{ #category : #accessing }
AppGeneratorAbstractGenerator >> outputDirectory: aFileReference [ 
	
	outputDirectory := aFileReference
]

{ #category : #accessing }
AppGeneratorAbstractGenerator >> properties: aCollection [ 
	
	properties := aCollection
]

{ #category : #accessing }
AppGeneratorAbstractGenerator >> templateDirectory [
	
	^ self class repositoryLocation / 'templates' / self platformName
]
