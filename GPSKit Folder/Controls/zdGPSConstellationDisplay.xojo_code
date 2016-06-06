#tag Class
Protected Class zdGPSConstellationDisplay
Inherits zdFlickFreeCanvas
	#tag Event
		Sub Open()
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  // Creating the buffer
		  Dim thePicture As Picture = New Picture( Self.Width, Self.Height, 32 )
		  
		  If Not( thePicture.Mask Is Nil ) Then
		    
		    // Draw an empty sky
		    thePicture.Graphics.DrawPicture zdGPSConstellationSky, 0, 0
		    thePicture.Mask = zdGPSConstellationSkyMask
		    thePicture.Graphics.DrawPicture zdGPSConstellationSkyOuterRing, 0, 0
		    
		    // Store a reference to the buffer for later use
		    Self.pBuffer = thePicture
		    
		  End If
		  
		  RaiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  //-- Draw the buffer if it exists
		  
		  #Pragma Unused areas
		  
		  If Not ( Self.pBuffer Is Nil ) Then
		    
		    g.DrawPicture Self.pBuffer, 0, 0
		    
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub DrawBuffer()
		  //-- Draw the buffer picture
		  
		  Const kDegToRad = 0.017453292519943
		  Const kHalfSkySize = 100.0
		  
		  // Just to avoid problems
		  If Self.pBuffer Is Nil Then Return
		  
		  Dim g As Graphics = Self.pBuffer.Graphics
		  
		  // Still trying to avoid problem
		  If g Is Nil Then Return
		  
		  // Draw the background
		  g.DrawPicture zdGPSConstellationSky, 0, 0
		  
		  Dim theLastIndex As Integer = Self.pGPSConstellation.Ubound
		  
		  For i As Integer = 0 To theLastIndex
		    
		    // Retrieve the satellite
		    Dim theSat As zdGPSKit.GPSSatellite = Self.pGPSConstellation( i )
		    
		    If Not ( theSat Is Nil ) Then
		      
		      // Process the elevation
		      Dim theVectorLength As Double = Cos( theSat.Elevation * kDegToRad ) * kHalfSkySize
		      // Rotate the azimuth 90° CCW and convert it to Radians
		      Dim theAzimuthRad As Double = ( theSat.Azimuth - 90.0 ) * kDegToRad
		      
		      // Compute the position in the sky and translate the axes
		      Dim theX As Integer = Ctype( kHalfSkySize + Cos( theAzimuthRad ) * theVectorLength, Integer )
		      Dim theY As Integer = CType( kHalfSkySize + Sin( theAzimuthRad ) * theVectorLength, Integer )
		      
		      // Draw the satellite
		      zdGPSConstellationDisplay.DrawSatellite g, theX, theY, theSat.PRN, theSat.UsedInFix
		      
		    End If
		    
		  Next
		  
		  // Draw the sky's white outer ring
		  g.DrawPicture zdGPSConstellationSkyOuterRing, 0, 0
		  
		  // Ask for a redraw ASAP
		  Self.Invalidate
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DrawSatellite(g As Graphics, inCenterX As Integer, inCenterY As Integer, inPRN As Integer, InActive As Boolean)
		  
		  //-- Draw a satellite icon with the given parameters
		  
		  Dim theSourceX, thePRN As Integer
		  
		  // There is no more than 32 satellites.
		  If inPRN < 0 Or inPRN > 32 Then
		    
		    thePRN = 0
		    
		  Else
		    
		    thePRN = inPRN
		    
		  End If
		  
		  // Determine the Column
		  If InActive Then
		    
		    theSourceX = 0
		    
		  Else
		    
		    theSourceX = kSatWidth
		    
		  End If
		  
		  // Draw the satellite icon
		  g.DrawPicture zdGPSConstellationIcons, _
		  inCenterX - zdGPSConstellationDisplay.kSatWidth \ 2, _
		  inCenterY - zdGPSConstellationDisplay.kSatHeight \ 2, _
		  zdGPSConstellationDisplay.kSatWidth, _
		  zdGPSConstellationDisplay.kSatHeight, _
		  theSourceX, _
		  zdGPSConstellationDisplay.kSatHeight * thePRN, _
		  zdGPSConstellationDisplay.kSatWidth, _
		  zdGPSConstellationDisplay.kSatHeight
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessGPGSACommand(inCommand As zdGPSKit.NMEA.GPGSA)
		  
		  // Create an array to store the used sat's PRN
		  Dim UsedPRNs() As Integer
		  
		  // Collect all used satellites PRNs
		  For i As Integer = 1 To 12
		    
		    // Retrieve the Data
		    Dim thePRN As Variant = inCommand.SatellitePRN( i )
		    
		    // If it's a valid data, then store it in the array
		    If thePRN.IsNumeric Then UsedPRNs.Append thePRN
		    
		  Next
		  
		  Dim theLastIndex As Integer = Self.pGPSConstellation.Ubound
		  
		  // Loop through all satellites
		  For i As integer = 0 to theLastIndex
		    
		    // Retrieve the satellite reference for this index
		    Dim theSat As zdGPSKit.GPSSatellite = Self.pGPSConstellation( i )
		    
		    // If we have a satellite...
		    If Not ( theSat Is Nil ) Then
		      
		      // We try to determine if it's used in the fix calculation
		      theSat.UsedInFix = ( theSat.SNRatio <> 0 ) And ( UsedPRNs.IndexOf( theSat.PRN ) > -1 )
		      
		    End If
		    
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessGPGSVCommand(inCommand As zdGPSKit.NMEA.GPGSV)
		  //-- Process the available GPGSV commands
		  
		  // Check if the array's size is still accurate
		  Dim theSatelliteCount As Integer = CType( Val( inCommand.TotalSatelliteCount ), Integer )
		  If theSatelliteCount <> Self.pGPSConstellation.Ubound - 1 Then
		    Redim Self.pGPSConstellation( theSatelliteCount )
		  End If
		  
		  Dim theCmdNumber As Integer = CType( Val( inCommand.MessageNumber ), Integer )
		  
		  // Browsing the satellites from this message
		  For i As Integer = 1 To 4
		    
		    Dim theSatNumber As Integer = ( theCmdNumber - 1 ) * 4 + i
		    
		    // Process the next satellite if this one is null
		    If inCommand.SatellitePRN( i ) = "" Then Continue
		    
		    // Testing theSatNumber to avoid unexpected OutOfBoundsException
		    If theSatNumber <= Self.pGPSConstellation.Ubound Then
		      
		      // Retrieve the satellite instance
		      Dim theSat As zdGPSKit.GPSSatellite = Self.pGPSConstellation( theSatNumber )
		      
		      // Create a new GPS satellite if needed
		      If theSat Is Nil Then
		        
		        theSat = New zdGPSKit.GPSSatellite
		        Self.pGPSConstellation( theSatNumber ) = theSat
		        
		      End If
		      
		      // Set the satellite parameters
		      theSat.PRN = CType( Val( inCommand.SatellitePRN( i ) ), Integer )
		      theSat.Elevation = Ctype( Val( inCommand.SatelliteElevation( i ) ), Integer )
		      theSat.Azimuth = Ctype( Val( inCommand.SatelliteAzimuth( i ) ), Integer )
		      theSat.SNRatio = Ctype( Val( inCommand.SatelliteSNRatio( i ) ), Integer )
		      theSat.UsedInFix = False
		      
		    End If
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshConstellation()
		  //-- Refresh the constellation display
		  
		  Self.DrawBuffer
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h21
		Private pBuffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pGPSConstellation(12) As zdGPSKit.GPSSatellite
	#tag EndProperty


	#tag Constant, Name = kSatHeight, Type = Double, Dynamic = False, Default = \"20", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSatWidth, Type = Double, Dynamic = False, Default = \"24", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
