#tag Class
 Attributes ( Encryption = True ) Protected Class SerialDataUT
Inherits Serial
Implements zdGPSKit.DataProvider
	#tag Event
		Sub DataAvailable()
		  
		  // Yes, Read & send them to the listeners
		  Dim theData As String = Me.ReadAll
		  Self.NotifyListeners( theData )
		  
		  System.DebugLog CurrentMethodName +":" + EndOfLine + theData
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error()
		  //-- An Error has occurred
		  
		  Me.pIsConnected = False
		  Me.NotifyErrorToListeners Me.LastErrorCode
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Close()
		  
		  Super.Close
		  Me.pIsConnected = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLastErrorCode() As Integer
		  //-- Returns the last error code
		  
		  Return Me.LastErrorCode
		End Function
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
		  //-- Open the Serial Socket
		  // Returns True if it succeeds, False otherwise
		  
		  // Attempt to open the serial socket
		  Dim theResult As Boolean = Super.Open
		  
		  If theResult Then
		    // The socket is open
		    Me.pIsConnected = True
		    
		    // We're done
		    Return True
		    
		  Else
		    // The socket failed to open
		    Me.pIsConnected = False
		    
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
		    Me.pDataListeners.Append New WeakRef( inListener )
		    
		  Else
		    
		    // Yes. Not a showstopper, but we log this error to the console
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


	#tag Property, Flags = &h21
		Private pDataListeners() As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pIsConnected As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Baud"
			Group="Behavior"
			Type="Integer"
			EditorType="Enum"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bits"
			Group="Behavior"
			Type="Integer"
			EditorType="Enum"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CTS"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DTR"
			Visible=true
			Group="Behavior"
			Type="Boolean"
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
			EditorType="Enum"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Stop"
			Group="Behavior"
			Type="Integer"
			EditorType="Enum"
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
		#tag ViewProperty
			Name="XON"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
