#tag Class
 Attributes ( Encryption = True ) Protected Class Coordinate
	#tag Method, Flags = &h0
		 Shared Sub CleanAllInstancesCache()
		  //-- Calls all known instances' pCleanFormatCaches method
		  
		  // We are going downward through the array
		  For i As Integer = zdGPSKit.Geo.Coordinate.pInstances.Ubound DownTo 0
		    
		    // Retrieve the value of the WeakRef
		    Dim theObject As Object = zdGPSKit.Geo.Coordinate.pInstances( i ).Value
		    
		    If theObject Is Nil Then
		      
		      // Oops ! This one is gone. We can remove it
		      zdGPSKit.Geo.Coordinate.pInstances.Remove i
		      
		    Else
		      
		      // Otherwise,clean all the caches
		      zdGPSKit.Geo.Coordinate( theObject ).pCleanFormatCaches
		      
		    End If
		    
		  Next i
		  
		  Exception exc As RunTimeException
		    // Catch unexpected problems
		    exc.Message = CurrentMethodName + ": catch an unexpected problem --- " + exc.Message
		    Raise exc
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  
		  // Store a weak reference of this new instance
		  Self.pInstances.Append New WeakRef( Me )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  //-- We need to remove this instance's reference from the 'all instances' array
		  
		  For i As Integer = zdGPSKit.Geo.Coordinate.pInstances.Ubound DownTo 0
		    
		    // Does it reference this instance?
		    If zdGPSKit.Geo.Coordinate.pInstances( i ).Value = Me Then
		      
		      // Yes, we remove it from the array
		      zdGPSKit.Geo.Coordinate.pInstances.Remove i
		      
		      // We're done here
		      Return
		      
		    End If
		    
		  Next i
		  
		  Exception exc As RunTimeException
		    // Catch unexpected problems
		    exc.Message = CurrentMethodName + ": catch an unexpected problem --- " + exc.Message
		    Raise exc
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatDD() As String
		  
		  // Does the cached string exist ?
		  If Self.pFormatCacheDD = "" Then Self.pRenderCacheDD
		  
		  // Return the string in cache
		  Return Self.pFormatCacheDD
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatDefault() As String
		  
		  //-- Return the default format string
		  
		  Select Case zdGPSKit.Geo.Coordinate.DefaultFormat
		    
		  Case zdGPSKit.Geo.Coordinate.CoordinateFormat.DecimalDegrees
		    Return Self.FormatDD
		    
		  Case zdGPSKit.Geo.Coordinate.CoordinateFormat.DegreesMinutes
		    Return Self.FormatDM
		    
		  Case zdGPSKit.Geo.Coordinate.CoordinateFormat.DegreesMinutesSeconds
		    Return Self.FormatDMS
		    
		  Case zdGPSKit.Geo.Coordinate.CoordinateFormat.WGS84
		    Return Self.FormatWGS84
		    
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatDM() As String
		  
		  // Does the cached string exist ?
		  If Self.pFormatCacheDM = "" Then
		    
		    // No, create it
		    Self.pRenderCacheDM
		    
		  End If
		  
		  // Return the string in cache
		  Return Self.pFormatCacheDM
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatDMS() As String
		  
		  // Does the cached string exist ?
		  If Self.pFormatCacheDMS = "" Then
		    
		    // No, create it
		    Self.pRenderCacheDMS
		    
		  End If
		  
		  // Return the string in cache
		  Return Self.pFormatCacheDMS
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatWGS84() As String
		  
		  // Does the cached string exist ?
		  If Self.pFormatCacheWGS84 = "" Then
		    
		    // No, create it
		    Self.pRenderCacheWGS84
		    
		  End If
		  
		  // Return the string in cache
		  Return Self.pFormatCacheWGS84
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HemisphereLetter() As String
		  
		  // If the cache is empty...
		  If Self.pCacheHemisphereLetter = "" Then
		    
		    // ...Render the cache
		    Self.pRenderCacheHemisphereLetter
		    
		  End If
		  
		  // Return the cached string
		  Return Self.pCacheHemisphereLetter
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseFormatDD(inString As String) As Boolean
		  
		  //-- Parse the Decimal Degree Format
		  // It accepts the following Formats:
		  //   Hddd.ddddd°
		  //   ddd.ddddd°H
		  //   [+/-]ddd.ddddd°
		  // The number of digit doesn't matter
		  
		  // Clean the string
		  Dim theCleanString As String = Trim( inString )
		  Dim theCleanStringLength As Integer = theCleanString.Len
		  
		  Dim theHemisphereSign As Integer
		  Dim theDDString As String
		  
		  // Get the last character
		  Dim theLastChar As String = theCleanString.Right( 1 )
		  
		  // Guess the format used in InString
		  If theLastChar = zdGPSKit.Geo.Coordinate.kMarkDegree Then
		    
		    // the last character is a single quote
		    Dim theFirstChar As String = theCleanString.Left( 1 )
		    
		    If IsNumeric( theFirstChar ) Then
		      
		      // Guessed format is ddd.ddddd°
		      theHemisphereSign = 1
		      theDDString = theCleanString
		      
		    Elseif theFirstChar = "+" Then
		      
		      // Guessed format is +ddd.ddddd°
		      theHemisphereSign = 1
		      theDDString = theCleanString.Right( theCleanStringLength - 1 )
		      
		    Elseif theFirstChar = "-" Then
		      
		      // Guessed format is -ddd.ddddd°
		      theHemisphereSign = -1
		      theDDString = theCleanString.Right( theCleanStringLength - 1 )
		      
		    Else
		      
		      // Guessed format is Hddd.ddddd°
		      theHemisphereSign = RaiseEvent GuessHemisphereSign( theFirstChar )
		      theDDString = theCleanString.Right( theCleanStringLength - 1 )
		      
		    End If
		    
		  Else
		    
		    // Guessed format is ddd.ddddd°H
		    theHemisphereSign = RaiseEvent GuessHemisphereSign( theLastChar )
		    theDDString = theCleanString.Left( theCleanStringLength - 1 )
		    
		  End If
		  
		  // Validate the Hemisphere
		  If theHemisphereSign = 0 Then Return False
		  
		  // --- Extract and validate the degree part ---
		  
		  // The Last character must be a degree mark
		  If theDDString.Right( 1 ) <> zdGPSKit.Geo.Coordinate.kMarkDegree Then Return False
		  
		  // Remove this degree mark and trim the value
		  theDDString = Trim( theDDString.Left( theDDString.Len - 1 ) )
		  
		  // It must be a numeric expression, and the first char has to be a digit
		  If Not ( IsNumeric( theDDString ) And IsNumeric( theDDString.Left( 1 ) ) ) Then Return False
		  
		  // Compute the value
		  Dim theValue As Double = CDbl( theDDString )
		  
		  // Validate the native value
		  If Not RaiseEvent ValidateData( theValue ) Then Return False
		  
		  // Eventually, we set the native value...
		  Self.pNativeValue = theHemisphereSign * theValue
		  
		  // ...And clean the caches
		  Self.pCleanFormatCaches
		  
		  // We are successfully done
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseFormatDM(inString As String) As Boolean
		  //-- Parse the Degree and decimal minutes Format
		  
		  // It accepts the following formats:
		  //   Hddd°mm.mmm'
		  //   ddd°mm.mmm'H
		  //   [+/-]ddd°mm.mmm'
		  // The number of digit doesn't matter
		  
		  // Trim the string from leading and trailing whitespaces
		  Dim theCleanString As String = Trim( inString )
		  Dim theCleanStringLength As Integer = theCleanString.Len
		  
		  Dim theHemisphereSign As Integer
		  Dim theDMString As String
		  
		  // Get the last character
		  Dim theLastChar As String = theCleanString.Right( 1 )
		  
		  // Guess the format used in InString
		  If theLastChar = zdGPSKit.Geo.Coordinate.kMarkMinute Then
		    
		    // the last character is a single quote
		    Dim theFirstChar As String = theCleanString.Left( 1 )
		    
		    If IsNumeric( theFirstChar ) Then
		      
		      // Guessed format is ddd°mm.mmm'
		      theHemisphereSign = 1
		      theDMString = theCleanString
		      
		    Elseif theFirstChar = "+" Then
		      
		      // Guessed format is +ddd°mm.mmm'
		      theHemisphereSign = 1
		      theDMString = theCleanString.Right( theCleanStringLength - 1 )
		      
		    Elseif theFirstChar = "-" Then
		      
		      // Guessed format is -ddd°mm.mmm'
		      theHemisphereSign = -1
		      theDMString = theCleanString.Right( theCleanStringLength - 1 )
		      
		    Else
		      
		      // Guessed format is Hddd°mm.mmm'
		      theHemisphereSign = RaiseEvent GuessHemisphereSign( theFirstChar )
		      theDMString = theCleanString.Right( theCleanStringLength - 1 )
		      
		    End If
		    
		  Else
		    
		    // Guessed format is ddd°mm.mmm'H
		    theHemisphereSign = RaiseEvent GuessHemisphereSign( theLastChar )
		    theDMString = theCleanString.Left( theCleanStringLength - 1 )
		    
		  End If
		  
		  // Validate the Hemisphere
		  If theHemisphereSign = 0 Then Return False
		  
		  // --- Extract and validate the degree part ---
		  
		  // Search for the degree mark
		  Dim theDegreeMarkPosition As Integer = theDMString.InStr( zdGPSKit.Geo.Coordinate.kMarkDegree )
		  
		  // We must have a degree mark
		  If theDegreeMarkPosition = 0 Then Return False
		  
		  // Extract the degree part
		  Dim theDegreePart As String = Trim( theDMString.Left( theDegreeMarkPosition - 1 ) )
		  
		  // It must be a numeric expression, and the first char has to be a digit
		  If Not ( IsNumeric( theDegreePart ) And IsNumeric( theDegreePart.Left( 1 ) ) ) Then Return False
		  
		  // Convert it to a Double
		  Dim theDegreeValue As Double = Val( theDegreePart )
		  
		  // It must also be an integer value
		  If Not theDegreeValue.IsIntegerNumber Then Return False
		  
		  // --- Extract and validate the Minutes part ---
		  
		  // Search for the minutes mark which should be at least 2 chars after the degree mark
		  Dim theMinuteMarkPosition As Integer = theDMString.InStr( theDegreeMarkPosition + 2, zdGPSKit.Geo.Coordinate.kMarkMinute )
		  
		  // We must have a minute mark
		  If theMinuteMarkPosition = 0 Then Return False
		  
		  // Extract the minute part
		  Dim theMinutePart As String = Trim( theDMString.Mid( theDegreeMarkPosition + 1, theMinuteMarkPosition - theDegreeMarkPosition - 1 ) )
		  
		  // It must be a numeric expression, and the first char has to be a digit
		  If Not ( IsNumeric( theMinutePart ) And IsNumeric( theMinutePart.Left( 1 ) ) ) Then Return False
		  
		  // Convert it to a double
		  Dim theMinuteValue As Double = CDbl( theMinutePart )
		  
		  // Check if its in the minutes range
		  If theMinuteValue > 60.0 Then Return False
		  
		  // --- Compute and validate the native value ---
		  
		  // Calculate...
		  Dim theValue As Double = theHemisphereSign * ( theDegreeValue + theMinuteValue / 60.0 )
		  
		  // ... and validate
		  If Not RaiseEvent ValidateData( theValue ) Then Return False
		  
		  // Eventually, we set the native value...
		  Self.pNativeValue = theValue
		  
		  // ...And clean the caches
		  Self.pCleanFormatCaches
		  
		  // We are successfully done
		  Return True
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseFormatDMS(inString As String) As Boolean
		  
		  //-- Parse the Degree and decimal minutes Format
		  // It accepts the following Formats
		  //   Hddd°mm.mmm'
		  //   ddd°mm.mmm'H
		  //   [+/-]ddd°mm.mmm'
		  // The number of digit doesn't matter
		  
		  // Trim the string from leading and trailing whitespaces
		  Dim theCleanString As String = Trim( inString )
		  Dim theCleanStringLength As Integer = theCleanString.Len
		  
		  Dim theHemisphereSign As Integer
		  Dim theDMString As String
		  
		  // Get the last character
		  Dim theLastChar As String = theCleanString.Right( 1 )
		  
		  // Guess the format used in InString
		  If theLastChar = zdGPSKit.Geo.Coordinate.kMarkMinute Then
		    
		    // the last character is a single quote
		    Dim theFirstChar As String = theCleanString.Left( 1 )
		    
		    If IsNumeric( theFirstChar ) Then
		      
		      // Guessed format is ddd°mm.mmm'
		      theHemisphereSign = 1
		      theDMString = theCleanString
		      
		    Elseif theFirstChar = "+" Then
		      
		      // Guessed format is +ddd°mm.mmm'
		      theHemisphereSign = 1
		      theDMString = theCleanString.Right( theCleanStringLength - 1 )
		      
		    Elseif theFirstChar = "-" Then
		      
		      // Guessed format is -ddd°mm.mmm'
		      theHemisphereSign = -1
		      theDMString = theCleanString.Right( theCleanStringLength - 1 )
		      
		    Else
		      
		      // Guessed format is Hddd°mm.mmm'
		      theHemisphereSign = RaiseEvent GuessHemisphereSign( theFirstChar )
		      theDMString = theCleanString.Right( theCleanStringLength - 1 )
		      
		    End If
		    
		  Else
		    
		    // Guessed format is ddd°mm.mmm'H
		    theHemisphereSign = RaiseEvent GuessHemisphereSign( theLastChar )
		    theDMString = theCleanString.Left( theCleanStringLength - 1 )
		    
		  End If
		  
		  // Validate the Hemisphere
		  If theHemisphereSign = 0 Then Return False
		  
		  // --- Extract and validate the degree part ---
		  
		  // Search for the degree mark
		  Dim theDegreeMarkPosition As Integer = theDMString.InStr( zdGPSKit.Geo.Coordinate.kMarkDegree )
		  
		  // We must have a degree mark
		  If theDegreeMarkPosition = 0 Then Return False
		  
		  // Extract the degree part
		  Dim theDegreePart As String = Trim( theDMString.Left( theDegreeMarkPosition - 1 ) )
		  
		  // It must be a numeric expression, and the first char has to be a digit
		  If Not ( IsNumeric( theDegreePart ) And IsNumeric( theDegreePart.Left( 1 ) ) ) Then Return False
		  
		  // Convert it to a Double
		  Dim theDegreeValue As Double = Val( theDegreePart )
		  
		  // It must also be an integer value
		  If Not theDegreeValue.IsIntegerNumber Then Return False
		  
		  // --- Extract and validate the Minutes part ---
		  
		  // Search for the minutes mark which should be at least 2 chars after the degree mark
		  Dim theMinuteMarkPosition As Integer = theDMString.InStr( theDegreeMarkPosition + 2, zdGPSKit.Geo.Coordinate.kMarkMinute )
		  
		  // We must have a minute mark
		  If theMinuteMarkPosition = 0 Then Return False
		  
		  // Extract the minute part
		  Dim theMinutePart As String = Trim( theDMString.Mid( theDegreeMarkPosition + 1, theMinuteMarkPosition - theDegreeMarkPosition - 1 ) )
		  
		  // It must be a numeric expression, and the first char has to be a digit
		  If Not ( IsNumeric( theMinutePart ) And IsNumeric( theMinutePart.Left( 1 ) ) ) Then Return False
		  
		  // Convert it to a double
		  Dim theMinuteValue As Double = CDbl( theMinutePart )
		  
		  // It must also be an integer value
		  If theMinuteValue.IsIntegerNumber Then Return False
		  
		  // Check if its in the minutes range
		  If theMinuteValue > 60.0 Then Return False
		  
		  // --- Extract and validate the SecondsPart ---
		  
		  // Search for the second mark which should be at least 2 chars after the minute mark
		  Dim theSecondMarkPosition As Integer = theDMString.InStr( theMinuteMarkPosition + 2, zdGPSKit.Geo.Coordinate.kMarkSecond )
		  
		  // We must have a 'seconds' mark
		  If theSecondMarkPosition = 0 Then Return False
		  
		  // Extract the 'seconds' part
		  Dim theSecondPart As String = Trim( theDMString.Mid( theMinuteMarkPosition + 1, theSecondMarkPosition - theMinuteMarkPosition - 1 ) )
		  
		  // It must be a numeric expression, and the first char has to be a digit
		  If Not ( IsNumeric( theSecondPart ) And IsNumeric( theSecondPart.Left( 1 ) ) ) Then Return False
		  
		  // Convert it to a double
		  Dim theSecondValue As Double = CDbl( theSecondPart )
		  
		  // Check if it's in the proper range
		  If theSecondValue > 60.0 Then Return False
		  
		  // --- Compute and validate the native value ---
		  
		  // Calculate...
		  Dim theValue As Double = theHemisphereSign * ( theDegreeValue + theMinuteValue / 60.0 + theSecondValue / 3600.0 )
		  
		  // ... and validate
		  If Not RaiseEvent ValidateData( theValue ) Then Return False
		  
		  // Eventually, we set the native value...
		  Self.pNativeValue = theValue
		  
		  // ...And clean the caches
		  Self.pCleanFormatCaches
		  
		  // We are successfully done
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseFormatWGS84(inString As String, inHemisphere As String) As Boolean
		  
		  // Get the hemisphere sign
		  Dim theHemisphereSign As Integer = RaiseEvent GuessHemisphereSign( inHemisphere )
		  
		  // and Validate the result
		  If theHemisphereSign = 0 Then Return False
		  
		  // Trim the input string
		  Dim theCleanString As String = Trim( inString )
		  
		  // The expression must be numeric and the first character must be a digit
		  If Not ( IsNumeric( theCleanString ) And IsNumeric( theCleanString.Left( 1 ) ) ) Then Return False
		  
		  // Extracting the parts
		  Dim theValue As Double = CDbl( theCleanString )
		  Dim theDegrees As Integer = Ctype( theValue / 100.0, Integer )
		  Dim theMinutes As Double = theValue - CType( theDegrees*100, Double )
		  
		  // Check if the minute value is in the range
		  If theMinutes >= 60.0 Then Return False
		  
		  // Calculate the native value
		  theValue = theHemisphereSign * ( theDegrees + theMinutes / 60.0 )
		  
		  // Validate this value
		  If Not RaiseEvent ValidateData( theValue ) Then Return False
		  
		  // Eventually set the native value
		  Self.pNativeValue = theValue
		  
		  // Reset the caches
		  Self.pCleanFormatCaches
		  
		  // We are successfully done
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pCleanFormatCaches()
		  
		  //-- Clean all the cached string
		  
		  Self.pFormatCacheDD = ""
		  Self.pFormatCacheDM = ""
		  Self.pFormatCacheDMS = ""
		  Self.pFormatCacheWGS84 = ""
		  Self.pCacheHemisphereLetter = ""
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRenderCacheDD()
		  
		  //-- Cache the formatted value with the Hemisphere letter
		  
		  // Add the hemisphere letter according to the global setting before storing in the cache
		  If zdGPSKit.Geo.Coordinate.HemisphereLetterFirst Then
		    
		    // The Hemisphere letter is a prefix
		    Self.pFormatCacheDD = Self.HemisphereLetter + " " + RaiseEvent FormatDD( Self.pNativeValue )
		    
		  Else
		    
		    // The Hemisphere letter is a suffix
		    Self.pFormatCacheDD = RaiseEvent FormatDD( Self.pNativeValue ) + " " + Self.HemisphereLetter
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRenderCacheDM()
		  
		  //-- Return the coordinate as a string in the degrees & decimal minutes format
		  
		  // Compute the data needed
		  Dim theDegrees As Integer = CType( Self.pNativeValue, Integer )
		  Dim theDecimalMinutes As Double = Abs( Self.pNativeValue -  theDegrees ) * 60.0
		  
		  // Ask the subclass to handle the formatting
		  Dim theHemisphereLetter As String = Self.HemisphereLetter
		  
		  // Add the hemisphere letter according to the global setting before storing in the cache
		  If zdGPSKit.Geo.Coordinate.HemisphereLetterFirst Then
		    
		    Self.pFormatCacheDM = theHemisphereLetter + " " + RaiseEvent FormatDM( theDegrees, theDecimalMinutes )
		    
		  Else
		    
		    Self.pFormatCacheDM =  RaiseEvent FormatDM( theDegrees, theDecimalMinutes ) + " " + theHemisphereLetter
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRenderCacheDMS()
		  
		  //-- Return the coordinate as a string in the degrees, minutes & decimal seconds format
		  
		  // Compute the data needed
		  Dim theDegrees As Integer = Ctype( Self.pNativeValue, Integer )
		  Dim theDecimalMinutes As Double = Abs( Self.pNativeValue -  theDegrees ) * 60.0
		  Dim theMinutes As Integer = CType( theDecimalMinutes, Integer )
		  Dim theDecimalSeconds As Double = Abs( theDecimalMinutes - theMinutes ) * 60.0
		  
		  // Ask the subclass to handle the formatting
		  Dim theHemisphereLetter As String = Self.HemisphereLetter
		  
		  // Add the HemisphereLetter according to the global setting
		  If zdGPSKit.Geo.Coordinate.HemisphereLetterFirst then
		    
		    Self.pFormatCacheDMS = theHemisphereLetter + " " + RaiseEvent FormatDMS( theDegrees, theMinutes, theDecimalSeconds )
		    
		  Else
		    
		    Self.pFormatCacheDMS = RaiseEvent FormatDMS( theDegrees, theMinutes, theDecimalSeconds ) + " " + theHemisphereLetter
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRenderCacheHemisphereLetter()
		  
		  //-- Renders the hemisphere letter's cache
		  
		  // Ask the subclass for the hemiphere letter and store the result
		  Self.pCacheHemisphereLetter = RaiseEvent GuessHemisphereLetter( Self.pNativeValue )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub pRenderCacheWGS84()
		  
		  //-- Return the coordinate as a string in the WGS84 form ( dddmm.mmm )
		  
		  // Compute the data needed
		  Dim theAbsValue As Double = Abs( Self.pNativeValue )
		  Dim theDegrees As Integer = CType( theAbsValue, Integer )
		  Dim theDecimalMinutes As Double = ( theAbsValue - theDegrees ) * 60.0
		  
		  // Ask the subclass to format the data
		  Self.pFormatCacheWGS84 = RaiseEvent FormatWGS84( theDegrees, theDecimalMinutes )
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event FormatDD(inValue As Double) As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FormatDM(inDegrees As Integer, inMinutes As Double) As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FormatDMS(inDegrees As Integer, inMinutes As Integer, inSecondes As Double) As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FormatWGS84(inDegrees As Integer, inMinutes As Double) As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GuessHemisphereLetter(inValue As Double) As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GuessHemisphereSign(inHemisphere As String) As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ValidateData(inValue As Double) As Boolean
	#tag EndHook


	#tag Note, Name = Dev Notes
		
		-- Available formats:
		
		* DMS: H ddd° mm' ss.s"
		* DM: H ddd° mm.mmm'
		* DD: H ddd.ddddddd°
		* WGS84: dddmm.mmmmm
	#tag EndNote


	#tag Property, Flags = &h0
		Shared DefaultFormat As zdGPSKit.Geo.Coordinate.CoordinateFormat
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  //-- Return True if the Hemisphere letter is first in the coordinate format
			  
			  Return zdGPSKit.Geo.Coordinate.pHemisphereLetterFirst
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  //-- If 'value' is True then the Hemisphere's letter will be shown as a prefix
			  
			  // Are we really changing the value?
			  If value <> zdGPSKit.Geo.Coordinate.pHemisphereLetterFirst Then
			    
			    // Yes. Set the new value
			    zdGPSKit.Geo.Coordinate.pHemisphereLetterFirst = value
			    
			    // Clean all instances cache
			    zdGPSKit.Geo.Coordinate.CleanAllInstancesCache
			    
			  End If
			  
			End Set
		#tag EndSetter
		Shared HemisphereLetterFirst As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  //-- Returns the coordinate value
			  
			  Return Self.pNativeValue
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  //-- Set the native value
			  
			  // Store the value
			  Self.pNativeValue = value
			  
			  // Clear all the caches
			  Self.pCleanFormatCaches
			  
			End Set
		#tag EndSetter
		NativeValue As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		#tag Note
			Used to cache the HemisphereLetter
		#tag EndNote
		Private pCacheHemisphereLetter As String
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Used to cache the Decimal Degrees notation string
		#tag EndNote
		Private pFormatCacheDD As String
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Used to cache the Degrees Minutes notation string
		#tag EndNote
		Private pFormatCacheDM As String
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Used to cache the Degrees Minutes Seconds notation string
		#tag EndNote
		Private pFormatCacheDMS As String
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Used to cache the WGS84 notation ( w/o hemisphere )
		#tag EndNote
		Private pFormatCacheWGS84 As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared pHemisphereLetterFirst As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared pInstances() As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			This is the natuve value, in decimal degrees.
		#tag EndNote
		Private pNativeValue As Double
	#tag EndProperty


	#tag Constant, Name = kErrorInvalidCoordinate, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kErrorInvalidMinutes, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kErrorInvalidSeconds, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kErrorNegativeDegrees, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kErrorUnknownHemisphere, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMarkDegree, Type = String, Dynamic = False, Default = \"\xC2\xB0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMarkMinute, Type = String, Dynamic = False, Default = \"\'", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMarkSecond, Type = String, Dynamic = False, Default = \"\"", Scope = Public
	#tag EndConstant


	#tag Enum, Name = CoordinateFormat, Type = Integer, Flags = &h0
		DecimalDegrees
		  DegreesMinutes
		  DegreesMinutesSeconds
		WGS84
	#tag EndEnum


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
			Name="NativeValue"
			Group="Behavior"
			Type="Double"
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
