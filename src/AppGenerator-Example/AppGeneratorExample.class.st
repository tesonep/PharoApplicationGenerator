Class {
	#name : 'AppGeneratorExample',
	#superclass : 'Object',
	#category : 'AppGenerator-Example',
	#package : 'AppGenerator-Example'
}

{ #category : 'example' }
AppGeneratorExample class >> generateOSXExample [

	<script>

	AppGeneratorOSXGenerator new
		properties: {
			#AppName -> 'AppGeneratorExample'.
			#InfoString -> 'An Example of an App Generator'.
			#BundleIdentifier -> 'org.pharo.appGeneratorExample'.
			#ShortVersion -> '1.0.0'.
			#DisplayName -> 'TestApp'.
			#CommandLineHandler -> 'appGeneratorExample'.
			#CompanyName -> 'Pharo Consortium'
		} asDictionary;
		outputDirectory: FileLocator workingDirectory / 'appGeneratorExample' / 'build';
		generate
]

{ #category : 'example' }
AppGeneratorExample class >> generateOSXExampleWithExternalResources [

	<script>

	AppGeneratorOSXGenerator new
		properties: {
			#AppName -> 'AppGeneratorExample'.
			#InfoString -> 'An Example of an App Generator'.
			#BundleIdentifier -> 'org.pharo.appGeneratorExample'.
			#ShortVersion -> '1.0.0'.
			#DisplayName -> 'TestApp'.
			#CommandLineHandler -> 'appGeneratorExample'.
			#CompanyName -> 'Pharo Consortium'
		} asDictionary;
		outputDirectory: FileLocator workingDirectory / 'appGeneratorExample' / 'build';
		addExternalFile: AppGeneratorOSXGenerator repositoryLocation / 'exampleResources' / 'singleResourceFile.txt';
		addExternalFile: AppGeneratorOSXGenerator repositoryLocation / 'exampleResources' / 'singleResourceFile.txt' destination: 'insideADirectory/singleResourceFile.txt';
		addExternalDirectory: AppGeneratorOSXGenerator repositoryLocation / 'myResourceDirectory';		
		generate
]

{ #category : 'example' }
AppGeneratorExample class >> generateOSXExampleWithParameter [

	<script>

	AppGeneratorOSXGenerator new
		properties: {
			#AppName -> 'AppGeneratorExample'.
			#InfoString -> 'An Example of an App Generator'.
			#BundleIdentifier -> 'org.pharo.appGeneratorExample'.
			#ShortVersion -> '1.0.0'.
			#DisplayName -> 'TestApp'.
			#CommandLineHandler -> 'appGeneratorExample'.
			#CompanyName -> 'Pharo Consortium'.
			#Parameters -> #('--no-default-preferences').
		} asDictionary;
		outputDirectory: FileLocator workingDirectory / 'appGeneratorExample' / 'build';
		generate
]

{ #category : 'example' }
AppGeneratorExample class >> generateWindowsExample [

	<script>

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

	<script>

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

{ #category : 'example' }
AppGeneratorExample class >> generateWindowsExampleInAZipWithExternalResources [

	<script>

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
		addExternalFile: AppGeneratorOSXGenerator repositoryLocation / 'exampleResources' / 'singleResourceFile.txt';
		addExternalFile: AppGeneratorOSXGenerator repositoryLocation / 'exampleResources' / 'singleResourceFile.txt' destination: 'insideADirectory/singleResourceFile.txt';
		addExternalDirectory: AppGeneratorOSXGenerator repositoryLocation / 'myResourceDirectory';		
		generate
]

{ #category : 'example' }
AppGeneratorExample class >> generateWindowsExampleWithParameter [

	<script>
	AppGeneratorWindowsGenerator new
		properties: {
				(#AppName -> 'AppGeneratorExample').
				(#InfoString -> 'An Example of an App Generator').
				(#BundleIdentifier -> 'org.pharo.appGeneratorExample').
				(#ShortVersion -> '1.0.0').
				(#DisplayName -> 'TestApp').
				(#CommandLineHandler -> 'appGeneratorExample').
				(#IconFile -> self iconFile).
				(#Parameters -> #( '--no-default-preferences' )).
				(#CompanyName -> 'Pharo Consortium').
				(#LegalCopyright -> 'Copyright \251 https://www.pharo.org 2023\0').
				(#VMIncludeZipFile
				 -> 'PharoVM-10.1.1-32b2be55-Windows-x86_64-include.zip').
				(#VMZipFile -> 'PharoVM-10.1.1-32b2be55-Windows-x86_64-bin.zip') }
				asDictionary;
		outputDirectory:
			FileLocator workingDirectory / 'appGeneratorExample' / 'build';
		generate
]

{ #category : 'resources' }
AppGeneratorExample class >> iconFile [
		
	^ AppGeneratorAbstractGenerator repositoryLocation / 'exampleResources' / 'ballon.ico'
]
