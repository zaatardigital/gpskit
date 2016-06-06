#tag Class
 Attributes ( Encryption = True ) Protected Class PMGNST
Inherits zdGPSKit.NMEA.Sentence
	#tag Method, Flags = &h0
		Function BatteryTimeLeft() As String
		  //-- Return time left on the GPS device battery in hours ( decimal )
		  
		  Return Self.Parameter( 5 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(inNMEADataChunk As String)
		  // Calling the overridden superclass constructor.
		  
		  Super.Constructor( inNMEADataChunk )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentPRN() As String
		  //-- Returns the PRN number receiving current focus
		  
		  Return Self.Parameter( 7 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FixMode() As String
		  //-- Return the fix mode
		  // 1 = no fix, 2 = 2D fix, 3 = 3D fix
		  
		  Return Self.Parameter( 2 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsAFix() As Boolean
		  //-- True if we have a fix - (F) False otherwise
		  
		  Return Self.Parameter( 2 ) = "T"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VersionNumber() As String
		  //-- The device software version's number.
		  
		  Return Self.Parameter( 1 )
		End Function
	#tag EndMethod


	#tag Note, Name = Dev Notes
		Magellan uses proprietary sentences to do all of their waypoint and route maintenance.
		They use the MGN prefix for their sentences.
		Here is an example of a sentence sent by the GPS Companion product:
		
		$PMGNST,02.12,3,T,534,05.0,+03327,00*40
		
		where:
		ST      status information
		
		1    02.12   Version number
		2    3       2D or 3D
		3    T       True if we have a fix - (F) False otherwise
		4    534     numbers change - unknown
		5    05.0    time left on the gps battery in hours
		6    +03327  numbers change (freq. compensation?)
		7    00      PRN number receiving current focus
		8    *40    checksum
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
