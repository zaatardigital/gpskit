#tag Class
 Attributes ( Encryption = True ) Protected Class SerialData
Inherits Thread
Implements zdGPSKit.DataProvider
	#tag Event
		Sub Run()
		  //-- Watch if new data are available and send them to the listeners
		  
		  // Let's start with a nap
		  Self.Sleep( 500 )
		  
		  // Here we go with the watching loop
		  Do
		    
		    Dim theSerial As Serial = Self.pSerialSocket
		    
		    // Check if there still is an active socket
		    If theSerial Is Nil Then
		      
		      // There no longer is a serial socket to watch for
		      Exit
		      
		      // We have a connected serial socket. We check for errors
		    ElseIf theSerial.LastErrorCode <> Serial.NoError Then
		      
		      // There was an error, store the code and exit the watching loop
		      Self.pLastErrorCode = theSerial.LastErrorCode
		      Exit
		      
		      // No errors. Do we have some new data?
		    Elseif theSerial.BytesAvailable > 0 Then
		      
		      // Yes, Read & send them to the listeners
		      Dim theData As String = theSerial.ReadAll
		      Self.NotifyListeners( theData )
		      
		      // The following line can't be in the final release
		      // System.DebugLog " ################ " + CurrentMethodName + ": " + Str( Microseconds / 1000000 ) + " - New Data: " + theData
		      
		    End If
		    
		    // Let's go to sleep for a while
		    Self.Sleep( 200 )
		    
		  Loop Until False // The out condition
		  
		  // Jettison the Serial socket
		  Self.pSerialSocket = Nil
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Close()
		  //-- Close the serial connection
		  
		  // Close & jettison the serial socket if necessary
		  If Not ( Self.pSerialSocket Is Nil ) Then
		    Self.pSerialSocket.Close
		    Self.pSerialSocket = Nil
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLastErrorCode() As Integer
		  //-- Part of the zdGPSKit.DataListener interface.
		  // Returns the last error code
		  
		  Return Me.pLastErrorCode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleSerialError(inSerial As Serial)
		  //-- Handles the serial data error
		  
		  // Retrieve the error code
		  Dim theErrorCode As Integer = inSerial.LastErrorCode
		  
		  // Notify the listeners about the error
		  
		  Break
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IndexOfListener(inListener As zdGPSKit.DataListener) As Integer
		  //-- Retrieve the index of the passed listener
		  // Return -1 if no match is found
		  
		  For i As Integer = Self.pDataListeners.Ubound DownTo 0
		    // If we have a match, then return the index
		    If Self.pDataListeners( i ).Value = inListener Then Return i
		    
		  Next
		  
		  // No match Found
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsConnected() As Boolean
		  //-- Returns True if the serial socket is connected
		  
		  Return Me.pIsConnected
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NotifyErrorToListeners(inErrorCode As Integer)
		  //-- Send each registered listener an error notification
		  
		  For i As Integer = Self.pDataListeners.Ubound DownTo 0
		    
		    // Send the Data to the i-th listener
		    If Self.pDataListeners( i ) Is Nil Or Self.pDataListeners( i ).Value Is Nil Then
		      
		      // Oops! This one is dead, we remove it
		      Self.pDataListeners.Remove i
		      
		    Else
		      
		      // Notify the listener
		      zdGPSKit.DataListener( Self.pDataListeners( i ).Value ).DataFlowError inErrorCode
		      
		    End If
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NotifyListeners(inNewData As String)
		  //-- Send each registered listener the new data
		  
		  For i As Integer = Self.pDataListeners.Ubound DownTo 0
		    
		    // Send the Data to the i-th listener
		    If Self.pDataListeners( i ) Is Nil Or Self.pDataListeners( i ).Value Is Nil Then
		      // Oops! This one is dead, we remove it
		      Self.pDataListeners.Remove i
		      
		    Else
		      // Notify the listener
		      zdGPSKit.DataListener( Self.pDataListeners( i ).Value ).NewData( inNewData )
		      
		    End If
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open() As Boolean
		  //-- Initialize the serial socket and open connection
		  
		  // Create a new SerialSocket
		  Dim theSerial As New Serial
		  
		  // Adjust the serial settings
		  theSerial.SerialPort = Self.SerialPort
		  theSerial.Baud = Self.Baud
		  theSerial.Bits = Self.Bits
		  theSerial.Parity = Self.Parity
		  theSerial.Stop = Self.Stop
		  
		  // Attempt to open the serial socket
		  Dim theResult As Boolean = theSerial.Open
		  
		  If theResult Then
		    // The socket is open
		    Self.pSerialSocket = theSerial
		    Self.pIsConnected = True
		    Self.pLastErrorCode = Serial.NoError
		    
		    // Set the error handler
		    AddHandler theSerial.Error, AddressOf Me.HandleSerialError
		    
		    // Start the data watching
		    Self.Run
		    
		    // We're done
		    Return True
		    
		  Else
		    // The socket failed to open
		    Self.pIsConnected = False
		    Self.pLastErrorCode = theSerial.LastErrorCode
		    
		    // We're done
		    Return False
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterListener(inListener As zdGPSKit.DataListener)
		  //-- Append the listener to the listener list. If the listener is already registered, then log a debugging message.
		  // Raise a NilObjectException if inListener Is Nil
		  // Part of the zdGPSKit.DataProvider interface.
		  
		  // Parameter validation
		  If inListener Is Nil Then
		    // Prepare and raise a NilObjectException
		    Dim theException As New NilObjectException
		    theException.Message = CurrentMethodName + ": Can't register a Nil object ( i.e. inListener was Nil ). "
		    Raise theException
		    
		  End If
		  
		  // Is inListener already registered?
		  Dim theIndex As Integer = Self.IndexOfListener( inListener )
		  
		  If theIndex < 0 Then
		    // No, we can append it
		    Self.pDataListeners.Append New WeakRef( inListener )
		    
		  Else
		    // Yes. Not a showstopper, but we log this event to the console
		    System.DebugLog CurrentMethodName + ": inListener is already registered."
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveListener(inListener As zdGPSKit.DataListener)
		  //-- Remove the passed listener as parameter from the listener list
		  // Raise a NilObjectException if inListener is Nil
		  // Part of the zdGPSKit.DataProvider interface.
		  
		  // Parameter validation
		  If inListener Is Nil Then
		    
		    // Prepare and raise a NilObjectException
		    Raise New zdGPSKit.GPSKitException( -1, CurrentMethodName + ": Can't remove a Nil object ( i.e. inListener was Nil )." )
		    
		  End If
		  
		  // Look for a matching element in the registered listener array
		  Dim theIndex As Integer = Self.IndexOfListener( inListener )
		  
		  // Do we have a match?
		  If theIndex > -1 Then
		    
		    // Yes, we can remove it
		    Self.pDataListeners.Remove( theIndex )
		    
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Baud As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Bits As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Parity As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pDataListeners() As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h0
		pIsConnected As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pLastErrorCode As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pSerialSocket As Serial
	#tag EndProperty

	#tag Property, Flags = &h0
		SerialPort As SerialPort
	#tag EndProperty

	#tag Property, Flags = &h0
		Stop As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Baud"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bits"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
			Name="Parity"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="pIsConnected"
			Group="Behavior"
			Type="Boolean"
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
			Name="Stop"
			Group="Behavior"
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
