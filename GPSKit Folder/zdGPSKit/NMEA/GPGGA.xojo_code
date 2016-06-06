#tag Class
 Attributes ( Encryption = True ) Protected Class GPGGA
Inherits zdGPSKit.NMEA.Sentence
	#tag Method, Flags = &h0
		Function Altitude() As String
		  //-- Return the altitude above Mean Sea Level in the unit specified by AltitudeUnity
		  // Usually meters ( M )
		  
		  Return Self.Parameter( 9 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AltitudeUnit() As String
		  //-- Return the unit used for altitude. Usually M ( Meters ).
		  
		  Return Self.Parameter( 10 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DGPSDataAge() As String
		  //-- The time since last DGPS update
		  // The maximum time reported is 99 seconds
		  // Empty if DGPS is not used
		  
		  Return Self.Parameter( 13 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DGPSStationID() As String
		  //-- The differential reference station ID ( if used )
		  // Expected value is in the 0000-1023 range
		  // Empty if DGPS is not used
		  
		  Return Self.Parameter( 14 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FixQuality() As String
		  //-- Return the quality incator for this fix
		  
		  Return Self.Parameter( 6 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FixQualitySentence() As String
		  //-- Returns the quality indicator as an english string
		  
		  Dim theValue As String = Self.Parameter( 6 )
		  
		  // Select a return the sentence according to the value
		  Select Case theValue
		    
		  Case "0"
		    Return "Invalid"
		    
		  Case "1"
		    Return "GPS fix (SPS)"
		    
		  Case "2"
		    Return "DGPS fix"
		    
		  Case "3"
		    Return "PPS fix"
		    
		  Case "4"
		    Return "RTK fixed ambiguity solution"
		    
		  Case "5"
		    Return "RTK floating ambiguity solution"
		    
		  Case "6"
		    Return "Estimated (dead reckoning)"
		    
		  Case "7"
		    Return "Manual input"
		    
		  Case "8"
		    Return "Simulation"
		    
		  Case "9"
		    Return "WAAS"
		    
		  Case ""
		    Return "Unavailable"
		    
		  Else
		    Return "Unknown"
		    
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HDOP() As String
		  
		  //-- Returns the Horizontal Dilution of Precision
		  
		  Return Self.Parameter( 8 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HeightOfGeoid() As String
		  //-- Returns the Height of geoid (mean sea level) above WGS84 ellipsoid
		  // The unit is specified in the HeightOfGeoidUnit property ( usually Meters )
		  
		  Return Self.Parameter( 11 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HeightOfGeoidUnit() As String
		  //-- The Unit used for HeightOfGeoid value. Usually 'M' for Meters
		  
		  Return Self.Parameter( 12 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Latitude() As String
		  //-- The latitude in ddmm.mmmmm...
		  
		  Return Self.Parameter( 2 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LatitudeHemisphere() As String
		  //-- The latitude hemisphere letter
		  // N = North, S = South
		  
		  Return Self.Parameter( 3 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Longitude() As String
		  // TheLongitude in dddmm.mmmmm...
		  
		  Return Self.Parameter( 4 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LongitudeHemisphere() As String
		  //-- The longitude hemisphere
		  // E = East, W = West
		  
		  Return Self.Parameter( 5 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UsedSatellitesCount() As String
		  //-- The number of satellites used ( may be different to the number in view )
		  
		  Return Self.Parameter( 7 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UTCTimeString(inWithDecimal As Boolean = False) As String
		  //-- Returns the UTC time as hh:mm:ss[.sss]
		  
		  // Retrieve the time data
		  Dim theValue As String = Self.Parameter( 1 )
		  
		  // Is it an actual value?
		  If theValue = "" Then
		    
		    Return ""
		    
		    
		  ElseIf inWithDecimal Then
		    // Output with decimal
		    Return theValue.LeftB( 2 ) + ":" + theValue.MidB( 3, 2 ) + ":" + theValue.Right( theValue.Len - 4 )
		    
		  Else
		    // No decimal needed
		    Return theValue.LeftB( 2 ) + ":" + theValue.MidB( 3, 2 ) + ":" + theValue.MidB( 5, 2 )
		    
		  End If
		End Function
	#tag EndMethod


	#tag Note, Name = DevNotes
		GGA - essential fix data which provide 3D location and accuracy data.
		
		$GPGGA,123519,4807.038,N,01131.000,E,1,08,0.9,545.4,M,46.9,M,,*47
		
		0/ GGA --- Global Positioning System Fix Data
		1/ 123519 --- Fix taken at 12:35:19 UTC
		2/ 4807.038 --- Latitude 48 deg 07.038'
		3/ N -- Latitude Hemisphere
		4/ 01131.000 --- Longitude 11 deg 31.000'
		5/ E --- Longitude Hemisphere
		6/ 1 --- Fix quality:
		   Possible values:
		     0 = invalid
		     1 = GPS fix (SPS)
		     2 = DGPS fix
		     3 = PPS fix
		     4 = Real Time Kinematic
		     5 = Float RTK
		     6 = estimated (dead reckoning) (2.3 feature)
		     7 = Manual input mode
		     8 = Simulation mode
		
		7/ 08 --- Number of satellites being tracked
		8/ 0.9 --- Horizontal dilution of position
		9/ 545.4 --- Altitude in Meters
		10/ M --- Meters, above mean sea level
		11/ 46.9 --- Height of geoid (mean sea level) above WGS84 ellipsoid
		12/ M --- Meters
		13/ (empty field) --- time in seconds since last DGPS update
		14/ (empty field) --- DGPS station ID number
	#tag EndNote

	#tag Note, Name = GPGGA
		
		
	#tag EndNote


	#tag Constant, Name = kFixQualityDeadReckoning, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixQualityDGPS, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixQualityGPS, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixQualityInvalid, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixQualityManualInput, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixQualityPPS, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixQualityRTKFixed, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixQualityRTKFloating, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixQualitySimulation, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixQualityWAAS, Type = Double, Dynamic = False, Default = \"9", Scope = Public
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
End Class
#tag EndClass
