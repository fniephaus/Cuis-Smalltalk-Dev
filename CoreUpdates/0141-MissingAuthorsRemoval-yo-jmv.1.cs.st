'From Cuis 1.0 of 6 March 2009 [latest update: #5989] on 9 March 2009 at 10:26:21 am'!
	"Do a complete tree copy using a dictionary.  An object in the tree twice is only copied once.  All references to the object in the copy of the tree will point to the new copy."

	| copier new |
	copier _ DeepCopier new initialize: 4096 "self initialDeepCopierSize".
	new _ self veryDeepCopyWith: copier.
	copier references associationsDo: [:assoc | 
		assoc value veryDeepFixupWith: copier].
	copier fixDependents.
	^ new! !