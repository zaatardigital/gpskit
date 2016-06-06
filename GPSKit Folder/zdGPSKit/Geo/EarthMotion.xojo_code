#tag Class
 Attributes ( Encryption = True ) Protected Class EarthMotion
	#tag Property, Flags = &h0
		Course As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		GroundSpeedKmh As Variant
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  //-- Return the ground speed in Knots
			  
			  If Self.GroundSpeedKmh.IsNumeric Then
			    
			    Return Self.GroundSpeedKmh * zdGPSKit.kRatioKmhToKnots
			    
			  Else
			    
			    Return Nil
			    
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  //-- Convert the Knots to Km/H and store the value
			  
			  If value.IsNumeric Then
			    
			    Self.GroundSpeedKmh = Value * zdGPSKit.kRatioKnotsToKmh
			    
			  Else
			    
			    Self.GroundSpeedKmh = Nil
			    
			  End If
			  
			End Set
		#tag EndSetter
		GroundSpeedKnots As Variant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  //-- Return the ground speed in Knots
			  
			  If Self.GroundSpeedKmh.IsNumeric Then
			    
			    Return Self.GroundSpeedKmh * zdGPSKit.kRatioKmhToMph
			    
			  Else
			    
			    Return Nil
			    
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  //-- Convert the Knots to Km/H and store the value
			  
			  If value.IsNumeric Then
			    
			    Self.GroundSpeedKmh = Value * zdGPSKit.kRatioMphToKmh
			    
			  Else
			    
			    Self.GroundSpeedKmh = Nil
			    
			  End If
			  
			End Set
		#tag EndSetter
		GroundSpeedMph As Variant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  //-- Returns the vertical speed as feet per Minute
			  
			  If Self.VerticalSpeedMeterSec.IsNumeric Then
			    
			    Return Self.VerticalSpeedMeterSec * zdGPSKit.kRatioMeterSecToFeetMin
			    
			  Else
			    
			    Return Nil
			    
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  //-- Convert the Feet/min to meters and store the value as Meters/Sec
			  
			  If value.IsNumeric then
			    
			    Self.VerticalSpeedMeterSec = value * zdGPSKit.kRatioFeetMinToMeterSec
			    
			  Else
			    
			    Self.VerticalSpeedMeterSec = Nil
			    
			  End If
			  
			End Set
		#tag EndSetter
		VerticalSpeedFeetMinute As Variant
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		VerticalSpeedMeterSec As Variant
	#tag EndProperty


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
