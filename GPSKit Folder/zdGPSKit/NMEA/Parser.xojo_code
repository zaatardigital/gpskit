#tag Class
 Attributes ( Encryption = True ) Protected Class Parser
Inherits Thread
Implements zdGPSKit.DataListener,zdGPSKit.FixProvider
	#tag Event
		Sub Run()
		  //-- Periodically test if there is a new fix to be created.
		  
		  Dim theLastUpdateTime As Double
		  Dim theGPSFix As zdGPSKit.Fix
		  
		  Do
		    
		    // If we have new data, create a new fix
		    If Not theLastUpdateTime.Equals( Self.pLastUpdateTime, 0 ) Then
		      
		      // There has been new data
		      theLastUpdateTime = Self.pLastUpdateTime
		      
		      theGPSFix = Self.MakeNewFix
		      
		      If Not ( theGPSFix Is Nil ) Then
		        
		        Self.pGPSFix = Self.MakeNewFix
		        
		      End If
		      
		    End If
		    
		    // Go to sleep for a while
		    Self.Sleep( 400 )
		    
		  Loop Until Me.pShutdownFlag
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ClearSentenceDictionary()
		  //-- Erase the entire sentence dictionary
		  
		  Self.pSentences.Clear
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub CommandHandler(inCommand As zdGPSKit . NMEA . Sentence)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Constructor()
		  //-- Initializing the instance
		  
		  // Create the sentence dictionary
		  Self.pSentences = New Dictionary
		  
		  // Start the thread
		  Self.Run
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataFlowError(inErrorCode As Integer)
		  //-- An error has occured in the flow
		  // Part of the zdGPSKit.DataListener interface.
		  
		  Raise New zdGPSKit.GPSKitException( inErrorCode, CurrentMethodName + ": A flow error #" + Str( inErrorCode ) + " has occured." )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLatestGPSFix() As zdGPSKit.Fix
		  //-- Return the latest GPS fix received
		  // Part of the zdGPSKit.FixProvider interface.
		  
		  Return Self.pGPSFix
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSentence(inSentenceType As String) As zdGPSKit.NMEA.Sentence
		  //-- Return the sentence by its name if it exists. Otherwise, it returns Nil.
		  
		  Dim theDictionary As Dictionary = Self.pSentences
		  
		  // If we have a dictionary and it has this sentence...
		  If Not ( theDictionary Is Nil ) And theDictionary.HasKey( inSentenceType ) Then
		    
		    // ... Then return the sentence
		    Return theDictionary.Value( inSentenceType )
		    
		  Else
		    
		    // No Dictionary or no sentence with this name so we return nil
		    Return Nil
		    
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasSentence(inSentenceType As String) As Boolean
		  //-- Return True if this command is present
		  
		  Dim theDictionary As Dictionary = Self.pSentences
		  
		  // If there is no dictionary...
		  If theDictionary Is Nil Then
		    
		    // ... there is no sentence at all
		    Return False
		    
		  Else
		    
		    // Check the dictionary's keys and return the result
		    Return theDictionary.HasKey( inSentenceType )
		    
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function MakeNewFix() As zdGPSKit.Fix
		  //-- Create a new fix from the available Data
		  
		  Dim theNewGPSFix As New zdGPSKit.Fix
		  Dim theLocation As zdGPSKit.Geo.EarthLocation = theNewGPSFix.EarthLocation
		  Dim theMotion As zdGPSKit.Geo.EarthMotion = theNewGPSFix.EarthMotion
		  
		  // Looking for Position data
		  If Self.HasSentence( "GPRMC" ) Then
		    
		    Dim theGPRMC As zdGPSKit.NMEA.GPRMC = zdGPSKit.NMEA.GPRMC( Self.GetSentence( "GPRMC" ) )
		    
		    // --- Get the latitude and longitude data ---
		    
		    Dim theLatitude As New zdGPSKit.Geo.Latitude
		    If theLatitude.ParseFormatWGS84( theGPRMC.Latitude, theGPRMC.LatitudeHemisphere ) Then _
		    theLocation.Latitude = theLatitude
		    
		    Dim theLongitude As New zdGPSKit.Geo.Longitude
		    If theLongitude.ParseFormatWGS84( theGPRMC.Longitude, theGPRMC.LongitudeHemisphere ) Then _
		    theLocation.Longitude = theLongitude
		    
		    // Get the ground speed Data
		    theMotion.GroundSpeedKnots = theGPRMC.GroundSpeedKnots
		    
		    // Get the Track made good
		    theMotion.Course = theGPRMC.CourseTrue
		    
		    // Get the time
		    theNewGPSFix.GPSTime = theGPRMC.FixDateString + " " + theGPRMC.UTCTimeString
		    
		  End If
		  
		  // Getting the altitude
		  If Self.HasSentence( "GPGGA" ) Then
		    
		    Dim theGPGGA As zdGPSKit.NMEA.GPGGA = zdGPSKit.NMEA.GPGGA( Self.GetSentence( "GPGGA" ) )
		    theNewGPSFix.EarthLocation.Altitude = theGPGGA.Altitude
		    
		  End If
		  
		  Return theNewGPSFix
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NewData(inData As String)
		  //-- Handles the new data sent by the DataProvider
		  // Part of the zdGPSKit.DataListener interface.
		  
		  // *--*
		  // *--* Tokenize the incoming data
		  // *--*
		  
		  Dim theData, theSentences() As String
		  
		  // Insert the unprocessed data before the new one
		  theData = Self.pUnprocessedData + inData.DefineEncoding( Encodings.ASCII )
		  
		  // According to the NMEA 0183 protoocol,
		  // we split them into an array of sentence delimited by a CRLF marker
		  theSentences = theData.SplitB( EndOfLine.Windows )
		  
		  // NMEA sentences always end with CRLF. If there is an unfinished sentence, we store it for the next call
		  // If not, then the last string in the array is an empty string (""), so storing it clears the unprocessed data buffer.
		  Self.pUnprocessedData = theSentences.Pop
		  
		  // *--*
		  // *--* Parse the NMEA 0183 data
		  // *--*
		  
		  // Do we have data to parse
		  Dim theLastIndex As Integer = theSentences.Ubound
		  If theLastIndex < 0 Then Return
		  
		  For i As Integer = 0 To theLastIndex
		    
		    Dim theCommand As zdGPSKit.NMEA.Sentence = zdGPSKit.NMEA.Sentence.NewSentence( theSentences( i ) )
		    
		    If Not ( theCommand Is Nil ) Then
		      
		      // Retrieve the command name
		      Dim theKey As String = theCommand.Name
		      
		      // Handle special case(s) if needed
		      If theKey = "GPGSV" Then
		        // There can be multiple GPGSV sentences
		        // Add the sentence number in the key
		        theKey = theKey + theCommand.Parameter( 2 )
		        
		      End If
		      
		      // Store the command
		      Self.pSentences.Value( theKey ) = theCommand
		      
		    End If
		    
		  Next
		  
		  // Update the time of last update
		  Me.pLastUpdateTime = Microseconds
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Shutdown()
		  //-- Raising the shutdown flag to signal the shutdown status to the thread loop
		  
		  Self.pShutdownFlag = True
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private pGPSFix As zdGPSKit.Fix
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pLastUpdateTime As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pSentences As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pShutdownFlag As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pUnprocessedData As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
