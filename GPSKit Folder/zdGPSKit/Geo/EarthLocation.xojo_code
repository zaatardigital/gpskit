#tag Class
 Attributes ( Encryption = True ) Protected Class EarthLocation
	#tag Property, Flags = &h0
		Altitude As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		HDOP As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		Latitude As zdGPSKit.Geo.Latitude
	#tag EndProperty

	#tag Property, Flags = &h0
		Longitude As zdGPSKit.Geo.Longitude
	#tag EndProperty

	#tag Property, Flags = &h0
		VDOP As Variant
	#tag EndProperty


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
End Class
#tag EndClass
