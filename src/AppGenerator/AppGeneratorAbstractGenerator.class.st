Class {
	#name : 'AppGeneratorAbstractGenerator',
	#superclass : 'Object',
	#instVars : [
		'properties',
		'outputDirectory',
		'externalResources'
	],
	#category : 'AppGenerator-Core',
	#package : 'AppGenerator',
	#tag : 'Core'
}

{ #category : 'private' }
AppGeneratorAbstractGenerator class >> repositoryLocation [

	^ (IceRepository repositoryNamed: 'PharoApplicationGenerator') location
]

{ #category : 'external resources' }
AppGeneratorAbstractGenerator >> addExternalDirectory: origin [ 
	
	externalResources add: (AppGeneratorFileResource new
			 generator: self;
			 origin: origin asFileReference;
			 beDirectory;
			 yourself)
]

{ #category : 'external resources' }
AppGeneratorAbstractGenerator >> addExternalDirectory: origin destination: destination [
	
	externalResources add: (AppGeneratorFileResource new
			 generator: self;
			 origin: origin asFileReference;
			 destination: destination asFileReference;
			 beDirectory;
			 yourself)
]

{ #category : 'external resources' }
AppGeneratorAbstractGenerator >> addExternalFile: externalFileLocation [

	externalResources add: (AppGeneratorFileResource new
			 generator: self;
			 origin: externalFileLocation;
			 yourself)
]

{ #category : 'external resources' }
AppGeneratorAbstractGenerator >> addExternalFile: origin destination: destination [

	externalResources add: (AppGeneratorFileResource new
			 generator: self;
			 origin: origin asFileReference;
			 destination: destination asFileReference;
			 yourself)
]

{ #category : 'accessing' }
AppGeneratorAbstractGenerator >> appName [
	
	^ properties at: #AppName
]

{ #category : 'external resources' }
AppGeneratorAbstractGenerator >> copyExternalResources [
	
	externalResources ifEmpty: [ ^ self ].

	self externalResourceTargetDirectory ensureCreateDirectory.
	
	externalResources do: [ :anExternalResource | anExternalResource copyToDestination ].
]

{ #category : 'copying' }
AppGeneratorAbstractGenerator >> copyTemplate: inputTemplate to: outputFile [

	| generatedContent template |
	template := inputTemplate contents.
	generatedContent := template format: properties.
	outputFile writeStreamDo: [ :s |
		s truncate.
		s nextPutAll: generatedContent ]
]

{ #category : 'external resources' }
AppGeneratorAbstractGenerator >> externalResourceTargetDirectory [

	^ outputDirectory / 'output'
]

{ #category : 'utilities' }
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
	properties at: #VMType ifAbsentPut: 'headless'

]

{ #category : 'translating' }
AppGeneratorAbstractGenerator >> generate [

	self fillWithDefaults.

	outputDirectory ensureCreateDirectory. 
	self copyExternalResources

]

{ #category : 'initialization' }
AppGeneratorAbstractGenerator >> initialize [

	super initialize.
	externalResources := OrderedCollection new
]

{ #category : 'accessing' }
AppGeneratorAbstractGenerator >> outputDirectory: aFileReference [ 
	
	outputDirectory := aFileReference
]

{ #category : 'accessing' }
AppGeneratorAbstractGenerator >> properties: aCollection [ 
	
	properties := aCollection
]

{ #category : 'accessing' }
AppGeneratorAbstractGenerator >> templateDirectory [
	
	^ self class repositoryLocation / 'templates' / self platformName
]
