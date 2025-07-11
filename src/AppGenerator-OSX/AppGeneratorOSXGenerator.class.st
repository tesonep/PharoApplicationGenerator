Class {
	#name : 'AppGeneratorOSXGenerator',
	#superclass : 'AppGeneratorAbstractGenerator',
	#category : 'AppGenerator-OSX',
	#package : 'AppGenerator-OSX'
}

{ #category : 'copying' }
AppGeneratorOSXGenerator >> copyIconSetIn: appDirectory [ 
	
	(appDirectory / 'Contents' / 'Resources') ensureCreateDirectory.
	
	(appDirectory / 'Contents' / 'Resources' / 'icon.icns') ensureDelete.
	self iconSetFile copyTo: (appDirectory / 'Contents' / 'Resources' / 'icon.icns').
	
	"Copying in the Build directory for the installer icon"
	(outputDirectory / 'installer.icns') ensureDelete.
	self iconSetFile copyTo: (outputDirectory / 'installer.icns')
	
]

{ #category : 'copying' }
AppGeneratorOSXGenerator >> copyInstallerBackground [
	
	| dst |
	dst := outputDirectory / 'installer-background.png'.	
	dst ensureDelete.
	(properties at: #InstallerBackgroundFile) copyTo: dst 
]

{ #category : 'external resources' }
AppGeneratorOSXGenerator >> externalResourceTargetDirectory [

	^ outputDirectory / (self appName , '.app') / 'Contents'
	  / 'Resources'
]

{ #category : 'utilities' }
AppGeneratorOSXGenerator >> fillWithDefaults [

	super fillWithDefaults.

	properties at: #BundleIdentifier ifAbsentPut: 'org.pharo.example'.
	properties
		at: #IconSetFile
		ifAbsentPut: self templateDirectory / 'icon.icns'.
	properties
		at: #InstallerBackgroundFile
		ifAbsentPut: self templateDirectory / 'installer-background.png'.
	properties at: #Parameters ifAbsentPut: #(  ).
	self generateParametersString
]

{ #category : 'translating' }
AppGeneratorOSXGenerator >> generate [
	
	| appDirectory |
	
	super generate.

	"Build App directory"
	appDirectory := outputDirectory / (self appName , '.app').
	appDirectory ensureCreateDirectory.
		
	self copyIconSetIn: appDirectory. 
	self generatePListIn: appDirectory.
	self copyInstallerBackground.
	
	self generateBuildScript.
]

{ #category : 'generating' }
AppGeneratorOSXGenerator >> generateBuildScript [

	self
		copyTemplate: self templateDirectory / 'build.sh.template'
		to: outputDirectory / 'build.sh'
]

{ #category : 'generating' }
AppGeneratorOSXGenerator >> generatePListIn: appDirectory [

	(appDirectory / 'Contents') ensureCreateDirectory.
	self
		copyTemplate: self templateDirectory / 'Info.plist.template'
		to: appDirectory / 'Contents' / 'Info.plist'
]

{ #category : 'generating' }
AppGeneratorOSXGenerator >> generateParametersString [

	| stream collection |
	collection := (properties at: #Parameters) asOrderedCollection.
	collection add: (properties at: #CommandLineHandler).
	collection add: '--embedded'.

	stream := WriteStream on: String crlf.
	collection do: [ :each |
			stream
				nextPut: Character tab;
				nextPutAll: '<string>';
				nextPutAll: each asString;
				nextPutAll: '</string>';
				nextPut: Character cr ].
	properties at: #Parameters put: stream contents
]

{ #category : 'accessing' }
AppGeneratorOSXGenerator >> iconSetFile [
	
	^ properties at: #IconSetFile 
]

{ #category : 'accessing' }
AppGeneratorOSXGenerator >> platformName [

	^ 'Darwin'
]
