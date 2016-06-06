#tag Class
 Attributes ( Encryption = True ) Protected Class EasyDeviceConnection
	#tag Method, Flags = &h0
		Sub BuildNMEAConnection(inSerialPort As SerialPort)
		  //-- Build a NMEA serial connection with the NMEA Standard parameters.
		  
		  Me.BuildNMEAConnection( inSerialPort, Serial.Baud4800, Serial.Bits8, Serial.ParityNone, Serial.StopBits1 )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BuildNMEAConnection(inSerialPort As SerialPort, inBaud As Integer, inBits As Integer, inParity As Integer, inStopBits As Integer)
		  //-- Build a serial connection with the GPS Device.
		  // It creates the GPS data provider and the GPS data listener and register the listener to the provider
		  
		  // --- Pre conditions ---
		  
		  If inSerialPort Is Nil Then
		    
		    // Prepare and raise an informative exception
		    Raise New zdGPSKit.GPSKitException( -1, CurrentMethodName + ": the SerialPort can' be Nil" )
		    
		  End If
		  
		  // Create and setup a NMEA 0183 serial socket ( the data provider )
		  
		  If Not Me.UseUnthreadedDataProvider Then
		    
		    Dim theProvider As New zdGPSKit.DataProviders.SerialData
		    
		    // Set the serial parameter
		    theProvider.SerialPort = inSerialPort
		    theProvider.Baud = inBaud
		    theProvider.Bits = inBits
		    theProvider.Parity = inParity
		    theProvider.Stop = inStopBits
		    
		    // Setup the connection
		    Me.SetupConnection( theProvider, New zdGPSKit.NMEA.Parser )
		    
		  Else
		    
		    Dim theProviderUT As New zdGPSKit.DataProviders.SerialDataUT
		    
		    // Set the serial parameter
		    theProviderUT.SerialPort = inSerialPort
		    theProviderUT.Baud = inBaud
		    theProviderUT.Bits = inBits
		    theProviderUT.Parity = inParity
		    theProviderUT.Stop = inStopBits
		    
		    // Setup the connection
		    Me.SetupConnection( theProviderUT, New zdGPSKit.NMEA.Parser )
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BuildTextOutConnection(inSerialPort As SerialPort)
		  //-- Build a serial connection with the GPS Device.
		  // It creates the GPS data provider and the GPS data listener and register the listener to the provider
		  
		  // --- Validating the parameters ---
		  
		  Me.BuildTextOutConnection( inSerialPort, Serial.Baud9600, Serial.Bits8, Serial.ParityNone, Serial.StopBits1 )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BuildTextOutConnection(inSerialPort As SerialPort, inBaud As Integer, inBits As Integer, inParity As Integer, inStopBits As Integer)
		  //-- Build a serial connection with the GPS Device.
		  // It creates the GPS data provider and the GPS data listener and register the listener to the provider
		  
		  // --- Validating the parameters ---
		  
		  If inSerialPort Is Nil Then
		    
		    // Prepare and raise an informative NilObjectException
		    Raise New zdGPSKit.GPSKitException( -1, CurrentMethodName + ": the SerialPort can' be Nil" )
		    
		  End If
		  
		  // ---  Build a Text serial ---<
		  
		  If Not Me.UseUnthreadedDataProvider Then
		    
		    // Create and setup the serial socket
		    Dim theProvider As New zdGPSKit.DataProviders.SerialData
		    
		    // Set the parameters
		    theProvider.SerialPort = inSerialPort
		    theProvider.Baud = inBaud
		    theProvider.Bits = inBits
		    theProvider.Parity = inParity
		    theProvider.Stop = inStopBits
		    
		    // Setup the connection
		    Me.SetupConnection( theProvider, New zdGPSKit.TextOut.Parser )
		    
		  Else
		    
		    // Create and setup the serial socket in its unthreaded version
		    Dim theProviderUT As New zdGPSKit.DataProviders.SerialDataUT
		    
		    // Set the parameters
		    theProviderUT.SerialPort = inSerialPort
		    theProviderUT.Baud = inBaud
		    theProviderUT.Bits = inBits
		    theProviderUT.Parity = inParity
		    theProviderUT.Stop = inStopBits
		    
		    // Setup the connection
		    Me.SetupConnection( theProviderUT, New zdGPSKit.TextOut.Parser )
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  //-- Close the current GPS device connection
		  
		  Dim theProvider As zdGPSKit.DataProvider = Self.pDataProvider
		  
		  If theProvider Is Nil Then
		    
		    // There is nothing to close
		    Return
		    
		  End If
		  
		  // Close the Connection
		  theProvider.Close
		  
		  // Get track of the last error code
		  Self.pLastErrorCode = theProvider.GetLastErrorCode
		  Self.pIsConnected = False
		  
		  RaiseEvent Closed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  //-- This instance is being destroyed
		  // Let's make some cleaning
		  
		  // Close the connection if needed
		  If Self.pIsConnected Then Self.Close
		  
		  // Disconnect the listener
		  Self.pDataProvider.RemoveListener Self.pDataListener
		  
		  // Jettison the data provider and listener
		  Self.pDataProvider = Nil
		  Self.pDataListener = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GPSDataProvider() As zdGPSKit.DataProvider
		  //-- Return a reference to the data provider attached to this instance
		  
		  Return Self.pDataProvider
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GPSFixProvider() As zdGPSKit.FixProvider
		  //-- Return the current fix provider if available
		  
		  Return zdGPSKit.FixProvider( Self.pDataListener )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleError(inErrorCode As Integer)
		  //-- Handle a flow error condition
		  
		  // Set some values
		  Self.pLastErrorCode = inErrorCode
		  Self.pIsConnected = False
		  
		  // Pass on the error condition
		  RaiseEvent Error
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsConnected() As Boolean
		  //-- Return True if the device is currently connected
		  
		  Return Self.pIsConnected
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastErrorCode() As Integer
		  //-- Returns the last error code
		  
		  Return Self.LastErrorCode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NMEAParser() As zdGPSKit.NMEA.Parser
		  //-- Return a reference to the current zdGPSKit.NMEA.Parser.
		  // If none is available, then return Nil.
		  
		  // Do we really have one?
		  If Self.pDataListener IsA zdGPSKit.NMEA.Parser Then
		    
		    // Typecast it and return the reference
		    Return zdGPSKit.NMEA.Parser( Self.pDataListener )
		    
		  Else
		    
		    // There is no zdGPSKit.NMEA.Parser available
		    Return Nil
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open() As Boolean
		  //-- Open the previously created connection
		  
		  // Cache a reference to the provider
		  Dim theProvider As zdGPSKit.DataProvider = Self.pDataProvider
		  
		  // Pre conditions testing
		  If theProvider Is Nil Then
		    
		    // Prepare an informative exception
		    Raise New zdGPSKit.GPSKitException( -1, CurrentMethodName + ": There is no data provider to open." )
		    
		  End If
		  
		  // Attempt to connect the provider
		  If theProvider.Open Then
		    
		    // The connection was successfull
		    Self.pLastErrorCode = zdGPSKit.EasyDeviceConnection.kErrorNone
		    Self.pIsConnected = True
		    Return True
		    
		  Else
		    
		    Self.pLastErrorCode = theProvider.GetLastErrorCode
		    Return False
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetupConnection(inProvider As zdGPSKit.DataProvider, inListener As zdGPSKit.DataListener)
		  //-- Build a serial connection with the GPS Device.
		  // It creates the GPS data provider and the GPS data listener and register the listener to the provider
		  
		  // --- Validating the parameters ---
		  
		  If inProvider Is Nil Then
		    
		    // Prepare and raise an informative NilObjectException
		    Raise New zdGPSKit.GPSKitException( -1, CurrentMethodName + ": inProvider can't be Nil" )
		    
		  End If
		  
		  If inListener Is Nil Then
		    
		    // Prepare and raise an informative NilObjectException
		    Raise New zdGPSKit.GPSKitException( -1, CurrentMethodName + ": inListener can't be Nil" )
		    
		  End If
		  
		  // Register the listener to the provider
		  inProvider.RegisterListener( inListener )
		  
		  // Store the references for further use
		  Self.pDataProvider = inProvider
		  Self.pDataListener = inListener
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextOutputParser() As zdGPSKit.TextOut.Parser
		  //-- Return a reference to the current text output parser.
		  // If none is available, then return Nil.
		  
		  // Do we really have one?
		  If Self.pDataListener IsA zdGPSKit.TextOut.Parser Then
		    
		    // Typecast it and return the reference
		    Return zdGPSKit.TextOut.Parser( Self.pDataListener )
		    
		  Else
		    
		    // There is no text output parser available
		    Return Nil
		    
		  End If
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Closed()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Error()
	#tag EndHook


	#tag Property, Flags = &h21
		Attributes( Hidden ) Private pDataListener As zdGPSKit.DataListener
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( Hidden ) Private pDataProvider As zdGPSKit.DataProvider
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( Hidden ) Private pIsConnected As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( Hidden ) Private pLastErrorCode As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( Hidden ) Private pValidInstance As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			
			Change this property value before calling BuilSerialConnection
			Set this propoerty as 'True' if you want to use the unthreaded version of the serial data Provider ( when available ).
		#tag EndNote
		UseUnthreadedDataProvider As Boolean
	#tag EndProperty


	#tag Constant, Name = kErrorNone, Type = Double, Dynamic = False, Default = \"0", Scope = Public
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
		#tag ViewProperty
			Name="UseUnthreadedDataProvider"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
