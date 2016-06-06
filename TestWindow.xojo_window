#tag Window
Begin Window TestWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   560
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1104577747
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "GPSKit Demo"
   Visible         =   True
   Width           =   570
   Begin GroupBox ConstellationBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Satellite Constellation"
      Enabled         =   True
      Height          =   357
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   327
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   183
      Underline       =   False
      Visible         =   True
      Width           =   222
      Begin zdGPSConstellationDisplay ConstellationCanvas
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   False
         Height          =   200
         HelpTag         =   "This is the position in the sky of the satellites your GPS device is currently viewing "
         Index           =   -2147483648
         InitialParent   =   "ConstellationBox"
         Left            =   338
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   210
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   200
      End
      Begin GroupBox FixInfosBox
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Fix Informations"
         Enabled         =   True
         Height          =   113
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ConstellationBox"
         Italic          =   False
         Left            =   338
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   413
         Underline       =   False
         Visible         =   True
         Width           =   200
         Begin zdDataStaticText InfosFix
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   78
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "FixInfosBox"
            Italic          =   False
            Left            =   349
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   ""
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   439
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   178
         End
      End
   End
   Begin GroupBox GPSFixBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Fix Data"
      Enabled         =   True
      Height          =   357
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
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
      Top             =   183
      Underline       =   False
      Visible         =   True
      Width           =   295
      Begin GroupBox FixLocationBox
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Location"
         Enabled         =   True
         Height          =   136
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GPSFixBox"
         Italic          =   False
         Left            =   38
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   244
         Underline       =   False
         Visible         =   True
         Width           =   260
         Begin Label Labels
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   1
            InitialParent   =   "FixLocationBox"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   "Latitude"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   278
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   78
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
            InitialParent   =   "FixLocationBox"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   "Longitude"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   310
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   78
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
            InitialParent   =   "FixLocationBox"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   "Altitude"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   342
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   78
         End
         Begin zdDataTextField LatitudeField
            AcceptTabs      =   False
            Alignment       =   3
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &cFFFFFF00
            Bold            =   False
            Border          =   True
            CueText         =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "FixLocationBox"
            Italic          =   False
            Left            =   140
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Mask            =   ""
            Password        =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   276
            Underline       =   False
            UseFocusRing    =   False
            Visible         =   True
            Width           =   141
         End
         Begin zdDataTextField LongitudeField
            AcceptTabs      =   False
            Alignment       =   3
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &cFFFFFF00
            Bold            =   False
            Border          =   True
            CueText         =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "FixLocationBox"
            Italic          =   False
            Left            =   140
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Mask            =   ""
            Password        =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   308
            Underline       =   False
            UseFocusRing    =   False
            Visible         =   True
            Width           =   141
         End
         Begin zdDataTextField AltitudeField
            AcceptTabs      =   False
            Alignment       =   3
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &cFFFFFF00
            Bold            =   False
            Border          =   True
            CueText         =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "FixLocationBox"
            Italic          =   False
            Left            =   140
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Mask            =   ""
            Password        =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   340
            Underline       =   False
            UseFocusRing    =   False
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
            Index           =   4
            InitialParent   =   "FixLocationBox"
            Italic          =   False
            Left            =   231
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   6
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   "Meters"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   342
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   49
         End
      End
      Begin zdDataTextField DateTimeField
         AcceptTabs      =   False
         Alignment       =   3
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GPSFixBox"
         Italic          =   False
         Left            =   137
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   210
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   141
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
         InitialParent   =   "GPSFixBox"
         Italic          =   False
         Left            =   47
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Date && Time"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   210
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   78
      End
      Begin GroupBox FixMotionBox
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Motion"
         Enabled         =   True
         Height          =   136
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GPSFixBox"
         Italic          =   False
         Left            =   38
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   390
         Underline       =   False
         Visible         =   True
         Width           =   260
         Begin Label Labels
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   5
            InitialParent   =   "FixMotionBox"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   "Ground Velocity"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   424
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   96
         End
         Begin Label Labels
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   6
            InitialParent   =   "FixMotionBox"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   "Vertical Velocity"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   456
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   96
         End
         Begin Label Labels
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   7
            InitialParent   =   "FixMotionBox"
            Italic          =   False
            Left            =   50
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   "Course"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   488
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   96
         End
         Begin zdDataTextField GroundVelocityField
            AcceptTabs      =   False
            Alignment       =   3
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &cFFFFFF00
            Bold            =   False
            Border          =   True
            CueText         =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "FixMotionBox"
            Italic          =   False
            Left            =   158
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Mask            =   ""
            Password        =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   422
            Underline       =   False
            UseFocusRing    =   False
            Visible         =   True
            Width           =   80
         End
         Begin zdDataTextField VerticalVelocityField
            AcceptTabs      =   False
            Alignment       =   3
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &cFFFFFF00
            Bold            =   False
            Border          =   True
            CueText         =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "FixMotionBox"
            Italic          =   False
            Left            =   158
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Mask            =   ""
            Password        =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   454
            Underline       =   False
            UseFocusRing    =   False
            Visible         =   True
            Width           =   80
         End
         Begin zdDataTextField CourseField
            AcceptTabs      =   False
            Alignment       =   3
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &cFFFFFF00
            Bold            =   False
            Border          =   True
            CueText         =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "FixMotionBox"
            Italic          =   False
            Left            =   158
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Mask            =   ""
            Password        =   False
            ReadOnly        =   True
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   ""
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   486
            Underline       =   False
            UseFocusRing    =   False
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
            Index           =   8
            InitialParent   =   "FixMotionBox"
            Italic          =   False
            Left            =   243
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   6
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   "Km/h"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   424
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   42
         End
         Begin Label Labels
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   9
            InitialParent   =   "FixMotionBox"
            Italic          =   False
            Left            =   243
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
            TabStop         =   True
            Text            =   "m/s"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   455
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   42
         End
         Begin Label Labels
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   10
            InitialParent   =   "FixMotionBox"
            Italic          =   False
            Left            =   243
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
            TabStop         =   True
            Text            =   "°"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "SmallSystem"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   488
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   42
         End
      End
   End
   Begin GroupBox SerialSetupBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Setup"
      Enabled         =   True
      Height          =   157
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Underline       =   False
      Visible         =   True
      Width           =   529
      Begin PopupMenu SerialPortSelector
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "Select the serial port your GPS device is connected to"
         Index           =   -2147483648
         InitialParent   =   "SerialSetupBox"
         InitialValue    =   ""
         Italic          =   False
         Left            =   115
         ListIndex       =   -1
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   43
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   11
         InitialParent   =   "SerialSetupBox"
         Italic          =   False
         Left            =   33
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Serial Port"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   43
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   70
      End
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   12
         InitialParent   =   "SerialSetupBox"
         Italic          =   False
         Left            =   327
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Protocol"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   43
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   60
      End
      Begin PopupMenu ProtocolSelector
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "SerialSetupBox"
         InitialValue    =   ""
         Italic          =   False
         Left            =   399
         ListIndex       =   -1
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   43
         Underline       =   False
         Visible         =   True
         Width           =   139
      End
      Begin PushButton ConnectButton
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Connect"
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "SerialSetupBox"
         Italic          =   False
         Left            =   458
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   101
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin Label SerialComInfos
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "SerialSetupBox"
         Italic          =   False
         Left            =   33
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Not connected"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   101
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   404
      End
      Begin PopupMenu FormatSelector
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "Select the serial port your GPS device is connected to"
         Index           =   -2147483648
         InitialParent   =   "SerialSetupBox"
         InitialValue    =   "Decimal Degrees\rDegrees Minutes\rDegrees Minutes Seconds\rWGS84"
         Italic          =   False
         Left            =   137
         ListIndex       =   1
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   141
         Underline       =   False
         Visible         =   True
         Width           =   168
      End
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   13
         InitialParent   =   "SerialSetupBox"
         Italic          =   False
         Left            =   33
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
         TabStop         =   True
         Text            =   "Default format"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   141
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   95
      End
      Begin CheckBox HemispherePosition
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Hemisphere First"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "SerialSetupBox"
         Italic          =   False
         Left            =   327
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   140
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   211
      End
      Begin Separator Separator1
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   2
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "SerialSetupBox"
         Left            =   33
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   130
         Visible         =   True
         Width           =   505
      End
      Begin CheckBox UseUnthreadedDataProvider
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Use unthreaded data provider if available"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "SerialSetupBox"
         Italic          =   False
         Left            =   33
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   75
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   413
      End
      Begin PushButton SettingsButton
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Settings…"
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "SerialSetupBox"
         Italic          =   False
         Left            =   458
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "SmallSystem"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   75
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
   End
   Begin Label BuildInfos
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
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
      TabStop         =   True
      Text            =   "Build Infos"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   540
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   530
   End
   Begin Timer ConstellationRefresher
      Enabled         =   True
      Height          =   "32"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   422
      LockedInPosition=   False
      Mode            =   2
      Period          =   400
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   247
      Visible         =   True
      Width           =   "32"
   End
   Begin Timer FixUpdater
      Enabled         =   True
      Height          =   "32"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   24
      LockedInPosition=   False
      Mode            =   2
      Period          =   400
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   175
      Visible         =   True
      Width           =   "32"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub ProcessGPGSA(inGPGSA As zdGPSKit.NMEA.GPGSA)
		  
		  //-- Process the fix mode and DOP Information
		  
		  If Not ( inGPGSA Is Nil ) Then
		    
		    Dim theLines() As String
		    Dim theData As Variant
		    
		    // Decode the fix mode selection
		    theLines.Append "Fix mode selection: "
		    theData = inGPGSA.FixTypeSelection
		    
		    If Not theData.IsNull Then
		      
		      Select Case theData
		        
		      Case zdGPSKit.NMEA.GPGSA.kFixTypeSelectionAutomatic
		        theLines.Append "Automatic"
		        
		      Case zdGPSKit.NMEA.GPGSA.kFixTypeSelectionManual
		        theLines.Append "Manual"
		        
		      Else
		        theLines.Append "Unknown"
		        
		      End Select
		      
		    Else
		      theLines.Append "-- No data --"
		      
		    End If
		    
		    theLines.Append EndOfLine
		    
		    // Decode the fix mode
		    theLines.Append "Fix Mode: "
		    theData = inGPGSA.FixType
		    
		    If Not theData.Isnull Then
		      
		      Select Case theData
		        
		      Case zdGPSKit.NMEA.GPGSA.kFixType2D
		        theLines.Append "2D"
		        
		      Case zdGPSKit.NMEA.GPGSA.kFixType3D
		        theLines.Append "3D"
		        
		      Case zdGPSKit.NMEA.GPGSA.kFixTypeNoFix
		        theLines.Append "Fix not available"
		        
		      Else
		        theLines.Append "Fix mode unknown"
		        
		      End Select
		      
		    Else
		      
		      theLines.Append "-- No data --"
		      
		    End If
		    
		    theLines.Append EndOfLine
		    
		    // then the DOP Data
		    theLines.Append "HDOP: "
		    theData = inGPGSA.HDOP
		    
		    If theData.IsNull Then
		      theLines.Append "-- No data --"
		      
		    Else
		      theLines.Append theData
		      
		    End If
		    
		    theLines.Append EndOfLine
		    
		    theLines.Append "VDOP: "
		    theData = inGPGSA.VDOP
		    
		    If theData.IsNull Then
		      theLines.Append "-- No data --"
		      
		    Else
		      theLines.Append theData
		      
		    End If
		    
		    theLines.Append EndOfLine
		    
		    theLines.Append "PDOP: "
		    theData = inGPGSA.PDOP
		    
		    If theData.IsNull Then
		      theLines.Append "-- No data --"
		      
		    Else
		      theLines.Append theData
		      
		    End If
		    
		    // Put the result to display
		    Self.InfosFix.Text = Join( theLines, "" )
		    
		  Else
		    Self.InfosFix.Text = "No fix data available"
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDataObsolete(inValue As Boolean)
		  
		  //-- Set all the 'obsoletable' controls as obsolete
		  
		  For i As Integer = Self.ControlCount - 1 DownTo 0
		    
		    // Retrieve the i-th control reference
		    Dim theControl As Control = Self.Control( i )
		    
		    // Set as obsolete if it's obsoletable
		    If theControl IsA zdObsoletable Then zdObsoletable( theControl).DataIsObsolete( inValue )
		    
		  Next i
		  
		  // Store the current state
		  Self.pObsolete = inValue
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private pDeviceConnection As zdGPSKit.EasyDeviceConnection
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pObsolete As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pSerialBaud As Integer = Serial.Baud4800
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pSerialBits As Integer = Serial.Bits8
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pSerialParity As Integer = Serial.ParityNone
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pSerialStopBits As Integer = Serial.StopBits1
	#tag EndProperty


#tag EndWindowCode

#tag Events FixInfosBox
	#tag Event
		Sub Open()
		  
		  #If TargetWin32 Then
		    
		    // Working around <feedback://showreport?report_id=4946>
		    Me.Parent = Nil
		    
		  #EndIf
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FixLocationBox
	#tag Event
		Sub Open()
		  
		  #If TargetWin32 Then
		    
		    // Working around <feedback://showreport?report_id=4946>
		    Me.Parent = Nil
		    
		  #EndIf
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FixMotionBox
	#tag Event
		Sub Open()
		  
		  #If TargetWin32 Then
		    
		    // Working around <feedback://showreport?report_id=4946>
		    Me.Parent = Nil
		    
		  #EndIf
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SerialPortSelector
	#tag Event
		Sub Open()
		  
		  // Populate the Menu
		  
		  Dim theLastIndex As integer = System.SerialPortCount - 1
		  
		  For i As Integer = 0 to theLastIndex
		    
		    Me.AddRow System.SerialPort( i ).Name
		    
		  Next
		  
		  If Me.ListCount > 0 then
		    
		    Me.ListIndex = 0
		    Self.ConnectButton.Enabled = True
		    
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  
		  Self.SettingsButton.Enabled = ( Me.ListIndex > -1 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProtocolSelector
	#tag Event
		Sub Open()
		  //-- Setup the protocol selector with the supported protocol
		  
		  
		  Me.AddRows Array( "NMEA","Text Output" )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ConnectButton
	#tag Event
		Sub Action()
		  
		  If Me.Caption = "Connect" Then
		    
		    // Get the serial port
		    Dim theSerialPort As SerialPort = System.SerialPort( Self.SerialPortSelector.ListIndex )
		    
		    // Try to open the connection
		    Dim theConnection As New zdGPSKit.EasyDeviceConnection
		    theConnection.UseUnthreadedDataProvider = Self.UseUnthreadedDataProvider.Value
		    
		    If Self.ProtocolSelector.ListIndex = 0 Then
		      theConnection.BuildNMEAConnection( theSerialPort, Self.pSerialBaud, Self.pSerialBits, Self.pSerialParity, Self.pSerialStopBits )
		      
		    ElseIf Self.ProtocolSelector.ListIndex = 1 Then
		      theConnection.BuildTextOutConnection( theSerialPort )
		      
		    End If
		    
		    // Try to open the connection
		    If theConnection.Open then
		      
		      // Connection was successfull
		      Me.Caption = "Disconnect"
		      Self.SerialComInfos.Text = "Connected"
		      Self.SerialPortSelector.Enabled = False
		      Self.ProtocolSelector.Enabled = False
		      Self.UseUnthreadedDataProvider.Enabled = False
		      Self.pDeviceConnection = theConnection
		      Self.SettingsButton.Enabled = False
		      
		    Else
		      
		      Self.SerialComInfos.Text = "Failed to connect"
		      
		    End If
		    
		  Else
		    
		    Self.pDeviceConnection.Close
		    
		    Me.Caption = "Connect"
		    Self.SerialComInfos.Text = "Connection closed"
		    Self.SerialPortSelector.Enabled = True
		    Self.ProtocolSelector.Enabled = True
		    Self.UseUnthreadedDataProvider.Enabled = True
		    Self.SettingsButton.Enabled = True
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FormatSelector
	#tag Event
		Sub Change()
		  
		  //-- A new display format has been selected for the longitude & latitude display
		  
		  // Set the zdGeodetic coordinate accordingly
		  Select Case Me.ListIndex
		    
		  Case 0
		    zdGPSKit.Geo.Coordinate.DefaultFormat = zdGPSKit.Geo.Coordinate.CoordinateFormat.DecimalDegrees
		    
		  Case 1
		    zdGPSKit.Geo.Coordinate.DefaultFormat = zdGPSKit.Geo.Coordinate.CoordinateFormat.DegreesMinutes
		    
		  Case 2
		    zdGPSKit.Geo.Coordinate.DefaultFormat = zdGPSKit.Geo.Coordinate.CoordinateFormat.DegreesMinutesSeconds
		    
		  Case 3
		    zdGPSKit.Geo.Coordinate.DefaultFormat = zdGPSKit.Geo.Coordinate.CoordinateFormat.WGS84
		    
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HemispherePosition
	#tag Event
		Sub Action()
		  
		  zdGPSKit.Geo.Coordinate.HemisphereLetterFirst = Me.Value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SettingsButton
	#tag Event
		Sub Action()
		  
		  // Create and initialize a new serial setting window
		  Dim w As New SerialSetupWindow( Self.pSerialBaud, Self.pSerialParity, Self.pSerialBits, Self.pSerialStopBits )
		  
		  // Show the setting window
		  w.ShowModalWithin( Self )
		  
		  If Not w.UserHitCancel Then
		    Self.pSerialBaud = w.BaudMenu.RowTag( w.BaudMenu.ListIndex ).IntegerValue
		    Self.pSerialParity = w.ParityMenu.RowTag( w.ParityMenu.ListIndex ).IntegerValue
		    Self.pSerialBits = w.BitsMenu.RowTag( w.BitsMenu.ListIndex ).IntegerValue
		    Self.pSerialStopBits = w.StopBitsMenu.RowTag( w.StopBitsMenu.ListIndex ).IntegerValue
		  End If
		  
		  w.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BuildInfos
	#tag Event
		Sub Open()
		  //-- Fillup the build infos field
		  
		  Me.Text = "GPS Kit for Xojo® demo - v" + Str( App.MajorVersion ) + "." + Str( App.MinorVersion ) _
		  + " Build #" + Str( App.NonReleaseVersion ) + " © Eric de La Rochette 2012-2015"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ConstellationRefresher
	#tag Event
		Sub Action()
		  
		  //-- Refresh the GPS satelittes constellation display
		  
		  // Part of the 'Do we have new data?' mechanism
		  Static theLastGPGSV1 As zdGPSKit.NMEA.GPGSV
		  
		  // We'll use this has a flag
		  Dim ConstellationIsDirty As Boolean
		  
		  // If there is no connection, we can bail out
		  If Self.pDeviceConnection Is Nil Then Return
		  
		  // Cache a reference to the parser
		  Dim theParser As zdGPSKit.NMEA.Parser = Self.pDeviceConnection.NMEAParser
		  
		  // If there is no dispatcher
		  If theParser Is Nil Then
		    
		    'If Not Self.pObsolete Then Self.SetDataObsolete( True )
		    Return
		    
		  End If
		  
		  If theParser.HasSentence( "GPGSV1" ) Then
		    
		    Dim theGPGSV() As zdGPSKit.NMEA.GPGSV
		    
		    theGPGSV.Append zdGPSKit.NMEA.GPGSV( theParser.GetSentence( "GPGSV1" ) )
		    
		    // Get the number of GPGSV message from the first GPGSV message
		    Dim theCount As Integer = theGPGSV( 0 ).MessageCount
		    
		    // Retrieve all the GPGSV messages
		    For i As Integer = 2 To theCount
		      
		      Dim theCmdName As String = "GPGSV" + Str( i )
		      
		      If theParser.HasSentence( theCmdName ) Then
		        
		        theGPGSV.Append zdGPSKit.NMEA.GPGSV( theParser.GetSentence( theCmdName ) )
		        
		      End If
		      
		    Next
		    
		    // Do we have a complete set?
		    If theGPGSV.Ubound = theCount - 1 Then
		      
		      For i As Integer = 0 To theGPGSV.Ubound
		        
		        Self.ConstellationCanvas.ProcessGPGSVCommand( theGPGSV( i ) )
		        
		      Next
		      
		      ConstellationIsDirty = True
		      theLastGPGSV1 = theGPGSV( 0 )
		      
		      // Do we have the mode, used satellites & DOP informations?
		      If theParser.HasSentence( "GPGSA" ) Then
		        
		        Dim theGPGSA As zdGPSKit.NMEA.GPGSA = zdGPSKit.NMEA.GPGSA( theParser.GetSentence( "GPGSA" ) )
		        
		        Self.ConstellationCanvas.ProcessGPGSACommand( theGPGSA )
		        Self.ProcessGPGSA theGPGSA
		        
		      End If
		      
		      If ConstellationIsDirty Then Self.ConstellationCanvas.RefreshConstellation
		      
		    End If
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FixUpdater
	#tag Event
		Sub Action()
		  
		  //-- For for a new GPS fix and handle the obsolete data case.
		  
		  // We need this to store a reference to the last GPS fix retrieved
		  Static theLastGPSFix As zdGPSKit.Fix
		  
		  // If there is no connection we can return
		  If Self.pDeviceConnection Is Nil Then Return
		  
		  // Cache a reference to the fix provider
		  Dim theProvider As zdGPSKit.FixProvider = Self.pDeviceConnection.GPSFixProvider
		  
		  // Defensive coding...
		  If Not ( theProvider Is Nil ) Then
		    
		    // Cache a reference to the latest fix provided by the parser
		    Dim theGPSFix As zdGPSKit.Fix = theProvider.GetLatestGPSFix
		    
		    // If it's Nil, there is nothig more we can do
		    If theGPSFix Is Nil Then Return
		    
		    // Check if it's a new instance of zdGPSKit.Fix. i.e. Do we have a new fix?
		    If theLastGPSFix = theGPSFix Then
		      
		      // --- No new data to handle ---
		      
		      // Could we considere that these old data are now obsolete ( older than 10 secs )?
		      If theLastGPSFix.Age > 10.0 And Not Self.pObsolete Then
		        
		        // Yes, set them as obsolete
		        Self.SetDataObsolete( True )
		        
		      End If
		      
		      // We are done here
		      Return
		      
		    End If
		    
		    // --- We have new data ---
		    
		    // Adjust the obsolete status if needed
		    If Self.pObsolete Then Self.SetDataObsolete( False )
		    
		    // Cache a reference to the fix's location data
		    Dim theLocation As zdGPSKit.Geo.EarthLocation = theGPSFix.EarthLocation
		    
		    // If a GPS device is sending data but hasn't obtain a first fix yet,
		    // then some of the zdGPSKit.Fix's properties might be Nil.
		    // So we have to handle this case when displaying the data
		    
		    // --- Update the location related fields ---
		    
		    If theLocation.Latitude Is Nil  Then
		      Self.LatitudeField.Text = zdGPSKit.kSymbolNotAvailable
		    Else
		      Self.LatitudeField.Text = theLocation.Latitude.FormatDefault
		    End If
		    
		    If  theLocation.Longitude Is Nil Then
		      Self.LongitudeField.Text = zdGPSKit.kSymbolNotAvailable
		    Else
		      Self.LongitudeField.Text = theLocation.Longitude.FormatDefault
		    End If
		    
		    If theLocation.Altitude.IsNumeric Then
		      Self.AltitudeField.text = Format( theLocation.Altitude, "###,##0.0;-###,##0.0" )
		    Else
		      Self.AltitudeField.Text = zdGPSKit.kSymbolNotAvailable
		    End If
		    
		    // --- Update the motion related fields ---
		    
		    If theGPSFix.EarthMotion.GroundSpeedKmh Is Nil Then
		      Self.GroundVelocityField.Text = zdGPSKit.kSymbolNotAvailable
		    Else
		      Self.GroundVelocityField.Text = Format( theGPSFix.EarthMotion.GroundSpeedKmh, "#,##0.0" )
		    End If
		    
		    If theGPSFix.EarthMotion.VerticalSpeedMeterSec Is Nil Then
		      Self.VerticalVelocityField.Text = zdGPSKit.kSymbolNotAvailable
		    Else
		      Self.VerticalVelocityField.Text = Format( theGPSFix.EarthMotion.VerticalSpeedMeterSec, "+#,##0.0;-#,##0.0;0.0" )
		    End If
		    
		    If theGPSFix.EarthMotion.Course Is Nil Then
		      Self.CourseField.Text = zdGPSKit.kSymbolNotAvailable
		    Else
		      Self.CourseField.text = Format( theGPSFix.EarthMotion.Course, "##0" )
		    End If
		    
		    // Update the date field
		    Self.DateTimeField.Text = theGPSFix.GPSTime
		    
		    // Cache the reference of this new fix for the next call.
		    theLastGPSFix = theGPSFix
		    
		  End If
		  
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
		Visible=true
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
		Visible=true
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
		Visible=true
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
		InitialValue="False"
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
		Visible=true
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
