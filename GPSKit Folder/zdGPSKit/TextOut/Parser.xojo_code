#tag Class
 Attributes ( Encryption = True ) Protected Class Parser
Implements zdGPSKit.DataListener,zdGPSKit.FixProvider
	#tag Method, Flags = &h0
		Sub DataFlowError(inErrorCode As Integer)
		  // Part of the zdGPSKit.DataListener interface.
		  
		  Raise New zdGPSKit.GPSKitException( inErrorCode, CurrentMethodName + ": A flow error #" + Str( inErrorCode ) + " has occurred." )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLatestGPSFix() As zdGPSKit.Fix
		  // Part of the zdGPSKit.FixProvider interface.
		  
		  Return Self.pLatestFix
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function MakeGPSFix(inFixData As zdGPSKit.TextOut.Parser.FixTextData) As zdGPSKit.Fix
		  
		  // Check the validity of the first character
		  If inFixData.StartMarker <> zdGPSKit.TextOut.Parser.kFirstChar Then Return Nil
		  
		  // The data seem to be valid, here we go
		  Dim theFix As New zdGPSKit.Fix
		  
		  // *--*
		  // *--* The GPS device time
		  // *--*
		  
		  If IsNumeric( inFixData.Year ) Then
		    // The format is "yyyy-mm-dd hh:mm:ss"
		    theFix.GPSTime = "20" + inFixData.Year + "-" +  inFixData.Month + "-" + inFixData.Day + " " _
		    + inFixData.Hour + ":" + inFixData.Minute + ":" + inFixData.Second
		    
		  Else
		    
		    theFix.GPSTime = zdGPSKit.kSymbolNotAvailable
		    
		  End If
		  
		  // *--*
		  // *--* The latitude
		  // *--*
		  
		  If IsNumeric( inFixData.LatitudeInt ) Then
		    
		    // Create a new latitude and parse the data
		    Dim theLatitude As New zdGPSKit.Geo.Latitude
		    If theLatitude.ParseFormatWGS84( inFixData.LatitudeInt + "." + inFixData.LatitudeDec, inFixData.LatitudeHemisphere ) Then
		      
		      // Set this new longitude
		      theFix.EarthLocation.Latitude = theLatitude
		      
		    End If
		    
		  End If
		  
		  // *--*
		  // *--* The longitude
		  // *--*
		  
		  If IsNumeric( inFixData.LongitudeInt ) Then
		    
		    // Create a new latitude object and parse the data
		    Dim theLongitude As New zdGPSKit.Geo.Longitude
		    If theLongitude.ParseFormatWGS84( inFixData.LongitudeInt + "." + inFixData.LongitudeDec, inFixData.LongitudeHemisphere ) Then
		      
		      // Set this new longitude
		      theFix.EarthLocation.Longitude = theLongitude
		      
		    End If
		    
		  End If
		  
		  // *--*
		  // *--* The altitude ( in meters )
		  // *--*
		  
		  // Do we have valid data?
		  If IsNumeric( inFixData.Altitude ) Then
		    // Set the altitude property
		    theFix.EarthLocation.Altitude = Val( inFixData.Altitude )
		    
		  End If
		  
		  // *--*
		  // *--* The horizontal motion
		  // *--*
		  
		  Dim theMotion As zdGPSKit.Geo.EarthMotion = theFix.EarthMotion
		  
		  If IsNumeric( inFixData.EWVelocity ) And IsNumeric( inFixData.NSVelocity ) Then
		    
		    Dim theEWVelocity, theNSVelocity, theVelocity, theCourse As Double
		    
		    // Extracting and rotating the axes
		    
		    // Compute the East-West speed in m/s
		    If inFixData.EWVelocityDirection = "E" Then
		      theEWVelocity = Val( inFixData.EWVelocity ) / 10.0
		      
		    Else
		      theEWVelocity = - Val( inFixData.EWVelocity ) / 10.0
		      
		    End If
		    
		    // Compute the North-South speed in m/s
		    If inFixData.EWVelocityDirection = "N" Then
		      theNSVelocity = Val( inFixData.NSVelocity) / 10.0
		      
		    Else
		      theNSVelocity = - Val( inFixData.NSVelocity ) / 10.0
		      
		    End If
		    
		    // Compute the velocity over ground( the original data are in m/s )
		    theVelocity = Sqrt( theNSVelocity^2.0 + theEWVelocity^2.0 ) * zdGPSKit.kRatioMeterSecToFeetMin
		    
		    // If there is a speed, we can calculate a course
		    If theVelocity > 0.0 Then
		      
		      // Compute the motion angle with the axis rotation in degrees
		      theCourse = atan2( theEWVelocity, theNSVelocity ) * zdGPSKit.kRatioRadToDeg
		      
		      // Handle negative values if needed
		      If theCourse < 0.0 Then theCourse = 360.0 + theCourse
		      
		    End If
		    
		    theFix.EarthMotion.GroundSpeedKmh = theVelocity
		    theFix.EarthMotion.Course = theCourse
		    
		  End If
		  
		  // *--*
		  // *--* The vertical motion
		  // *--*
		  
		  If IsNumeric( inFixData.VerticalVelocity ) Then
		    
		    If inFixData.VerticalVelocityDirection = "U" Then
		      // We are going up
		      theMotion.VerticalSpeedMeterSec = Val( inFixData.VerticalVelocity ) / 10.0
		      
		    Else
		      // We are going down
		      theMotion.VerticalSpeedMeterSec = -Val( inFixData.VerticalVelocity ) / 10.0
		      
		    End If
		    
		  End If
		  
		  // Return the result
		  Return theFix
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NewData(inData As String)
		  //-- Part of the zdGPSKit.DataListener interface.
		  
		  // *--*
		  // *--* Here we parse the data
		  // *--*
		  
		  // Defensive coding
		  If inData = "" Then Return
		  
		  // Add the new data to the unprocessed data
		  Dim theData As String = Self.pUnprocessedData + inData.DefineEncoding( Encodings.ASCII )
		  
		  Dim theChunks() As String = theData.Split( EndOfLine.Windows )
		  
		  // Remove the data remainder and store it
		  Self.pUnprocessedData = theChunks.pop
		  
		  // If there is no data to parse, we're done
		  If theChunks.Ubound < 0 Then Return
		  
		  // Extract what sould be a valid chunk
		  theData = theChunks.Pop
		  
		  // Check length and first char
		  If theData.LenB = zdGPSKit.TextOut.Parser.kChunkLength Then
		    
		    // Prepare the fix structure
		    Dim theFixStruct As zdGPSKit.TextOut.Parser.FixTextData
		    theFixStruct.StringValue( False ) = theData
		    
		    // And extract a new GPS fix
		    Dim theGPSFix As zdGPSKit.Fix = zdGPSKit.TextOut.Parser.MakeGPSFix( theFixStruct )
		    
		    If Not ( theGPSFix Is Nil ) Then
		      
		      // This is a new fix so
		      Self.pLatestFix = theGPSFix
		      
		    End If
		    
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Text output details
		--
		Better viewed with a fixed width font.
		--
		|  Simple Text Output Format:
		|
		|  The simple text (ASCII) output contains time, position, and velocity data in
		|  the fixed width fields (not delimited) defined in the following table:
		|
		|      FIELD DESCRIPTION:      WIDTH:  NOTES:
		|      ----------------------- ------- ------------------------
		|      Sentence start          1       Always '@'
		|      ----------------------- ------- ------------------------
		|     /Year                    2       Last two digits of UTC year
		|    | ----------------------- ------- ------------------------
		|    | Month                   2       UTC month, "01".."12"
		|  T | ----------------------- ------- ------------------------
		|  i | Day                     2       UTC day of month, "01".."31"
		|  m | ----------------------- ------- ------------------------
		|  e | Hour                    2       UTC hour, "00".."23"
		|    | ----------------------- ------- ------------------------
		|    | Minute                  2       UTC minute, "00".."59"
		|    | ----------------------- ------- ------------------------
		|     \Second                  2       UTC second, "00".."59"
		|      ----------------------- ------- ------------------------
		|     /Latitude hemisphere     1       'N' or 'S'
		|    | ----------------------- ------- ------------------------
		|    | Latitude position       7       WGS84 ddmmmmm, with an implied
		|    |                                 decimal after the 4th digit
		|    | ----------------------- ------- ------------------------
		|    | Longitude hemishpere    1       'E' or 'W'
		|    | ----------------------- ------- ------------------------
		|    | Longitude position      8       WGS84 dddmmmmm with an implied
		|  P |                                 decimal after the 5th digit
		|  o | ----------------------- ------- ------------------------
		|  s | Position status         1       'd' if current 2D differential GPS position
		|  i |                                 'D' if current 3D differential GPS position
		|  t |                                 'g' if current 2D GPS position
		|  i |                                 'G' if current 3D GPS position
		|  o |                                 'S' if simulated position
		|  n |                                 '_' if invalid position
		|    | ----------------------- ------- ------------------------
		|    | Horizontal posn error   3       EPH in meters
		|    | ----------------------- ------- ------------------------
		|    | Altitude sign           1       '+' or '-'
		|    | ----------------------- ------- ------------------------
		|    | Altitude                5       Height above or below mean
		|     \                                sea level in meters
		|      ----------------------- ------- ------------------------
		|     /East/West velocity      1       'E' or 'W'
		|    |     direction
		|    | ----------------------- ------- ------------------------
		|    | East/West velocity      4       Meters per second in tenths,
		|    |     magnitude                   ("1234" = 123.4 m/s)
		|  V | ----------------------- ------- ------------------------
		|  e | North/South velocity    1       'N' or 'S'
		|  l |     direction
		|  o | ----------------------- ------- ------------------------
		|  c | North/South velocity    4       Meters per second in tenths,
		|  i |     magnitude                   ("1234" = 123.4 m/s)
		|  t | ----------------------- ------- ------------------------
		|  y | Vertical velocity       1       'U' (up) or 'D' (down)
		|    |     direction
		|    | ----------------------- ------- ------------------------
		|    | Vertical velocity       4       Meters per second in hundredths,
		|     \    magnitude                   ("1234" = 12.34 m/s)
		|      ----------------------- ------- ------------------------
		|      Sentence end            2       Carriage return, '0x0D', and
		|                                      line feed, '0x0A'
		|      ----------------------- ------- ------------------------
		|
		|  If a numeric value does not fill its entire field width, the field is padded
		|  with leading '0's (eg. an altitude of 50 meters above MSL will be output as
		|  "+00050").
		|
		|  Any or all of the data in the text sentence (except for the sentence start
		|  and sentence end fields) may be replaced with underscores to indicate
		|  invalid data.
	#tag EndNote


	#tag Property, Flags = &h21
		Private pLatestFix As zdGPSKit.Fix
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pUnprocessedData As String
	#tag EndProperty


	#tag Constant, Name = kChunkLength, Type = Double, Dynamic = False, Default = \"55", Scope = Private, Attributes = \""
	#tag EndConstant

	#tag Constant, Name = kFirstChar, Type = String, Dynamic = False, Default = \"@", Scope = Private, Attributes = \""
	#tag EndConstant


	#tag Structure, Name = FixTextData, Flags = &h1
		StartMarker As String*1
		  Year As String*2
		  Month As String*2
		  Day As String*2
		  Hour As String*2
		  Minute As String*2
		  Second As String*2
		  LatitudeHemisphere As String*1
		  LatitudeInt As String*4
		  LatitudeDec As String*3
		  LongitudeHemisphere As String*1
		  LongitudeInt As String*5
		  LongitudeDec As String*3
		  PositionStatus As String*1
		  HorizontalPosnError As String*3
		  Altitude As String*6
		  EWVelocityDirection As String*1
		  EWVelocity As String*4
		  NSVelocityDirection As String*1
		  NSVelocity As String*4
		  VerticalVelocityDirection As String*1
		VerticalVelocity As String*4
	#tag EndStructure


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
