#tag Class
 Attributes ( Encryption = True ) Protected Class PGRME
Inherits zdGPSKit.NMEA.Sentence
	#tag Method, Flags = &h1000
		Sub Constructor(inNMEADataChunk As String)
		  // Calling the overridden superclass constructor.
		  Super.Constructor( inNMEADataChunk )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EstimatedHorizontalError() As String
		  //-- Estimated horizontal position error in meters (HPE)
		  
		  Return Self.Parameter( 1 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EstimatedHorizontalErrorUnit() As String
		  
		  //-- Estimated horizontal position error units
		  // Should always be 'M' for Meters
		  
		  Return Self.Parameter( 2 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EstimatedVerticalError() As String
		  //-- Estimated vertical error (VPE) in meters
		  
		  Return Self.Parameter( 3 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EstimatedVerticalErrorUnit() As String
		  
		  //-- Estimated vertical error (VPE) units
		  // Should always be 'M' for meters
		  
		  Return Self.Parameter( 4 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OverallSphericalError() As String
		  
		  //-- Overall spherical equivalent position error in meters
		  
		  Return Self.Parameter( 5 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OverallSphericalErrorUnit() As String
		  
		  //-- Overall spherical equivalent position error units
		  // Should always be 'M' for meters
		  
		  Return Self.Parameter( 5 )
		  
		End Function
	#tag EndMethod


	#tag Note, Name = DevNotes
		
		--- Estimated Position Error ---
		
		$PGRME,15.0,M,45.0,M,25.0,M*1C
		
		where:
		15.0,M       Estimated horizontal position error in meters (HPE) 
		45.0,M       Estimated vertical error (VPE) in meters
		25.0,M       Overall spherical equivalent position error
		
		Note that the PGRME sentence is not set if the output is set to NMEA 1.5 mode.
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
