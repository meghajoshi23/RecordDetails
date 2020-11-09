Imports System.Data.SqlClient

Public Class UserLogin
    Inherits System.Web.UI.Page

    Dim strsql As String
    Dim ds As New DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'mycon = New SqlConnection("Data Source=.\sqlexpress;Initial Catalog=MultiproData;Integrated Security=True")
        'mycon.Open()
        UserConnection()
        'Session.Remove("UserName")
    End Sub

    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        ' Dim UserId As String

        'UserId = 0
        'Dim i As Int64 = 0
        Dim uname As String
        Dim pass As String
        Dim dt1 As New DataTable
        ' dt.Reset()

        strsql = "Select * from NewUser where UserName='" & usinput.Text & "' and NPassword='" & passinput.Text & "'"
        cmd = New SqlCommand(strsql, mycon)

        adp = New SqlDataAdapter(cmd)

        adp.Fill(dt1)
        ' reader = cmd.ExecuteReader()
        ' MsgBox(dt1.Rows.Count)

        If dt1.Rows.Count > 0 Then
            uname = dt1.Rows(0)("UserName").ToString()
            pass = dt1.Rows(0)("NPassword").ToString()
            ' Dim value As Object
            '    Dim UserIds As Object
            UserId = dt1.Rows(0)("UserID")
            ' MsgBox(UserIds)
            'UserId = 0
            ' value = dt1.Rows(0)("UserId").Value
            '  If UserIds IsNot DBNull.Value And pass = passinput.Text And uname = usinput.Text Then
            '  UserIds = Convert.ToInt64(UserIds)
            Session("UserName") = usinput.Text
            dt1.Reset()
            Response.Redirect("MainDataForm.aspx")
        Else
            MsgBox("Incorrect Username or Password")
                'Response.Write("<script>alert('Incorrect Username or Password');</script>")
                Response.Redirect("UserLogin.aspx")
            ' End If
            '  MsgBox(UserId)

            ' Else
            MsgBox("Incorrect Username or Password")
            'Response.Write("<script>alert('Incorrect Username or Password');</script>")
            Response.Redirect("UserLogin.aspx")
        End If
        '  adp.Dispose()
    End Sub
End Class