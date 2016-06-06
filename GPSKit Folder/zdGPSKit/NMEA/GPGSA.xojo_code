#tag Class
 Attributes ( Encryption = True ) Protected Class GPGSA
Inherits zdGPSKit.NMEA.Sentence
	#tag Method, Flags = &h1000
		Sub Constructor(inNMEADataChunk As String)
		  // Calling the overridden superclass constructor.
		  
		  Super.Constructor( inNMEADataChunk )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FixType() As String
		  //-- The fix mode
		  // 1 = fix not available, 2 = 2D, 3 = 3D
		  
		  Return Self.Parameter( 2 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FixTypeSelection() As String
		  //--  Auto selection of 2D or 3D fix
		  // A = Automatic, M = manual
		  
		  Return Self.Parameter( 1 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HDOP() As String
		  //-- The horizontal dilution of precision
		  
		  Return Self.Parameter( 16 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PDOP() As String
		  //-- The position dilution precision
		  
		  Return Self.Parameter( 15 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SatellitePRN(inSatelliteIndex As Integer) As String
		  //-- The PRN number of the inSatelliteIndex-th satellite
		  // inSatelliteIndex range is 1-12
		  // It returns an empty string if the satellitte is not active.
		  
		  If inSatelliteIndex < 1 Or inSatelliteIndex > 12 Then
		    
		    Dim theException As New OutOfBoundsException
		    theException.Message = CurrentMethodName + "The index " + Str( inSatelliteIndex ) + " is out of range (1-12)."
		    Raise theException
		    
		  Else
		    
		    Return Self.Parameter( 2 + inSatelliteIndex )
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VDOP() As String
		  //-- The vertical dilution of precision
		  
		  Return Self.Parameter( 17 )
		End Function
	#tag EndMethod


	#tag Note, Name = Dev Notes
		
		$GPGSA,A,3,04,05,,09,12,,,24,,,,,2.5,1.3,2.1*39
		
		Where:
		GSA      Satellite status
		A        Auto selection of 2D or 3D fix (M = manual)
		3        3D fix
		- values include:
		1 = no fix
		2 = 2D fix
		3 = 3D fix
		04,05... PRNs of satellites used for fix (space for 12)
		2.5      PDOP (dilution of precision)
		1.3      Horizontal dilution of precision (HDOP)
		2.1      Vertical dilution of precision (VDOP)
		*39      the checksum data, always begins with *
	#tag EndNote


	#tag Constant, Name = kFixType2D, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixType3D, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixTypeNoFix, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFixTypeSelectionAutomatic, Type = String, Dynamic = False, Default = \"A", Scope = Public
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
