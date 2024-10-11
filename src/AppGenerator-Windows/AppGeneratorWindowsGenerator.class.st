Class {
	#name : 'AppGeneratorWindowsGenerator',
	#superclass : 'AppGeneratorAbstractGenerator',
	#category : 'AppGenerator-Windows',
	#package : 'AppGenerator-Windows'
}

{ #category : 'copying' }
AppGeneratorWindowsGenerator >> copy: source to: dest [

	dest ensureDelete.
	source copyTo: dest
]

{ #category : 'copying' }
AppGeneratorWindowsGenerator >> copyIcon [

	self copy: self iconFile to: outputDirectory / 'icon.ico'
]

{ #category : 'copying' }
AppGeneratorWindowsGenerator >> copyIncludes [

	| includeDir |
	includeDir := outputDirectory / 'include'.
	includeDir ensureCreateDirectory.
	
	self copy: self templateDirectory / 'include' / 'resources.h' to: includeDir / 'resources.h'.
]

{ #category : 'copying' }
AppGeneratorWindowsGenerator >> copySources [

	| srcDir templateSrc |

	templateSrc := self templateDirectory / 'src'.
	srcDir := outputDirectory / 'src'.
	srcDir ensureCreateDirectory.

	self
		copy: templateSrc / 'embeddedImage.c'
		to: srcDir / 'embeddedImage.c'.

	self
		copyTemplate: templateSrc / 'resources.rc.in'
		to: srcDir / 'resources.rc.in'.

	self
		copyTemplate: templateSrc / 'main.c.template'
		to: srcDir / 'main.c'
]

{ #category : 'utilities' }
AppGeneratorWindowsGenerator >> fillWithDefaults [
	
	super fillWithDefaults.

	properties at: #IconFile ifAbsentPut: (self templateDirectory / 'icon.ico' ).
	properties at: #ImageDirEscaped ifAbsentPut: ((properties at: #ImageDir) copyReplaceAll: '\' with: '\\').
	
	properties at: #VersionWindowsFormat ifAbsentPut: ((properties at:#ShortVersion) copyReplaceAll: '.' with: ',').
	properties at: #CompanyName ifAbsentPut: 'MyCompany'.
	properties at: #LegalCopyright ifAbsentPut: 'My Company Copyright'.
	
	properties at: #GeneratedArtifact ifAbsentPut: #installer.
	
	
]

{ #category : 'translating' }
AppGeneratorWindowsGenerator >> generate [
	
	super generate.

	self copyIcon.
	self copyIncludes.
	self copySources.
	self generateCMakeScript.
	self generateInstallerScript
]

{ #category : 'generation' }
AppGeneratorWindowsGenerator >> generateCMakeScript [

	self
		copyTemplate: self templateDirectory / 'CMakeLists.txt.template'
		to: outputDirectory / 'CMakeLists.txt'
]

{ #category : 'generation' }
AppGeneratorWindowsGenerator >> generateInstallerScript [

	self
		copyTemplate: self templateDirectory / 'buildWindowsPackage.ps1.template'
		to: outputDirectory / 'buildWindowsPackage.ps1'
]

{ #category : 'accessing' }
AppGeneratorWindowsGenerator >> iconFile [
	
	^ properties at: #IconFile 
]

{ #category : 'accessing' }
AppGeneratorWindowsGenerator >> platformName [
	
	^ 'Windows'
]
