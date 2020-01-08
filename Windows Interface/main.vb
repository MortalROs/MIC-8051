Imports System.IO.Ports

Public Class main

    Private Sub main_Load(sender As Object, e As EventArgs) Handles MyBase.Load

        ListaPorturi = IO.Ports.SerialPort.GetPortNames
        SerialBox.Items.AddRange(ListaPorturi)
        PortText = "COM"

        BoxMenu.Visible = True
        Box1.Parent = Me
        Box1.Location = BoxMenu.Location
        Box1.Visible = False
        Box2.Parent = Me
        Box2.Location = BoxMenu.Location
        Box2.Visible = False
        Box3.Parent = Me
        Box3.Location = BoxMenu.Location
        Box3.Visible = False
        Box4.Parent = Me
        Box4.Location = BoxMenu.Location
        Box4.Visible = False

        text_Port.Text = "Nu sunt conectat la Port!"

    End Sub

    Private Sub SerialBox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles SerialBox.SelectedIndexChanged

        PortText = SerialBox.Text
        Port = New SerialPort(PortText, 4800, Parity.None, 8, StopBits.One)
        text_Port.Text = "Conectat la Portul: " + PortText

    End Sub

    Private Sub EF1_Click(sender As Object, e As EventArgs) Handles EF1.Click

        Try
            Port.Open()
            Port.WriteLine("1")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub EF2_Click(sender As Object, e As EventArgs) Handles EF2.Click

        Try
            Port.Open()
            Port.WriteLine("2")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub EF3_Click(sender As Object, e As EventArgs) Handles EF3.Click

        Try
            Port.Open()
            Port.WriteLine("3")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub EF4_Click(sender As Object, e As EventArgs) Handles EF4.Click

        Try
            Port.Open()
            Port.WriteLine("4")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub BP_Click(sender As Object, e As EventArgs) Handles BP.Click

        Try
            Port.Open()
            Port.WriteLine("F")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub BM_Click(sender As Object, e As EventArgs) Handles BM.Click

        Try
            Port.Open()
            Port.WriteLine("S")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub BALL_Click(sender As Object, e As EventArgs) Handles BALL.Click

        Try
            Port.Open()
            Port.WriteLine("X")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub BNOP_Click(sender As Object, e As EventArgs) Handles BNOP.Click

        Try
            Port.Open()
            Port.WriteLine("Y")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub BSTART_Click(sender As Object, e As EventArgs) Handles BSTART.Click

        Try
            Port.Open()
            Port.WriteLine("T")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub BSTOP_Click(sender As Object, e As EventArgs) Handles BSTOP.Click

        Try
            Port.Open()
            Port.WriteLine("P")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub CSTART_Click(sender As Object, e As EventArgs) Handles CSTART.Click

        Try
            Port.Open()
            Port.WriteLine("P")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub CSTOP_Click(sender As Object, e As EventArgs) Handles CSTOP.Click

        Try
            Port.Open()
            Port.WriteLine("O")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub CRESET_Click(sender As Object, e As EventArgs) Handles CRESET.Click

        Try
            Port.Open()
            Port.WriteLine("R")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub SettingsToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles SettingsToolStripMenuItem.Click

        BoxMenu.Visible = True
        Box1.Visible = False
        Box2.Visible = False
        Box3.Visible = False
        Box4.Visible = False

    End Sub

    Private Sub LEDToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles LEDToolStripMenuItem.Click

        BoxMenu.Visible = False
        Box1.Visible = True
        Box2.Visible = False
        Box3.Visible = False
        Box4.Visible = False

    End Sub

    Private Sub AfisareCu7SegmenteToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AfisareCu7SegmenteToolStripMenuItem.Click

        BoxMenu.Visible = False
        Box1.Visible = False
        Box2.Visible = True
        Box3.Visible = False
        Box4.Visible = False

    End Sub

    Private Sub AfisareCuLCDToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AfisareCuLCDToolStripMenuItem.Click

        BoxMenu.Visible = False
        Box1.Visible = False
        Box2.Visible = False
        Box3.Visible = True
        Box4.Visible = False

    End Sub

    Private Sub AboutToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AboutToolStripMenuItem.Click

        BoxMenu.Visible = False
        Box1.Visible = False
        Box2.Visible = False
        Box3.Visible = False
        Box4.Visible = True

    End Sub

    Private Sub ExitToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ExitToolStripMenuItem.Click

        Close()

    End Sub

    Private Sub DSTART_Click(sender As Object, e As EventArgs) Handles DSTART.Click

        Try
            Port.Open()
            Port.WriteLine("P")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub DSTOP_Click(sender As Object, e As EventArgs) Handles DSTOP.Click

        Try
            Port.Open()
            Port.WriteLine("O")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub DP_Click(sender As Object, e As EventArgs) Handles DP.Click

        Try
            Port.Open()
            Port.WriteLine("W")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub DM_Click(sender As Object, e As EventArgs) Handles DM.Click

        Try
            Port.Open()
            Port.WriteLine("S")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub DSTANGA_Click(sender As Object, e As EventArgs) Handles DSTANGA.Click

        Try
            Port.Open()
            Port.WriteLine("A")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub DDREAPTA_Click(sender As Object, e As EventArgs) Handles DDREAPTA.Click

        Try
            Port.Open()
            Port.WriteLine("D")
            Port.Close()
        Catch ex As Exception
            MessageBox.Show("Nu ma pot conecta la portul COM!")
        End Try

    End Sub

    Private Sub refresh_Click(sender As Object, e As EventArgs) Handles refresh.Click

        SerialBox.Items.Clear()
        ListaPorturi = IO.Ports.SerialPort.GetPortNames
        SerialBox.Items.AddRange(ListaPorturi)

    End Sub

    Private Sub text_Port_Click(sender As Object, e As EventArgs) Handles text_Port.Click

    End Sub
End Class