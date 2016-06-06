#tag Class
 Attributes ( Encryption = True ) Protected Class GPRMC
Inherits zdGPSKit.NMEA.Sentence
	#tag Method, Flags = &h0
		Function CourseTrue() As String
		  //-- Return the true course
		  
		  Return Self.Parameter( 8 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FixDateNative() As String
		  //-- Returns the fix date as send by the GPS device
		  
		  // Retrieve the fix date value
		  Return Self.Parameter( 9 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FixDateString() As String
		  //-- Returns the fix date as yyyy-mm-dd
		  
		  // Retrieve the fix date value
		  Dim theValue As String = Self.Parameter( 9 )
		  
		  // Is it an actual value?
		  If theValue = "" Then
		    
		    Return ""
		    
		  Else
		    
		    // Format and return the value
		    Return "20" + theValue.RightB( 2 ) + "-" + theValue.MidB( 3, 2 ) + "-" + theValue.LeftB( 2 )
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GroundSpeedKnots() As String
		  //-- Returns the ground speed in knots
		  
		  Return Self.Parameter( 7 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Latitude() As String
		  //-- Return the Latitude ( ddmm.mmmmm )
		  
		  Return Self.Parameter( 3 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LatitudeHemisphere() As String
		  //-- Return the latitude hemisphere letter
		  
		  Return Self.Parameter( 4 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Longitude() As String
		  //-- Returns the longitude value
		  
		  Return Self.Parameter( 5 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LongitudeHemisphere() As String
		  //-- Return the longitude hemisphere letter
		  
		  Return Self.Parameter( 6 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MagneticVariation() As String
		  //-- Return the magnetic variation value
		  
		  Return Self.Parameter( 10 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MagneticVariationDirection() As String
		  // Return the magnetic variation direction E/W
		  
		  Return Self.Parameter( 11 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ModeIndicator() As String
		  //-- The mode indicator ( NMEA v2.3 and later )
		  // A = autonomous
		  // D = differential
		  // E = Estimated
		  // N = not valid
		  // S = Simulator
		  
		  Return Me.Parameter( 12 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Status() As String
		  //-- Return the fix status letter
		  // A = Active, V = Void
		  
		  Return Self.Parameter( 2 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UTCTimeNative() As String
		  //-- Returns the UTC time as sent by the GPS device
		  
		  Return Self.Parameter( 1 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UTCTimeString(inWithDecimal As Boolean = False) As String
		  //-- Returns the UTC time as hh:mm:ss[.sss]
		  
		  // Retrieve the time data
		  Dim theValue As String = Self.Parameter( 1 )
		  
		  // Is it an actual value?
		  If theValue <> "" Then
		    
		    // Do we have to include the decimal part?
		    If inWithDecimal Then
		      
		      // With decimal
		      Return theValue.LeftB( 2 ) + ":" + theValue.MidB( 3, 2 ) + ":" + theValue.Right( theValue.Len - 4 )
		      
		    Else
		      
		      // No decimal needed
		      Return theValue.LeftB( 2 ) + ":" + theValue.MidB( 3, 2 ) + ":" + theValue.MidB( 5, 2 )
		      
		    End If
		    
		  Else
		    
		    // There is no time data
		    Return ""
		    
		  End If
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Description
		
		$GPRMC,123519,A,4807.038,N,01131.000,E,022.4,084.4,230394,003.1,W*6A
		
		Where:
		0/ GPRMC --- General Purpose Recommended Minimum sentence C
		1/ 123519 --- Fix taken at 12:35:19 UTC
		2/ A --- Status A=active or V=Void.
		3/ 4807.038 --- Latitude 48 deg 07.038'
		4/ N --- Latitude Hemisphere 
		5/ 01131.000 --- Longitude 11 deg 31.000'
		6/ E --- Longitude hemisphere
		7/ 022.4 --- Speed over the ground in knots
		8/ 084.4 --- Track angle in degrees True
		9/ 230394 --- Date - 23rd of March 1994
		10/ 003.1 --- Magnetic variation
		11/ W --- Magnetic Variation direction
	#tag EndNote


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
