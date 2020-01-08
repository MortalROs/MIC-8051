<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class main
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()>
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(main))
        Me.Menu = New System.Windows.Forms.MenuStrip()
        Me.HomeToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SettingsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ExitToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ProiecteToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.LEDToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AfisareCu7SegmenteToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AfisareCuLCDToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AboutToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SerialPort = New System.IO.Ports.SerialPort(Me.components)
        Me.BoxMenu = New System.Windows.Forms.GroupBox()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.refresh = New System.Windows.Forms.Button()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.SerialBox = New System.Windows.Forms.ComboBox()
        Me.Box1 = New System.Windows.Forms.GroupBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.BNOP = New System.Windows.Forms.Button()
        Me.BALL = New System.Windows.Forms.Button()
        Me.BM = New System.Windows.Forms.Button()
        Me.BP = New System.Windows.Forms.Button()
        Me.BSTOP = New System.Windows.Forms.Button()
        Me.BSTART = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.EF4 = New System.Windows.Forms.Button()
        Me.EF3 = New System.Windows.Forms.Button()
        Me.EF2 = New System.Windows.Forms.Button()
        Me.EF1 = New System.Windows.Forms.Button()
        Me.Box2 = New System.Windows.Forms.GroupBox()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.CRESET = New System.Windows.Forms.Button()
        Me.CSTOP = New System.Windows.Forms.Button()
        Me.CSTART = New System.Windows.Forms.Button()
        Me.Box3 = New System.Windows.Forms.GroupBox()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.Label11 = New System.Windows.Forms.Label()
        Me.DM = New System.Windows.Forms.Button()
        Me.DP = New System.Windows.Forms.Button()
        Me.Label12 = New System.Windows.Forms.Label()
        Me.DDREAPTA = New System.Windows.Forms.Button()
        Me.DSTANGA = New System.Windows.Forms.Button()
        Me.DSTOP = New System.Windows.Forms.Button()
        Me.DSTART = New System.Windows.Forms.Button()
        Me.text_Port = New System.Windows.Forms.Label()
        Me.Box4 = New System.Windows.Forms.GroupBox()
        Me.about = New System.Windows.Forms.RichTextBox()
        Me.Label14 = New System.Windows.Forms.Label()
        Me.Menu.SuspendLayout()
        Me.BoxMenu.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Box1.SuspendLayout()
        Me.Box2.SuspendLayout()
        Me.Box3.SuspendLayout()
        Me.Box4.SuspendLayout()
        Me.SuspendLayout()
        '
        'Menu
        '
        Me.Menu.BackColor = System.Drawing.SystemColors.ControlLightLight
        Me.Menu.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.HomeToolStripMenuItem, Me.ProiecteToolStripMenuItem, Me.AboutToolStripMenuItem})
        Me.Menu.Location = New System.Drawing.Point(0, 0)
        Me.Menu.Name = "Menu"
        Me.Menu.Size = New System.Drawing.Size(324, 24)
        Me.Menu.TabIndex = 0
        Me.Menu.Text = "Menu"
        '
        'HomeToolStripMenuItem
        '
        Me.HomeToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.SettingsToolStripMenuItem, Me.ExitToolStripMenuItem})
        Me.HomeToolStripMenuItem.Font = New System.Drawing.Font("Segoe UI", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.HomeToolStripMenuItem.Name = "HomeToolStripMenuItem"
        Me.HomeToolStripMenuItem.Size = New System.Drawing.Size(54, 20)
        Me.HomeToolStripMenuItem.Text = "Meniu"
        '
        'SettingsToolStripMenuItem
        '
        Me.SettingsToolStripMenuItem.Name = "SettingsToolStripMenuItem"
        Me.SettingsToolStripMenuItem.Size = New System.Drawing.Size(108, 22)
        Me.SettingsToolStripMenuItem.Text = "Home"
        '
        'ExitToolStripMenuItem
        '
        Me.ExitToolStripMenuItem.Name = "ExitToolStripMenuItem"
        Me.ExitToolStripMenuItem.Size = New System.Drawing.Size(108, 22)
        Me.ExitToolStripMenuItem.Text = "Exit"
        '
        'ProiecteToolStripMenuItem
        '
        Me.ProiecteToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.LEDToolStripMenuItem, Me.AfisareCu7SegmenteToolStripMenuItem, Me.AfisareCuLCDToolStripMenuItem})
        Me.ProiecteToolStripMenuItem.Font = New System.Drawing.Font("Segoe UI", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ProiecteToolStripMenuItem.Name = "ProiecteToolStripMenuItem"
        Me.ProiecteToolStripMenuItem.Size = New System.Drawing.Size(66, 20)
        Me.ProiecteToolStripMenuItem.Text = "Proiecte"
        '
        'LEDToolStripMenuItem
        '
        Me.LEDToolStripMenuItem.Name = "LEDToolStripMenuItem"
        Me.LEDToolStripMenuItem.Size = New System.Drawing.Size(198, 22)
        Me.LEDToolStripMenuItem.Text = "Afisare cu LED-uri"
        '
        'AfisareCu7SegmenteToolStripMenuItem
        '
        Me.AfisareCu7SegmenteToolStripMenuItem.Name = "AfisareCu7SegmenteToolStripMenuItem"
        Me.AfisareCu7SegmenteToolStripMenuItem.Size = New System.Drawing.Size(198, 22)
        Me.AfisareCu7SegmenteToolStripMenuItem.Text = "Afisare cu 7 segmente"
        '
        'AfisareCuLCDToolStripMenuItem
        '
        Me.AfisareCuLCDToolStripMenuItem.Name = "AfisareCuLCDToolStripMenuItem"
        Me.AfisareCuLCDToolStripMenuItem.Size = New System.Drawing.Size(198, 22)
        Me.AfisareCuLCDToolStripMenuItem.Text = "Afisare cu LCD"
        '
        'AboutToolStripMenuItem
        '
        Me.AboutToolStripMenuItem.Font = New System.Drawing.Font("Segoe UI", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.AboutToolStripMenuItem.Name = "AboutToolStripMenuItem"
        Me.AboutToolStripMenuItem.Size = New System.Drawing.Size(59, 20)
        Me.AboutToolStripMenuItem.Text = "Despre"
        '
        'BoxMenu
        '
        Me.BoxMenu.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.BoxMenu.Controls.Add(Me.PictureBox1)
        Me.BoxMenu.Controls.Add(Me.Label6)
        Me.BoxMenu.Controls.Add(Me.refresh)
        Me.BoxMenu.Controls.Add(Me.Label9)
        Me.BoxMenu.Controls.Add(Me.Label7)
        Me.BoxMenu.Controls.Add(Me.SerialBox)
        Me.BoxMenu.ImeMode = System.Windows.Forms.ImeMode.NoControl
        Me.BoxMenu.Location = New System.Drawing.Point(13, 28)
        Me.BoxMenu.Name = "BoxMenu"
        Me.BoxMenu.Size = New System.Drawing.Size(300, 250)
        Me.BoxMenu.TabIndex = 1
        Me.BoxMenu.TabStop = False
        '
        'PictureBox1
        '
        Me.PictureBox1.BackgroundImage = Global.MPMC_Interface.My.Resources.Resources.logo
        Me.PictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.PictureBox1.Location = New System.Drawing.Point(6, 71)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(288, 136)
        Me.PictureBox1.TabIndex = 5
        Me.PictureBox1.TabStop = False
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label6.Location = New System.Drawing.Point(88, 48)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(119, 20)
        Me.Label6.TabIndex = 4
        Me.Label6.Text = "Proiect MPNC"
        '
        'refresh
        '
        Me.refresh.BackgroundImage = Global.MPMC_Interface.My.Resources.Resources.refresh_2_512
        Me.refresh.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.refresh.Font = New System.Drawing.Font("Microsoft Sans Serif", 36.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.refresh.Location = New System.Drawing.Point(264, 210)
        Me.refresh.Name = "refresh"
        Me.refresh.Size = New System.Drawing.Size(30, 30)
        Me.refresh.TabIndex = 3
        Me.refresh.UseVisualStyleBackColor = True
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label9.Location = New System.Drawing.Point(17, 218)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(114, 13)
        Me.Label9.TabIndex = 2
        Me.Label9.Text = "Alege portul COM: "
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label7.Location = New System.Drawing.Point(24, 20)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(247, 20)
        Me.Label7.TabIndex = 1
        Me.Label7.Text = "Interfata de Comanda pentru "
        '
        'SerialBox
        '
        Me.SerialBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.SerialBox.FormattingEnabled = True
        Me.SerialBox.Location = New System.Drawing.Point(137, 215)
        Me.SerialBox.Name = "SerialBox"
        Me.SerialBox.Size = New System.Drawing.Size(121, 21)
        Me.SerialBox.TabIndex = 0
        '
        'Box1
        '
        Me.Box1.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.Box1.Controls.Add(Me.Label4)
        Me.Box1.Controls.Add(Me.Label3)
        Me.Box1.Controls.Add(Me.Label2)
        Me.Box1.Controls.Add(Me.BNOP)
        Me.Box1.Controls.Add(Me.BALL)
        Me.Box1.Controls.Add(Me.BM)
        Me.Box1.Controls.Add(Me.BP)
        Me.Box1.Controls.Add(Me.BSTOP)
        Me.Box1.Controls.Add(Me.BSTART)
        Me.Box1.Controls.Add(Me.Label1)
        Me.Box1.Controls.Add(Me.EF4)
        Me.Box1.Controls.Add(Me.EF3)
        Me.Box1.Controls.Add(Me.EF2)
        Me.Box1.Controls.Add(Me.EF1)
        Me.Box1.ImeMode = System.Windows.Forms.ImeMode.NoControl
        Me.Box1.Location = New System.Drawing.Point(319, 28)
        Me.Box1.Name = "Box1"
        Me.Box1.Size = New System.Drawing.Size(300, 250)
        Me.Box1.TabIndex = 2
        Me.Box1.TabStop = False
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.Location = New System.Drawing.Point(76, 152)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(166, 13)
        Me.Label4.TabIndex = 13
        Me.Label4.Text = "Control pentru toate LED-uri"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.Location = New System.Drawing.Point(129, 194)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(47, 13)
        Me.Label3.TabIndex = 12
        Me.Label3.Text = "Control"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(129, 110)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(42, 13)
        Me.Label2.TabIndex = 11
        Me.Label2.Text = "Viteza"
        '
        'BNOP
        '
        Me.BNOP.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BNOP.Location = New System.Drawing.Point(166, 168)
        Me.BNOP.Name = "BNOP"
        Me.BNOP.Size = New System.Drawing.Size(75, 23)
        Me.BNOP.TabIndex = 10
        Me.BNOP.Text = "NONE"
        Me.BNOP.UseVisualStyleBackColor = True
        '
        'BALL
        '
        Me.BALL.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BALL.Location = New System.Drawing.Point(53, 168)
        Me.BALL.Name = "BALL"
        Me.BALL.Size = New System.Drawing.Size(75, 23)
        Me.BALL.TabIndex = 9
        Me.BALL.Text = "ALL"
        Me.BALL.UseVisualStyleBackColor = True
        '
        'BM
        '
        Me.BM.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BM.Location = New System.Drawing.Point(166, 126)
        Me.BM.Name = "BM"
        Me.BM.Size = New System.Drawing.Size(75, 23)
        Me.BM.TabIndex = 8
        Me.BM.Text = "-"
        Me.BM.UseVisualStyleBackColor = True
        '
        'BP
        '
        Me.BP.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BP.Location = New System.Drawing.Point(53, 126)
        Me.BP.Name = "BP"
        Me.BP.Size = New System.Drawing.Size(75, 23)
        Me.BP.TabIndex = 7
        Me.BP.Text = "+"
        Me.BP.UseVisualStyleBackColor = True
        '
        'BSTOP
        '
        Me.BSTOP.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BSTOP.Location = New System.Drawing.Point(166, 210)
        Me.BSTOP.Name = "BSTOP"
        Me.BSTOP.Size = New System.Drawing.Size(75, 23)
        Me.BSTOP.TabIndex = 6
        Me.BSTOP.Text = "STOP"
        Me.BSTOP.UseVisualStyleBackColor = True
        '
        'BSTART
        '
        Me.BSTART.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BSTART.Location = New System.Drawing.Point(53, 210)
        Me.BSTART.Name = "BSTART"
        Me.BSTART.Size = New System.Drawing.Size(75, 23)
        Me.BSTART.TabIndex = 5
        Me.BSTART.Text = "START"
        Me.BSTART.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(49, 20)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(192, 20)
        Me.Label1.TabIndex = 4
        Me.Label1.Text = "Efecte Matrice LED-uri"
        '
        'EF4
        '
        Me.EF4.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.EF4.Location = New System.Drawing.Point(166, 77)
        Me.EF4.Name = "EF4"
        Me.EF4.Size = New System.Drawing.Size(75, 23)
        Me.EF4.TabIndex = 3
        Me.EF4.Text = "EFECT 4"
        Me.EF4.UseVisualStyleBackColor = True
        '
        'EF3
        '
        Me.EF3.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.EF3.Location = New System.Drawing.Point(53, 77)
        Me.EF3.Name = "EF3"
        Me.EF3.Size = New System.Drawing.Size(75, 23)
        Me.EF3.TabIndex = 2
        Me.EF3.Text = "EFECT 3"
        Me.EF3.UseVisualStyleBackColor = True
        '
        'EF2
        '
        Me.EF2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.EF2.Location = New System.Drawing.Point(166, 48)
        Me.EF2.Name = "EF2"
        Me.EF2.Size = New System.Drawing.Size(75, 23)
        Me.EF2.TabIndex = 1
        Me.EF2.Text = "EFECT 2"
        Me.EF2.UseVisualStyleBackColor = True
        '
        'EF1
        '
        Me.EF1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.EF1.Location = New System.Drawing.Point(53, 48)
        Me.EF1.Name = "EF1"
        Me.EF1.Size = New System.Drawing.Size(75, 23)
        Me.EF1.TabIndex = 0
        Me.EF1.Text = "EFECT 1"
        Me.EF1.UseVisualStyleBackColor = True
        '
        'Box2
        '
        Me.Box2.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.Box2.Controls.Add(Me.Label8)
        Me.Box2.Controls.Add(Me.CRESET)
        Me.Box2.Controls.Add(Me.CSTOP)
        Me.Box2.Controls.Add(Me.CSTART)
        Me.Box2.ImeMode = System.Windows.Forms.ImeMode.NoControl
        Me.Box2.Location = New System.Drawing.Point(625, 28)
        Me.Box2.Name = "Box2"
        Me.Box2.Size = New System.Drawing.Size(300, 250)
        Me.Box2.TabIndex = 3
        Me.Box2.TabStop = False
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label8.Location = New System.Drawing.Point(95, 20)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(103, 20)
        Me.Label8.TabIndex = 4
        Me.Label8.Text = "Cronometru"
        '
        'CRESET
        '
        Me.CRESET.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.CRESET.Location = New System.Drawing.Point(71, 142)
        Me.CRESET.Name = "CRESET"
        Me.CRESET.Size = New System.Drawing.Size(156, 55)
        Me.CRESET.TabIndex = 2
        Me.CRESET.Text = "RESET"
        Me.CRESET.UseVisualStyleBackColor = True
        '
        'CSTOP
        '
        Me.CSTOP.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.CSTOP.Location = New System.Drawing.Point(152, 84)
        Me.CSTOP.Name = "CSTOP"
        Me.CSTOP.Size = New System.Drawing.Size(75, 52)
        Me.CSTOP.TabIndex = 1
        Me.CSTOP.Text = "STOP"
        Me.CSTOP.UseVisualStyleBackColor = True
        '
        'CSTART
        '
        Me.CSTART.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.CSTART.Location = New System.Drawing.Point(71, 84)
        Me.CSTART.Name = "CSTART"
        Me.CSTART.Size = New System.Drawing.Size(75, 52)
        Me.CSTART.TabIndex = 0
        Me.CSTART.Text = "START"
        Me.CSTART.UseVisualStyleBackColor = True
        '
        'Box3
        '
        Me.Box3.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.Box3.Controls.Add(Me.Label5)
        Me.Box3.Controls.Add(Me.Label11)
        Me.Box3.Controls.Add(Me.DM)
        Me.Box3.Controls.Add(Me.DP)
        Me.Box3.Controls.Add(Me.Label12)
        Me.Box3.Controls.Add(Me.DDREAPTA)
        Me.Box3.Controls.Add(Me.DSTANGA)
        Me.Box3.Controls.Add(Me.DSTOP)
        Me.Box3.Controls.Add(Me.DSTART)
        Me.Box3.ImeMode = System.Windows.Forms.ImeMode.NoControl
        Me.Box3.Location = New System.Drawing.Point(931, 28)
        Me.Box3.Name = "Box3"
        Me.Box3.Size = New System.Drawing.Size(300, 250)
        Me.Box3.TabIndex = 4
        Me.Box3.TabStop = False
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label5.Location = New System.Drawing.Point(129, 194)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(51, 13)
        Me.Label5.TabIndex = 12
        Me.Label5.Text = "Directie"
        '
        'Label11
        '
        Me.Label11.AutoSize = True
        Me.Label11.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label11.Location = New System.Drawing.Point(129, 126)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(42, 13)
        Me.Label11.TabIndex = 11
        Me.Label11.Text = "Viteza"
        '
        'DM
        '
        Me.DM.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DM.Location = New System.Drawing.Point(159, 142)
        Me.DM.Name = "DM"
        Me.DM.Size = New System.Drawing.Size(100, 23)
        Me.DM.TabIndex = 8
        Me.DM.Text = "-"
        Me.DM.UseVisualStyleBackColor = True
        '
        'DP
        '
        Me.DP.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DP.Location = New System.Drawing.Point(41, 142)
        Me.DP.Name = "DP"
        Me.DP.Size = New System.Drawing.Size(99, 23)
        Me.DP.TabIndex = 7
        Me.DP.Text = "+"
        Me.DP.UseVisualStyleBackColor = True
        '
        'Label12
        '
        Me.Label12.AutoSize = True
        Me.Label12.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label12.Location = New System.Drawing.Point(101, 20)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(96, 20)
        Me.Label12.TabIndex = 4
        Me.Label12.Text = "Afisor LCD"
        '
        'DDREAPTA
        '
        Me.DDREAPTA.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DDREAPTA.Location = New System.Drawing.Point(159, 210)
        Me.DDREAPTA.Name = "DDREAPTA"
        Me.DDREAPTA.Size = New System.Drawing.Size(100, 25)
        Me.DDREAPTA.TabIndex = 3
        Me.DDREAPTA.Text = ">>>"
        Me.DDREAPTA.UseVisualStyleBackColor = True
        '
        'DSTANGA
        '
        Me.DSTANGA.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DSTANGA.Location = New System.Drawing.Point(41, 210)
        Me.DSTANGA.Name = "DSTANGA"
        Me.DSTANGA.Size = New System.Drawing.Size(100, 25)
        Me.DSTANGA.TabIndex = 2
        Me.DSTANGA.Text = "<<<"
        Me.DSTANGA.UseVisualStyleBackColor = True
        '
        'DSTOP
        '
        Me.DSTOP.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DSTOP.Location = New System.Drawing.Point(159, 77)
        Me.DSTOP.Name = "DSTOP"
        Me.DSTOP.Size = New System.Drawing.Size(100, 23)
        Me.DSTOP.TabIndex = 1
        Me.DSTOP.Text = "STOP"
        Me.DSTOP.UseVisualStyleBackColor = True
        '
        'DSTART
        '
        Me.DSTART.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DSTART.Location = New System.Drawing.Point(41, 77)
        Me.DSTART.Name = "DSTART"
        Me.DSTART.Size = New System.Drawing.Size(99, 23)
        Me.DSTART.TabIndex = 0
        Me.DSTART.Text = "START"
        Me.DSTART.UseVisualStyleBackColor = True
        '
        'text_Port
        '
        Me.text_Port.AutoSize = True
        Me.text_Port.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.text_Port.Location = New System.Drawing.Point(161, 281)
        Me.text_Port.Name = "text_Port"
        Me.text_Port.Size = New System.Drawing.Size(58, 13)
        Me.text_Port.TabIndex = 5
        Me.text_Port.Text = "text_Port"
        '
        'Box4
        '
        Me.Box4.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.Box4.Controls.Add(Me.about)
        Me.Box4.Controls.Add(Me.Label14)
        Me.Box4.ImeMode = System.Windows.Forms.ImeMode.NoControl
        Me.Box4.Location = New System.Drawing.Point(13, 308)
        Me.Box4.Name = "Box4"
        Me.Box4.Size = New System.Drawing.Size(300, 250)
        Me.Box4.TabIndex = 6
        Me.Box4.TabStop = False
        '
        'about
        '
        Me.about.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.about.Location = New System.Drawing.Point(6, 54)
        Me.about.Name = "about"
        Me.about.ReadOnly = True
        Me.about.Size = New System.Drawing.Size(288, 190)
        Me.about.TabIndex = 5
        Me.about.Text = resources.GetString("about.Text")
        '
        'Label14
        '
        Me.Label14.AutoSize = True
        Me.Label14.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label14.Location = New System.Drawing.Point(101, 20)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(67, 20)
        Me.Label14.TabIndex = 4
        Me.Label14.Text = "Despre"
        '
        'main
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.SystemColors.ButtonFace
        Me.ClientSize = New System.Drawing.Size(324, 301)
        Me.Controls.Add(Me.Box4)
        Me.Controls.Add(Me.text_Port)
        Me.Controls.Add(Me.Box3)
        Me.Controls.Add(Me.Box2)
        Me.Controls.Add(Me.Box1)
        Me.Controls.Add(Me.BoxMenu)
        Me.Controls.Add(Me.Menu)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MainMenuStrip = Me.Menu
        Me.MaximizeBox = False
        Me.MaximumSize = New System.Drawing.Size(340, 340)
        Me.MinimizeBox = False
        Me.MinimumSize = New System.Drawing.Size(340, 340)
        Me.Name = "main"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "ManiaK`s Interface"
        Me.Menu.ResumeLayout(False)
        Me.Menu.PerformLayout()
        Me.BoxMenu.ResumeLayout(False)
        Me.BoxMenu.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Box1.ResumeLayout(False)
        Me.Box1.PerformLayout()
        Me.Box2.ResumeLayout(False)
        Me.Box2.PerformLayout()
        Me.Box3.ResumeLayout(False)
        Me.Box3.PerformLayout()
        Me.Box4.ResumeLayout(False)
        Me.Box4.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Menu As MenuStrip
    Friend WithEvents HomeToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents ProiecteToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents AboutToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents ExitToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents LEDToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents AfisareCu7SegmenteToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents AfisareCuLCDToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents SerialPort As IO.Ports.SerialPort
    Friend WithEvents BoxMenu As GroupBox
    Friend WithEvents Box1 As GroupBox
    Friend WithEvents Label3 As Label
    Friend WithEvents Label2 As Label
    Friend WithEvents BNOP As Button
    Friend WithEvents BALL As Button
    Friend WithEvents BM As Button
    Friend WithEvents BP As Button
    Friend WithEvents BSTOP As Button
    Friend WithEvents BSTART As Button
    Friend WithEvents Label1 As Label
    Friend WithEvents EF4 As Button
    Friend WithEvents EF3 As Button
    Friend WithEvents EF2 As Button
    Friend WithEvents EF1 As Button
    Friend WithEvents Label4 As Label
    Friend WithEvents SerialBox As ComboBox
    Friend WithEvents SettingsToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents Box2 As GroupBox
    Friend WithEvents Label8 As Label
    Friend WithEvents CRESET As Button
    Friend WithEvents CSTOP As Button
    Friend WithEvents CSTART As Button
    Friend WithEvents Box3 As GroupBox
    Friend WithEvents Label5 As Label
    Friend WithEvents Label11 As Label
    Friend WithEvents DM As Button
    Friend WithEvents DP As Button
    Friend WithEvents Label12 As Label
    Friend WithEvents DDREAPTA As Button
    Friend WithEvents DSTANGA As Button
    Friend WithEvents DSTOP As Button
    Friend WithEvents DSTART As Button
    Friend WithEvents text_Port As Label
    Friend WithEvents Label9 As Label
    Friend WithEvents Label7 As Label
    Friend WithEvents refresh As Button
    Friend WithEvents Label6 As Label
    Friend WithEvents PictureBox1 As PictureBox
    Friend WithEvents Box4 As GroupBox
    Friend WithEvents about As RichTextBox
    Friend WithEvents Label14 As Label
End Class
