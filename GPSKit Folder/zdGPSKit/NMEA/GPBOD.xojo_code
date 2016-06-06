#tag Class
 Attributes ( Encryption = True ) Protected Class GPBOD
Inherits zdGPSKit.NMEA.Sentence
	#tag Method, Flags = &h1000
		Sub Constructor(inNMEADataChunk As String)
		  // Calling the overridden superclass constructor.
		  
		  Super.Constructor( inNMEADataChunk )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Destination() As String
		  //-- Return the name of the 'destination' waypoint in the device
		  
		  Return Self.Parameter( 5 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MagneticBearing() As String
		  //-- Return the magnetic bearing from 'Origin' to 'Destination'
		  
		  Return Self.Parameter( 3 )
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MagneticBearingMarker() As String
		  //-- Return the magnetic bearing marker ( 'M' )
		  
		  Return Self.Parameter( 4 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Origin() As String
		  //-- Return the name of the 'Origin' waypoint in the device
		  
		  Return Self.Parameter( 6 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrueBearing() As String
		  //-- Return the true bearing from 'Start' to 'Destination'
		  
		  Return Self.Parameter( 1 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrueBearingMarker() As String
		  //-- Return the true bearing Marker ( 'T' )
		  
		  Return Self.Parameter( 2 )
		End Function
	#tag EndMethod


	#tag Note, Name = Dev Notes
		
		$GPBOD
		
		Bearing Origin to Destination
		
		eg.  BOD,045.,T,023.,M,DEST,START
		045.,T       bearing 045 degrees True from "START" to "DEST"
		023.,M       bearing 023 degrees Magnetic from "START" to "DEST"
		DEST         destination waypoint ID
		START        origin waypoint ID
		
		- Example 1: $GPBOD,099.3,T,105.6,M,POINTB,*48
		Waypoint ID: "POINTB" Bearing 99.3 True, 105.6 Magnetic
		This sentence is transmitted in the GOTO mode, without an active route on your GPS.
		WARNING: this is the bearing from the moment you press enter in the GOTO page
		to the destination waypoint and is NOT updated dynamically! To update the information,
		(current bearing to waypoint), you will have to press enter in the GOTO page again.
		
		- Example 2: $GPBOD,097.0,T,103.2,M,POINTB,POINTA*4A
		This sentence is transmitted when a route is active. It contains the active leg information:
		origin waypoint "POINTA" and destination waypoint "POINTB", bearing between the two points
		97.0 True, 103.2 Magnetic. It does NOT display the bearing from current location to destination
		waypoint! WARNING Again this information does not change until you are on the next leg of the route.
		(The bearing from POINTA to POINTB does not change during the time you are on this leg.)
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
