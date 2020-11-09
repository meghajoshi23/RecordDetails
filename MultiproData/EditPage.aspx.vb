Imports System.Data.SqlClient

Public Class EditPage
    Inherits System.Web.UI.Page
    Dim strsql As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' UserConnection()
        If Session("UserName") IsNot Nothing Then
            If Not IsPostBack Then
                TextBoxSearch.Text = Date.Today.ToString("dd-MM-yyyy")
                Me.BindGrid()


            End If
        Else
            Response.Redirect("UserLogin.aspx")
        End If
    End Sub

    Protected Sub ButtonSearch_Click(sender As Object, e As EventArgs) Handles ButtonSearch.Click

        strsql = "select Id, convert(varchar, cast(convert(varchar(10),PDate, 110) as datetime), 106) as PDate,Party ,Problem,Remarks  from CmpnyInfo where CONVERT(varchar, PDate, 105) = '" + TextBoxSearch.Text + "' Order By Id desc "
        cmd = New SqlCommand(strsql, mycon)
        adp = New SqlDataAdapter(cmd)
        adp.Fill(dt)
        ' cmd.ExecuteNonQuery()
        GridView1.DataSource = dt
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Private Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridView1.RowEditing
        GridView1.EditIndex = e.NewEditIndex
        Me.BindGrid()
    End Sub
    Function BindGrid()

        strsql = "select Id, convert(varchar, cast(convert(varchar(10),PDate, 110) as datetime), 106) as PDate,Party ,Problem,Remarks  from CmpnyInfo where CONVERT(varchar, PDate, 105) = '" + TextBoxSearch.Text + "' Order By Id desc "
        cmd = New SqlCommand(strsql, mycon)
        adp = New SqlDataAdapter(cmd)
        adp.Fill(dt)
        cmd.ExecuteNonQuery()
        GridView1.DataSource = dt
        GridView1.DataBind()
        dt.Clear()
    End Function

    Private Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridView1.RowUpdating

        Dim row As GridViewRow = GridView1.Rows(e.RowIndex)
        Dim Id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim Party As String = (TryCast(row.FindControl("txtParty"), TextBox)).Text
        Dim Problem As String = (TryCast(row.FindControl("txtProblem"), TextBox)).Text
        Dim remarks As String = (TryCast(row.FindControl("txtRemarks"), TextBox)).Text
        Dim query As String = "UPDATE CmpnyInfo SET Party=@b,Problem=@c,Remarks=@d WHERE Id=@id"

        Using cmd As SqlCommand = New SqlCommand(query)
            cmd.Parameters.AddWithValue("@id", ID)
            cmd.Parameters.AddWithValue("@b", Party)
            cmd.Parameters.AddWithValue("@c", Problem)
            cmd.Parameters.AddWithValue("@d", remarks)
            cmd.Connection = mycon

            cmd.ExecuteNonQuery()

        End Using


        GridView1.EditIndex = -1
        Me.BindGrid()
    End Sub

    Private Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1
        Me.BindGrid()
    End Sub

    Private Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim Id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim query As String = "DELETE FROM CmpnyInfo WHERE Id=@Id"

        Using cmd As SqlCommand = New SqlCommand(query)
            cmd.Parameters.AddWithValue("@Id", Id)
            cmd.Connection = mycon

            cmd.ExecuteNonQuery()

        End Using


        Me.BindGrid()
    End Sub

    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow AndAlso e.Row.RowIndex <> GridView1.EditIndex Then
            TryCast(e.Row.Cells(4).Controls(2), LinkButton).Attributes("onclick") = "return confirm('Do you want to delete this row?');"
        End If
        If e.Row.RowType = DataControlRowType.DataRow And
           e.Row.RowState = DataControlRowState.Normal Or
e.Row.RowState = DataControlRowState.Alternate Then

            e.Row.TabIndex = -1
            e.Row.Attributes("onclick") =
      String.Format("javascript:SelectRow(this, {0});", e.Row.RowIndex)
            e.Row.Attributes("onkeydown") = "javascript:return SelectSibling(event);"
            e.Row.Attributes("onselectstart") = "javascript:return false;"
        End If

    End Sub

    Protected Sub ButtonClose_Click(sender As Object, e As EventArgs) Handles ButtonClose.Click
        'Session.Remove("UserName")
        dt.Clear()
        dt.Dispose()
        Response.Redirect("MainDataForm.aspx")
    End Sub

    Protected Sub ButtonParty_Click(sender As Object, e As EventArgs) Handles ButtonParty.Click
        dt.Clear()
        Response.Redirect("PartyDetails.aspx")
    End Sub
End Class