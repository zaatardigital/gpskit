#tag Class
 Attributes ( Encryption = True ) Protected Class Longitude
Inherits Coordinate
	#tag Event
		Function FormatDD(inValue As Double) As String
		  
		  // Format the numerical data
		  Return Format( inValue, "000.00000" ) + zdGPSKit.Geo.Coordinate.kMarkDegree
		  
		End Function
	#tag EndEvent

	#tag Event
		Function FormatDM(inDegrees As Integer, inMinutes As Double) As String
		  
		  // Format the numerical data
		  Return Format( inDegrees, "000" ) + zdGPSKit.Geo.Coordinate.kMarkDegree + " " _
		  + Format( inMinutes, "00.000" ) + zdGPSKit.Geo.Coordinate.kMarkMinute
		  
		End Function
	#tag EndEvent

	#tag Event
		Function FormatDMS(inDegrees As Integer, inMinutes As Integer, inSecondes As Double) As String
		  
		  // Format the numerical data
		  Return Format( inDegrees, "000" ) + zdGPSKit.Geo.Coordinate.kMarkDegree + " "_
		  + Format( inMinutes, "00" ) + zdGPSKit.Geo.Coordinate.kMarkMinute + " " _
		  + Format( inSecondes, "00.0" ) + zdGPSKit.Geo.Coordinate.kMarkSecond
		  
		End Function
	#tag EndEvent

	#tag Event
		Function FormatWGS84(inDegrees As Integer, inMinutes As Double) As String
		  
		  //-- Prepare the formatted WGS84 string in a non-locale savvy form
		  
		  Dim theValue As Double = inDegrees * 100 + inMinutes
		  
		  #If RBVersion < 2011 Then
		    
		    Return Format( theValue * 100000, "00000\.00000" )
		    
		  #Else
		    
		    // Since RB 2011.x, it's better to use the 'format' optional parameter of Str()
		    Return Str( theValue, "00000.00000" )
		    
		  #EndIf
		  
		End Function
	#tag EndEvent

	#tag Event
		Function GuessHemisphereLetter(inValue As Double) As String
		  
		  //-- Return the Hemisphere letter, depending on the value sign
		  //   A longitude of 0° or +/180° returns a space character
		  
		  If inValue >= 0.0 Then
		    
		    // East hemisphere
		    Return "E"
		    
		  Else
		    
		    // West hemisphere
		    Return "W"
		    
		  End If
		  
		End Function
	#tag EndEvent

	#tag Event
		Function GuessHemisphereSign(inHemisphere As String) As Integer
		  
		  Select Case inHemisphere
		    
		  Case "E", "", " "
		    
		    // East
		    Return 1
		    
		  Case "W"
		    
		    //West
		    Return -1
		    
		  Else
		    
		    Return 0
		    
		  End Select
		  
		End Function
	#tag EndEvent

	#tag Event
		Function ValidateData(inValue As Double) As Boolean
		  
		  //-- A longitude can't be smaller than -180 or bigger than 180
		  
		  Return Not ( inValue > 180.0 OR Invalue < -180.0 )
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  //-- Calling the overridden superclass constructor.
		  
		  Super.Constructor
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Dev Notes
		Valid range:
		+180° (E) / -180° (W)
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
