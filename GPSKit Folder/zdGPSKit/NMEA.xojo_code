#tag Module
Protected Module NMEA
	#tag Constant, Name = kHemisphereEast, Type = String, Dynamic = False, Default = \"E", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kHemisphereNorth, Type = String, Dynamic = False, Default = \"N", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kHemisphereSouth, Type = String, Dynamic = False, Default = \"S", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kHemisphereWest, Type = String, Dynamic = False, Default = \"W", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kModeIndicatorAutonomous, Type = String, Dynamic = False, Default = \"A", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kModeIndicatorDifferential, Type = String, Dynamic = False, Default = \"D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kModeIndicatorEstimated, Type = String, Dynamic = False, Default = \"E", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kModeIndicatorNotValid, Type = String, Dynamic = False, Default = \"N", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kModeIndicatorSimulator, Type = String, Dynamic = False, Default = \"S", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
