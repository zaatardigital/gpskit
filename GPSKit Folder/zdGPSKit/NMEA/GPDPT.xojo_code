#tag Class
 Attributes ( Encryption = True ) Protected Class GPDPT
Inherits zdGPSKit.NMEA.Sentence
	#tag Method, Flags = &h0
		Function DepthMeters() As String
		  //-- Returns the depth of the water
		  
		  Return Self.Parameter( 1 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Offset() As String
		  //-- Returns the Offset from transducer
		  // Positive means distance from transducer to water line,
		  // negative means distance from transducer to keel
		  
		  Return Self.Parameter( 2 )
		End Function
	#tag EndMethod


	#tag Note, Name = Dev Notes
		
		
		$GPDPT,0.2,0.0,100*48
		
		Field Number:
		
		Depth, meters
		
		Offset from transducer, positive means distance from tansducer to water line negative means
		distance from transducer to keel
		
		Checksum
		
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
