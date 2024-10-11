Class {
	#name : 'AppGeneratorExample',
	#superclass : 'Object',
	#category : 'AppGenerator-Example',
	#package : 'AppGenerator-Example'
}

{ #category : 'example' }
AppGeneratorExample class >> generateWindowsExample [

	<script: 'self generateWindowsExample'>

	AppGeneratorWindowsGenerator new
		properties: {
			#AppName -> 'AppGeneratorExample'.
			#InfoString -> 'An Example of an App Generator'.
			#BundleIdentifier -> 'org.pharo.appGeneratorExample'.
			#ShortVersion -> '1.0.0'.
			#DisplayName -> 'TestApp'.
			#CommandLineHandler -> 'appGeneratorExample'.
			#IconFile -> self iconFile.
			#CompanyName -> 'Pharo Consortium'.
			#LegalCopyright -> 'Copyright \251 https://www.pharo.org 2023\0'.
			#VMIncludeZipFile -> 'PharoVM-10.1.1-32b2be55-Windows-x86_64-include.zip'.
			#VMZipFile -> 'PharoVM-10.1.1-32b2be55-Windows-x86_64-bin.zip' 
		} asDictionary;
		outputDirectory: FileLocator workingDirectory / 'appGeneratorExample' / 'build';
		generate
]

{ #category : 'example' }
AppGeneratorExample class >> generateWindowsExampleInAZip [

	<script: 'self generateWindowsExample'>

	AppGeneratorWindowsGenerator new
		properties: {
			#AppName -> 'AppGeneratorExample'.
			#InfoString -> 'An Example of an App Generator'.
			#BundleIdentifier -> 'org.pharo.appGeneratorExample'.
			#ShortVersion -> '1.0.0'.
			#DisplayName -> 'TestApp'.
			#CommandLineHandler -> 'appGeneratorExample'.
			#IconFile -> self iconFile.
			#CompanyName -> 'Pharo Consortium'.
			#LegalCopyright -> 'Copyright \251 https://www.pharo.org 2023\0'.
			#VMIncludeZipFile -> 'PharoVM-10.1.1-32b2be55-Windows-x86_64-include.zip'.
			#VMZipFile -> 'PharoVM-10.1.1-32b2be55-Windows-x86_64-bin.zip'.
			#GeneratedArtifact -> #zip.
		} asDictionary;
		outputDirectory: FileLocator workingDirectory / 'appGeneratorExample' / 'build';
		generate
]

{ #category : 'resources' }
AppGeneratorExample class >> iconFile [
		
	^ AppGeneratorAbstractGenerator repositoryLocation / 'exampleResources' / 'ballon.ico'
]
