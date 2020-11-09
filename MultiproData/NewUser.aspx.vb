Imports System.Data.SqlClient

Public Class NewUser
    Inherits System.Web.UI.Page
    Dim userId As Integer
    Dim strsql As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        UserConnection()
    End Sub

    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click


        Dim exists As Boolean = False
        Dim checkuser As String
        Dim strsql As String
        strsql = "select UserID from NewUser"
        cmd = New SqlCommand(strsql, mycon)
        cmd.ExecuteNonQuery()
        userId = Session("UserID")

        MsgBox(userId)
        checkuser = "SELECT count(*) FROM [NewUser] where UserName='" + usinput.Text + "'"

        cmd = New SqlCommand(checkuser, mycon)
        cmd.Parameters.AddWithValue("UserName", usinput.Text)
        exists = cmd.ExecuteScalar() > 0
        If (exists) Then

            MsgBox("User Already Exists")
            Response.Redirect("NewUser.aspx")
        Else
            strsql = "insert into NewUser(UserName,NPassword,ConfirmPassword,ContactNo) values(@a,@b,@c,@d) "
            cmd = New SqlCommand(strsql, mycon)
            cmd.Parameters.AddWithValue("@a", usinput.Text)
            cmd.Parameters.AddWithValue("@b", passinput.Text)
            cmd.Parameters.AddWithValue("@c", TextBoxCPass.Text)
            cmd.Parameters.AddWithValue("@d", TextBoxContact.Text)

            cmd.ExecuteNonQuery()

            MsgBox("Successfully Registered!!")
            Response.Redirect("UserLogin.aspx")
        End If



    End Sub
End Class