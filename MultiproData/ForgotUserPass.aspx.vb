Imports System.Data.SqlClient

Public Class ForgotUserPass
    Inherits System.Web.UI.Page
    Dim strsql As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click

        Dim exists As Boolean = False
        Dim checkuser As String


        checkuser = "SELECT count(*) FROM [NewUser] where UserName='" + usinput.Text + "'"

        cmd = New SqlCommand(checkuser, mycon)
        cmd.Parameters.AddWithValue("UserName", usinput.Text)
        exists = cmd.ExecuteScalar() > 0
        If (exists) Then
            strsql = "Update NewUser Set NPassword=@p Where UserName='" & usinput.Text & "'"
            cmd = New SqlCommand(strsql, mycon)
            cmd.Parameters.AddWithValue("@p", passinput.Text)
            cmd.ExecuteNonQuery()
            MsgBox("Password Updated Successfully!!")
            Response.Redirect("UserLogin.aspx")
        Else
            MsgBox("Incorrect Username")
        End If

    End Sub
End Class