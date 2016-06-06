#tag Class
 Attributes ( Encryption = True ) Protected Class PGRMZ
Inherits zdGPSKit.NMEA.Sentence
	#tag Method, Flags = &h1000
		Sub Constructor(inNMEADataChunk As String)
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor( inNMEADataChunk )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentAltitudeFeet() As String
		  //-- The altitude in feets
		  
		  Return Self.Parameter( 1 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentAltitudeFeetSign() As String
		  //-- Should always return 'F' for feet
		  
		  Return Self.Parameter( 2 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FixType() As String
		  //-- The fix type
		  // 1: No fix, 2: 2D fix, 3: 3D FIx
		  
		  Return Me.Parameter( 3 )
		End Function
	#tag EndMethod


	#tag Note, Name = Dev Notes
		
		$PGRMZ,93,f,3*21
		
		where:
		93,f         Altitude in feet
		3            Position fix dimensions: 1 = no fix, 2 = 2D, 3 = 3D
		
		This sentence shows in feet, regardless of units shown on the gps device display.
		Note that for units with an altimeter this will be altitude computed
		by the internal altimeter.
	#tag EndNote


	#tag Constant, Name = kFixType2D, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixType3D, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixTypeNoFix, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMeterInFoot, Type = Double, Dynamic = False, Default = \"0.3048", Scope = Private
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
