#tag Window
Begin Window SerialSetupWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   False
   Compatibility   =   ""
   Composite       =   False
   Frame           =   8
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   140
   ImplicitInstance=   False
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Serial Setup"
   Visible         =   True
   Width           =   538
   Begin PopupMenu BaudMenu
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   170
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   13
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PopupMenu ParityMenu
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   170
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PopupMenu StopBitsMenu
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   468
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Underline       =   False
      Visible         =   True
      Width           =   50
   End
   Begin PopupMenu BitsMenu
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   468
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   13
      Underline       =   False
      Visible         =   True
      Width           =   50
   End
   Begin Separator ButtonSeparator
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   4
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   84
      Visible         =   True
      Width           =   498
   End
   Begin PushButton BtnOK
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   438
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   100
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton BtnCancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   332
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   100
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label Labels
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   "Serial Speed"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   138
   End
   Begin Label Labels
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      Text            =   "Parity"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   53
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   138
   End
   Begin Label Labels
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   332
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      Text            =   "Bits"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   124
   End
   Begin Label Labels
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   332
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      Text            =   "Stop Bits"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   53
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   124
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(inBaudTag As Integer, inParityTag As Integer, inBitsTag As Integer, inStopBitsTag As Integer)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  Self.SetMenuByRowTag( Self.BaudMenu, inBaudTag )
		  Self.SetMenuByRowTag( Self.ParityMenu, inParityTag )
		  Self.SetMenuByRowTag( Self.BitsMenu, inBitsTag )
		  Self.SetMenuByRowTag( Self.StopBitsMenu, inStopBitsTag )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMenuByRowTag(inMenu As PopupMenu, inRowTagValue As Integer)
		  //-- Sets the PopupMenu given its tag value.
		  
		  For i As Integer = 0 To inMenu.ListCount - 1
		    
		    If inMenu.RowTag( i ).IntegerValue = inRowTagValue Then
		      inMenu.ListIndex = i
		      Return
		      
		    End If
		    
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		UserHitCancel As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events BaudMenu
	#tag Event
		Sub Open()
		  // Build the menu
		  Me.AddRow "300 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud300
		  Me.AddRow "600 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud600
		  Me.AddRow "1200 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud1200
		  Me.AddRow "1800 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud1800
		  Me.AddRow "2400 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud2400
		  Me.AddRow "3600 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud3600
		  Me.AddRow "4800 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud4800
		  Me.AddRow "7200 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud7200
		  Me.AddRow "9600 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud9600
		  Me.AddRow "14400 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud14400
		  Me.AddRow "19200 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud19200
		  Me.AddRow "28800 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud28800
		  Me.AddRow "38400 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud38400
		  Me.AddRow "57600 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud57600
		  Me.AddRow "115200 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud115200
		  Me.AddRow "230400 bauds"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Baud230400
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ParityMenu
	#tag Event
		Sub Open()
		  // Build the menu
		  Me.AddRow "None"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.ParityNone
		  Me.AddRow "Odd"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.ParityOdd
		  Me.AddRow "Even"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.ParityEven
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopBitsMenu
	#tag Event
		Sub Open()
		  // Build the menu
		  Me.AddRow "1"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.StopBits1
		  Me.AddRow "1.5"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.StopBits15
		  Me.AddRow "2"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.StopBits2
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BitsMenu
	#tag Event
		Sub Open()
		  // Build the menu
		  Me.AddRow "5"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Bits5
		  Me.AddRow "6"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Bits6
		  Me.AddRow "7"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Bits7
		  Me.AddRow "8"
		  Me.Rowtag( Me.ListCount  - 1 ) = Serial.Bits8
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BtnOK
	#tag Event
		Sub Action()
		  //-- The user clicked OK
		  
		  Self.UserHitCancel = False
		  Self.Hide
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BtnCancel
	#tag Event
		Sub Action()
		  //-- The user clicked 'Cancel'
		  
		  Self.UserHitCancel = True
		  Self.Hide
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"10 - Drawer Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
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
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UserHitCancel"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
