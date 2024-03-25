Class {
	#name : #AppGeneratorExample,
	#superclass : #Object,
	#category : #'AppGenerator-Example'
}

{ #category : #'as yet unclassified' }
AppGeneratorExample class >> generateWindowsExample [
	AppGeneratorWindowsGenerator new
		properties: {
			#AppName -> 'ATest'.
			#InfoString -> 'A Test'.
			#BundleIdentifier -> 'org.pharo.testApp'.
			#ShortVersion -> '1.0.0'.
			#DisplayName -> 'TestApp'.
			#CommandLineHandler -> 'embeddedExample'.
			#IconFile -> self iconFile.
			#CompanyName -> 'Pharo Consortium'.
			#LegalCopyright -> 'Copyright \251 https://www.pharo.org 2023\0'
		} asDictionary;
		outputDirectory: FileLocator workingDirectory / 'testApp' / 'build';
		generate
]

{ #category : #'as yet unclassified' }
AppGeneratorExample class >> iconFile [
		
	^ AppGeneratorAbstractGenerator repositoryLocation / 'exampleResources' / 'ballon.ico'
]
