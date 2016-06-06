#tag Class
 Attributes ( Encryption = True ) Protected Class PGRMF
Inherits zdGPSKit.NMEA.Sentence
	#tag Method, Flags = &h0
		Function CourseTrue() As String
		  //-- Course over ground, degrees true
		  
		  Return Self.Parameter( 13 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FixType() As String
		  //-- The Fix type (0=No fix, 1=2D fix, 2=3D fix)
		  
		  Return Self.Parameter( 11 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FixTypeSelection() As String
		  //-- The Fix type mode selection
		  // A = Automatic, M = Manual
		  
		  Return Self.Parameter( 10 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GPSLeapSecondCount() As String
		  //-- The GPS leap second count
		  
		  Return Self.Parameter( 5 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GPSSecondsInweek() As String
		  //-- The GPS seconds number in current week (0 - 604799)
		  
		  Return Self.Parameter( 2 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GPSWeekNumber() As String
		  
		  //-- The GPS week number (0 - 1023)
		  
		  Return Self.Parameter( 1 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GroundSpeedKmh() As String
		  //-- Speed over ground, kilometres / hour
		  
		  Return Self.Parameter( 12 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Latitude() As String
		  //-- Latitude, ddmm.mmmm format Leading zero wil be transmitted
		  
		  Return Self.Parameter( 6 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LatitudeHemisphere() As String
		  //-- Latitude hemisphere, N or S
		  
		  Return Self.Parameter( 7 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocalDateTime() As Date
		  Dim theSQLDate As String = Self.UTCDateSQL + " " + Self.UTCTimeSQL
		  
		  If theSQLDate <> "" Then
		    
		    // Create a new date
		    Dim theResult As New Date
		    
		    // Store the computer's GMT Offset
		    Dim theGMTOffset As Double  = theResult.GMTOffset
		    
		    // Set the GMT offset as UTC time
		    theResult.GMTOffset = 0.0
		    
		    Try // Prepare to catch UnsupportedFormatException
		      
		      // Set the Date
		      theResult.SQLDate = theSQLDate
		      
		    Catch exc As UnsupportedFormatException
		      
		      // Unable to parse the data
		      Return Nil
		      
		    End Try
		    
		    // Restore the computer's GMT offset
		    theResult.GMTOffset = theGMTOffset
		    
		    // We're done
		    Return theResult
		    
		  Else
		    
		    // Nothing to return
		    Return Nil
		    
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Longitude() As String
		  //-- Longitude, dddmm.mmmm format (leading zeros will be transmitted)
		  
		  Return Self.Parameter( 8 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LongitudeHemisphere() As String
		  //--  Longitude hemisphere, E or W
		  
		  Return Self.Parameter( 9 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UTCDateRaw() As String
		  //--  UTC date, ddmmyy format
		  
		  Return Self.Parameter( 3 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UTCDateSQL() As String
		  //--  UTC date, ddmmyy format
		  // Convert the original  ddmmyy format to SQL Format ( yyyy-mm-dd )
		  
		  Dim theValue As String = Self.Parameter( 3 )
		  
		  If theValue = "" Then
		    
		    // No data available
		    Return ""
		    
		  Else
		    
		    // Format the string and return it
		    Return "20" +  theValue.Mid( 5, 2 ) + "-" + theValue.Mid( 3, 2 ) + "-" + theValue.Left( 2 )
		    
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UTCTimeRaw() As String
		  //--  UTC time as hhmmss.
		  
		  Return Self.Parameter( 4 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UTCTimeSQL() As String
		  //--  UTC time
		  // Convert the original 'hhmmss' format to 'hh:mm:ss'
		  
		  Dim theValue As String = Self.Parameter( 4 )
		  
		  If theValue = "" Then
		    
		    // No data available
		    Return ""
		    
		  Else
		    
		    // Format the string and return it
		    Return theValue.Left( 2 ) + ":" + theValue.Mid( 3, 2 ) + ":" + theValue.Mid( 5, 2 )
		    
		  End If
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Dev Notes
		
		$PGRMF
		Proprietary Garmin command
		
		GPS Position Fix Data
		
		$PGRMF,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15*HH
		
		1 = GPS week number (0 - 1023)
		2 = GPS seconds in current week (0 - 604799)
		3 = UTC date, ddmmyy format
		4 = UTC time, hhmmss format
		5 = GPS leap second count
		6 = Latitude, dddmm.mmmm format (leading zeros will be transmitted)
		7 = Latitude hemisphere, N or S
		8 = Longitude, dddmm.mmmm format (leading zeros will be transmitted)
		9 = Longitude hemisphere, E or W
		10 = Mode (M=Manual, A=Automatic)
		11 = Fix type (0=No fix, 1=2D fix, 2=3D fix)
		12 = Speed over ground, kilometres / hour
		13 = Course over ground, degrees true
		14 = PDOP (Position dilution of precision), rounded to nearest integer
		15 = TDOP (Time dilution of precision), rounded to nearest integer
		HH = Checksum
	#tag EndNote


	#tag Constant, Name = FixType2D, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FixType3D, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixTypeNoFix, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixTypeSelectionAuto, Type = String, Dynamic = False, Default = \"A", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixTypeSelectionManual, Type = String, Dynamic = False, Default = \"M", Scope = Public
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
