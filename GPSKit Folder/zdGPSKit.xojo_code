#tag Module
Protected Module zdGPSKit
	#tag Method, Flags = &h1
		Protected Function IsIntegerNumber(inValue As Double) As Boolean
		  Return inValue.Equals( inValue.Truncate(), 0 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsIntegerNumber(Extends extValue As Double) As Boolean
		  Return extValue.Equals( extValue.Truncate )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Truncate(inValue As Double) As Double
		  If inValue >= 0.0 Then
		    Return Floor( invalue )
		    
		  Else
		    Return Ceil( inValue )
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Truncate(Extends extValue As Double) As Double
		  //-- Returns the Integer part of a Double, as a Double
		  
		  If extValue >= 0.0 Then
		    Return Floor( extValue )
		    
		  Else
		    Return Ceil( extValue )
		    
		  End If
		End Function
	#tag EndMethod


	#tag Constant, Name = kRatioFeetMinToMeterSec, Type = Double, Dynamic = False, Default = \"0.00508", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRatioFootToMeters, Type = Double, Dynamic = False, Default = \"0.3048", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRatioKmhToKnots, Type = Double, Dynamic = False, Default = \"0.5399568", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRatioKmhToMph, Type = Double, Dynamic = False, Default = \"0.2137119", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRatioKnotsToKmh, Type = Double, Dynamic = False, Default = \"1.852", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRatioKnotsToMph, Type = Double, Dynamic = False, Default = \"1.1507794", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRatioMeterSecToFeetMin, Type = Double, Dynamic = False, Default = \"196.85039", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRatioMeterSecToKmh, Type = Double, Dynamic = False, Default = \"3.6", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRatioMeterToFeet, Type = Double, Dynamic = False, Default = \"3.2808399", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRatioMphToKmh, Type = Double, Dynamic = False, Default = \"1.609344", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRatioMphToKnots, Type = Double, Dynamic = False, Default = \"0.86897624", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRatioNauticalToKm, Type = Double, Dynamic = False, Default = \"1.852", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRatioNauticalToMiles, Type = Double, Dynamic = False, Default = \"1.1507794", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kRatioRadToDeg, Type = Double, Dynamic = False, Default = \"57.2957795131", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kSymbolNotAvailable, Type = String, Dynamic = False, Default = \"n/a", Scope = Protected
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
End Module
#tag EndModule
