#tag Class
 Attributes ( Encryption = True ) Protected Class Fix
	#tag Method, Flags = &h0
		Function Age() As Double
		  //-- Returns the number of seconds elapsed since this fix was created.
		  
		  Return ( Microseconds - Self.pCreationTime ) / 1000000.0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Stores the current time As creation time
		  Self.pCreationTime = Microseconds
		  
		  // Creates new instances
		  Self.pEarthLocation = New zdGPSKit.Geo.EarthLocation
		  Self.pEarthMotion = New zdGPSKit.Geo.EarthMotion
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EarthLocation() As zdGPSKit.Geo.EarthLocation
		  //-- Used to prevent the developper to set this property to Nil
		  
		  Return Self.pEarthLocation
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EarthMotion() As zdGPSKit.Geo.EarthMotion
		  //-- Used to prevent the developper to set this property to Nil
		  
		  Return Self.pEarthMotion
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		GPSTime As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( Hidden ) Private pCreationTime As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( Hidden ) Private pEarthLocation As zdGPSKit.Geo.EarthLocation
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( Hidden ) Private pEarthMotion As zdGPSKit.Geo.EarthMotion
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="GPSTime"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
