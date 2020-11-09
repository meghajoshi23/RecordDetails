Imports System.Data.SqlClient

Public Class PartyInfo
    Inherits System.Web.UI.Page
    Dim strsql As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        UserConnection()

        If Session("UserName") IsNot Nothing Then
        Else
            Response.Redirect("UserLogin.aspx")
        End If

    End Sub

    Private Sub ButtonAdd_Click(sender As Object, e As EventArgs) Handles ButtonAdd.Click
        strsql = "insert into PartyInfo(PartyName,ContactNumber,Station) values(@a,@b,@c) "
        cmd = New SqlCommand(strsql, mycon)

            cmd.Parameters.AddWithValue("@a", TextBoxParty.Text.ToUpper())
            cmd.Parameters.AddWithValue("@b", TextBoxContact.Text.ToUpper())
            cmd.Parameters.AddWithValue("@c", TextBoxStation.Text.ToUpper())
            cmd.ExecuteNonQuery()
            MsgBox("Added Successfully!")
            TextBoxParty.Text = ""
            TextBoxContact.Text = ""
            TextBoxStation.Text = ""

    End Sub

    Protected Sub ButtonClose_Click(sender As Object, e As EventArgs) Handles ButtonClose.Click

        Response.Redirect("MainDataForm.aspx")
    End Sub
End Class