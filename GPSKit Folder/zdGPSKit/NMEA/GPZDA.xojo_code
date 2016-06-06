#tag Class
 Attributes ( Encrypted = True ) Protected Class GPZDA
Inherits zdGPSKit.NMEA.Sentence
	#tag Method, Flags = &h0
		Function Day() As String
		  //-- Return the Day (1-31) from the GPS device
		  
		  Return Self.Parameter( 2 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GMTOffsetHour() As String
		  //-- Return the local time zone offset from GMT, ranging from 00 through ±13 hours
		  
		  Return Self.Parameter( 5 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GMTOffsetMinute() As String
		  //-- Return the local time zone offset from GMT, ranging from 00 through 59 minutes
		  
		  Return Self.Parameter( 6 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Month() As String
		  //-- Return the Month (1-12) from the GPS device
		  
		  Return Self.Parameter( 3 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UTC() As String
		  //-- Return the UTC from the GPS device
		  
		  Return Self.Parameter( 1 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Year() As String
		  //-- Return the Year (YYYY) from the GPS device
		  
		  Return Self.Parameter( 4 )
		End Function
	#tag EndMethod


	#tag Note, Name = Dev notes
		UTC time, day, month, and year, and local time zone offset
		An example of the ZDA message string is:
		
		$GPZDA,172809.456,12,07,1996,00,00*45
		
		ZDA message fields
		Field    Meaning
		----------------
		  0        Message ID $GPZDA
		  1        UTC (HHMMSS.SSS)
		  2        Day, ranging between 01 and 31
		  3        Month, ranging between 01 and 12
		  4        Year
		  5        Local time zone offset from GMT, ranging from 00 through ±13 hours
		  6        Local time zone offset from GMT, ranging from 00 through 59 minutes
		  7        The checksum data, always begins with *
		----------------
		
		Fields 5 and 6 together yield the total offset.
		For example, if field 5 is -5 and field 6 is +15, local time is 5 hours and 15 minutes earlier than GMT.
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
