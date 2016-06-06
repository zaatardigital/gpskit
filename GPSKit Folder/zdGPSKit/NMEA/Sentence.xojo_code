#tag Class
 Attributes ( Encryption = True ) Protected Class Sentence
	#tag Method, Flags = &h0
		Function Age() As Double
		  
		  //-- Return the time elapsed since the creation of this command in seconds.
		  
		  Return  ( Microseconds - Self.pBirthTime ) / 1000000.0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ComputeChecksum(inStringToCheck As MemoryBlock) As Integer
		  //-- Compute the NMEA compatible checksum
		  // Assumes that the string's encoding is ASCII.
		  // The type casting to a MemoryBlock is automagically made when passing the parameter as a string.
		  
		  // Note:
		  // =====
		  // - The NMEA checkhsum is the representation of two hexadecimal characters of an XOR
		  //   of all characters in the sentence between – but not including – the $ and the * character.
		  // - CType is used to avoid conversion types warnings when anlyzing the project.
		  
		  // Generic optimizations
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  // Getting the last offset value
		  Dim theUpperOffset As Integer = inStringToCheck.Size - 1
		  
		  // This will be use to return the result
		  Dim theResult As UInt64
		  
		  // Calculate the checksum.
		  For i As Integer = 0 To theUpperOffset
		    
		    theResult = Bitwise.BitXor( theResult, Ctype( inStringToCheck.Byte( i ), UInt64 ) )
		    
		  Next
		  
		  Return CType( theResult, Integer )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(inNMEADataChunk As String)
		  //-- Having this constructor protected, prevent the use of the default constructor outside the class
		  
		  // To be thread safe
		  #pragma DisableBackgroundTasks
		  
		  // Other optimizations
		  #pragma DisableBoundsChecking
		  
		  Self.pBirthTime = Microseconds
		  
		  // Split the data chunk in an array of fields and store it in a property
		  Self.pDataFields = inNMEADataChunk.SplitB( zdGPSKit.NMEA.Sentence.kCmdFieldMark )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As String
		  
		  // To be thread safe
		  #pragma DisableBackgroundTasks
		  
		  // Other optimizations
		  #pragma DisableBoundsChecking
		  
		  If Self.pDataFields.Ubound > -1 Then
		    
		    // Return the first field of data
		    Return Self.pDataFields( 0 )
		    
		  Else
		    
		    // Currently, there is no data
		    Return ""
		    
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NewSentence(inSentence As String) As zdGPSKit.NMEA.Sentence
		  
		  //-- Returns a new zdGPSKit.NMEA.Sentence instance based on the passed NMEA sentence
		  // It assumes the string is ASCII encoded. If the Sentence is invalid, returns Nil
		  
		  // Generic optimizations
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  // Get the string length
		  Dim theLength As Integer = inSentence.LenB
		  
		  // Each NMEA sentence must start with a '$'
		  If inSentence.LeftB( 1 ) <> zdGPSKit.NMEA.Sentence.kCmdPrefix  Then
		    
		    // Not a NMEA sentence
		    Return Nil
		    
		  End If
		  
		  Dim theData As String
		  
		  // Is there a checksum?
		  If inSentence.Mid( theLength - 2, 1 ) = zdGPSKit.NMEA.Sentence.kCmdChecksumMark Then
		    
		    // --- We have a checksum ---
		    
		    // Extracting the data part of the string
		    theData = inSentence.MidB( 2, theLength - 4 )
		    
		    If Not zdGPSKit.NMEA.Sentence.IgnoreChecksum Then
		      
		      // Calculate both embedded and data checksums and compare the results
		      If Not Val( "&h" + inSentence.RightB( 2 ) ).Equals( Ctype( zdGPSKit.NMEA.Sentence.ComputeChecksum(  theData ), Double ), 0 ) Then
		        
		        // There is an error in the data
		        Return Nil
		        
		      End If
		      
		    End If
		    
		  Else
		    
		    // --- No checkum for this sentence ---
		    
		    // Just Extract the data part
		    theData = inSentence.RightB( theLength - 1 )
		    
		  End If
		  
		  // If we get here, either the checksum test succeed, or it has been ignored.
		  Dim theResult As zdGPSKit.NMEA.Sentence = zdGPSKit.NMEA.Sentence.SmartCommandCreator( theData )
		  
		  // Something could still go wrong
		  If theResult Is Nil Or theResult.ParameterCount > 0 Then
		    
		    // Hopefully, not.
		    Return theResult
		    
		  Else
		    
		    // Something did go wrong
		    Return Nil
		    
		  End If
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NMEASentence() As String
		  
		  //-- Returns a well formed NMEA compliant sentence
		  // If there is no data, then returns an empty string
		  
		  // Generic optimizations
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  // Is there any data?
		  If Self.pDataFields.Ubound < 0 Then
		    
		    // There is no data
		    Return ""
		    
		  End If
		  
		  // Recreate the data part of the sentence as an ASCII String
		  Dim theDataChunk As String = Join( Self.pDataFields, zdGPSKit.NMEA.Sentence.kCmdFieldMark ).ConvertEncoding( Encodings.ASCII )
		  
		  // Compute the checksum
		  Dim theChecksum As String = Hex( zdGPSKit.NMEA.Sentence.ComputeChecksum( theDataChunk ) ).ConvertEncoding( Encodings.ASCII ).RightB( 2 )
		  
		  Dim theResult AS String = zdGPSKit.NMEA.Sentence.kCmdPrefix.ConvertEncoding( Encodings.ASCII ) + theDataChunk _
		  + zdGPSKit.NMEA.Sentence.kCmdChecksumMark.ConvertEncoding( Encodings.ASCII ) + theChecksum
		  
		  Return theResult
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parameter(inIndex As Integer) As String
		  
		  //-- Return the parameter value for inIndex ( one-based )
		  // The command name ( 0th array's element ) isn't considered as a parameter
		  
		  // Optimizations
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  If inIndex < 1 Then
		    
		    // This is out of bounds, Create, dosucument and raise an GPSKitException
		    Raise New zdGPSKit.GPSKitException( -1, CurrentMethodName + ": inIndex must be >= 1. It was " + Str( inIndex ) )
		    
		  ElseIf inIndex > Self.pDataFields.Ubound Then
		    
		    Return ""
		    
		  Else
		    
		    // Retrieve & return the value for this parameter
		    Return Self.pDataFields( inIndex )
		    
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParameterCount() As Integer
		  
		  //-- The number of parameter available
		  // The command name ( 0th array's element ) isn't considered as a parameter
		  
		  Return Self.pDataFields.Ubound
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub RegisterPostSmartSentenceCreatorHook(inHook As zdGPSKit.NMEA.Sentence.SentenceCreatorHook)
		  //-- Register a new hook for the PostSmartCommandCreator call
		  // Register a Nil value to disable the call
		  
		  zdGPSKit.NMEA.Sentence.pPostSmartSentenceCreatorHook = inHook
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub RegisterPreSmartSentenceCreatorHook(inHook As zdGPSKit.NMEA.Sentence.SentenceCreatorHook)
		  //-- Register a new hook for the PreSmartCommandCreator call
		  // Register a Nil value to disable the call
		  
		  zdGPSKit.NMEA.Sentence.pPreSmartSentenceCreatorHook = inHook
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Function SentenceCreatorHook(inDataString As String) As zdGPSKit.NMEA.Sentence
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Shared Function SmartCommandCreator(inDataString As String) As zdGPSKit.NMEA.Sentence
		  //-- Create and return the appropriate zdGPSKit.NMEA.Sentence sub type given the command name inDataString
		  
		  // Generic optimizations
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  // Call the pre hook if one has been registered
		  
		  If Not ( zdGPSKit.NMEA.Sentence.pPreSmartSentenceCreatorHook Is Nil ) Then
		    
		    Dim theResult As zdGPSKit.NMEA.Sentence = zdGPSKit.NMEA.Sentence.pPreSmartSentenceCreatorHook.Invoke( inDataString )
		    If Not ( theResult Is Nil ) Then Return theResult
		    
		  End If
		  
		  // Get to the "smart" part
		  
		  Select Case NthFieldB( InDataString, zdGPSKit.NMEA.Sentence.kCmdFieldMark, 1 )
		    
		    // Handle the General purpose commands
		    
		  Case "GPRMC"
		    Return New zdGPSKit.NMEA.GPRMC( inDataString )
		    
		  Case "GPGGA"
		    Return New zdGPSKit.NMEA.GPGGA( inDataString )
		    
		  Case "GPGLL"
		    Return New zdGPSKit.NMEA.GPGLL( inDataString )
		    
		  Case "GPVTG"
		    Return New zdGPSKit.NMEA.GPVTG( InDataString )
		    
		  Case "GPGSA"
		    Return New zdGPSKit.NMEA.GPGSA( inDataString )
		    
		  Case "GPGSV"
		    Return New zdGPSKit.NMEA.GPGSV( inDataString )
		    
		  Case "GPZDA"
		    Return New zdGPSKit.NMEA.GPZDA( inDataString )
		    
		  Case "GPBOD"
		    Return New zdGPSKit.NMEA.GPBOD( inDataString )
		    
		    // Handle the Garmin proprietary sentences
		    
		  Case "PGRME"
		    Return New zdGPSKit.NMEA.PGRME( inDataString )
		    
		  Case "PGRMF"
		    Return New zdGPSKit.NMEA.PGRMF( inDataString )
		    
		  Case "PGRMZ"
		    Return New zdGPSKit.NMEA.PGRMZ( inDataString )
		    
		    // Handle the Magellan proprietary sentences
		    
		  Case "PMGNST"
		    Return New zdGPSKit.NMEA.PMGNST( inDataString )
		    
		  Else
		    
		    // Call the post hook if one has been registered
		    
		    If Not ( zdGPSKit.NMEA.Sentence.pPostSmartSentenceCreatorHook Is Nil ) Then
		      
		      Dim theResult As zdGPSKit.NMEA.Sentence = zdGPSKit.NMEA.Sentence.pPostSmartSentenceCreatorHook.Invoke( inDataString )
		      If Not ( theResult Is Nil ) Then Return theResult
		      
		    End If
		    
		    // At this point, the only option left is to return a simple NMEA sentence instance
		    Return New zdGPSKit.NMEA.Sentence( inDataString )
		    
		  End Select
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Shared IgnoreChecksum As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pBirthTime As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pDataFields() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared pPostSmartSentenceCreatorHook As zdGPSKit.NMEA.Sentence.SentenceCreatorHook
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared pPreSmartSentenceCreatorHook As zdGPSKit.NMEA.Sentence.SentenceCreatorHook
	#tag EndProperty


	#tag Constant, Name = kCmdChecksumMark, Type = String, Dynamic = False, Default = \"*", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCmdFieldMark, Type = String, Dynamic = False, Default = \"\x2C", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCmdPrefix, Type = String, Dynamic = False, Default = \"$", Scope = Private
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
