#tag Class
 Attributes ( Encryption = True ) Protected Class GPGSV
Inherits zdGPSKit.NMEA.Sentence
	#tag Method, Flags = &h0
		Function MessageCount() As Integer
		  //-- the total number of GPGSV messages available
		  // Typically 1-3
		  
		  Return Ctype( Val( Self.Parameter( 1 ) ), Integer )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MessageNumber() As String
		  //-- The number of this message
		  
		  Return Self.Parameter( 2 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SatelliteAzimuth(inSatelliteIndex As Integer) As String
		  //-- The azimuth for the inSatelliteIndex-th satellite
		  // In degrees True, 000-359
		  
		  Return Self.Parameter( 4 * inSatelliteIndex + 2 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SatelliteElevation(inSatelliteIndex As Integer) As String
		  //-- The elevation for the inSatelliteIndex-th satellite
		  // In Degrees 00-90
		  
		  Return Self.Parameter( 4 * inSatelliteIndex + 1 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SatellitePRN(inSatelliteIndex As Integer) As String
		  //-- The PRN code for the inSatelliteIndex-th satellite
		  
		  Return Self.Parameter( 4 * inSatelliteIndex )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SatelliteSNRatio(inSatelliteIndex As Integer) As String
		  //-- The S/N ratio for the inSatelliteIndex-th satellite
		  // 00-99 dB. Null when not tracking
		  
		  Return Self.Parameter( 4 * inSatelliteIndex + 3 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TotalSatelliteCount() As String
		  //-- The total number of satellites in view
		  
		  Return Self.Parameter( 3 )
		End Function
	#tag EndMethod


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
