Extension { #name : #PharoFilesOpener }

{ #category : #'*AppGenerator-Support' }
PharoFilesOpener >> informCannotLocateSources [
	| msg |
	
	AppGeneratorSupport isEmbedded ifTrue: [ ^self ].
	
	msg := self cannotLocateMsg.
	Smalltalk os isMacOS
		ifTrue: [ 
			msg := msg
				,
					'
Make sure the sources file is not an Alias.' ].
	self inform: msg withSourceRef: self sourcesName
]

{ #category : #'*AppGenerator-Support' }
PharoFilesOpener >> informProblemInChanges: msg [

	"If I am embedded I have no sources! "
	AppGeneratorSupport isEmbedded ifTrue: [ ^ self ].

	self inform: msg withChangesRef: self changesName
]

{ #category : #'*AppGenerator-Support' }
PharoFilesOpener >> shouldInformAboutReadOnlyChanges [

	"If I am embedded I have no sources! "
	AppGeneratorSupport isEmbedded ifTrue: [ ^ false ].

	"Answer true if and only if the user must be informed when the .changes file can not be written to."
	^ shouldInformAboutReadOnlyChanges ifNil: [ shouldInformAboutReadOnlyChanges := true ]
]
