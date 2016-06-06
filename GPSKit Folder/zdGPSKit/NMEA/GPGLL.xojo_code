#tag Class
 Attributes ( Encryption = True ) Protected Class GPGLL
Inherits zdGPSKit.NMEA.Sentence
	#tag Method, Flags = &h0
		Function Latitude() As String
		  
		  //-- The latitude in ddmm.mmmmm...
		  
		  Return Self.Parameter( 1 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LatitudeHemisphere() As String
		  
		  //-- The latitude hemisphere letter
		  // N = North, S = South
		  
		  Return Self.Parameter( 2 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Longitude() As String
		  
		  //-- Returns the longitude value as ddmm.mmmmm...
		  
		  Return Self.Parameter( 3 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LongitudeHemisphere() As String
		  
		  //-- The longitude hemisphere
		  // E = East, W = West
		  
		  Return Self.Parameter( 4 )
		  
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
		  
		  Return Me.Parameter( 7 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Status() As String
		  
		  //-- The fix status.
		  // A = Active ( i.e. data valid )
		  // V = Void ( i.e. Invalid data )
		  
		  Return Self.Parameter( 6 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UTCTimeString(inWithDecimal As Boolean = False) As String
		  
		  //-- Returns the UTC time as hh:mm:ss[.sss]
		  
		  // Retrieve the time data
		  Dim theValue As String = Self.Parameter( 5 )
		  
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


	#tag Constant, Name = kStatusActive, Type = String, Dynamic = False, Default = \"A", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStatusVoid, Type = String, Dynamic = False, Default = \"V", Scope = Public
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
