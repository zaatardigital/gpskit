#tag Class
 Attributes ( Encryption = True ) Protected Class GPVTG
Inherits zdGPSKit.NMEA.Sentence
	#tag Method, Flags = &h1000
		Sub Constructor(inNMEADataChunk As String)
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor( inNMEADataChunk )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CourseMagnetic() As String
		  //-- The magnetic course made good in degrees
		  // the magnetic course = true course + Mag var correction
		  
		  Return Self.Parameter( 3 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CourseMagneticIndicator() As String
		  //-- The magnetic track indicator
		  // Should always return 'M'
		  
		  Return Self.Parameter( 4 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CourseTrue() As String
		  //-- The true track made good in degrees
		  
		  Return Self.Parameter( 1 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CourseTrueIndicator() As String
		  //-- The true course indicator
		  // Should always return 'T'
		  
		  Return Self.Parameter( 2 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GroundSpeedKm() As String
		  //-- The speed over ground in kilometers per hour
		  
		  Return Self.Parameter( 7 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GroundSpeedKmIndicator() As String
		  //-- The ground speed Kilometer per hour indicator
		  // Should always return 'K'
		  
		  Return Self.Parameter( 6 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GroundSpeedKnots() As String
		  //-- The speed over ground in knots
		  
		  Return Self.Parameter( 5 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GroundSpeedKnotsIndicator() As String
		  //-- The ground speed in knots ( nautical miles ) indicator
		  // Should always return 'N'
		  
		  Return Self.Parameter( 6 )
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
		  
		  Return Me.Parameter( 9 )
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
