#tag Class
 Attributes ( Encryption = True ) Protected Class GPSSatellite
	#tag Property, Flags = &h0
		Azimuth As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Elevation As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PRN As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SNRatio As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		UsedInFix As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Azimuth"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Elevation"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
			Name="PRN"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SNRatio"
			Group="Behavior"
			Type="Integer"
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
		#tag ViewProperty
			Name="Untitled"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UsedInFix"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
