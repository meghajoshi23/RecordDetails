Imports System.Data.SqlClient

Public Class PartyDetails
    Inherits System.Web.UI.Page
    Dim strsql As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") IsNot Nothing Then

            If Not IsPostBack Then
                dt.Clear()
                ' dt.Reset()
                Me.BindGrid()
            End If
        Else
            Response.Redirect("UserLogin.aspx")
        End If

    End Sub
    Function BindGrid()
        ' dt.Clear()
        strsql = "select Id,PartyName,ContactNumber,Station from PartyInfo "
        cmd = New SqlCommand(strsql, mycon)
        adp = New SqlDataAdapter(cmd)
        adp.Fill(dt)
        cmd.ExecuteNonQuery()
        GridView1.DataSource = dt
        GridView1.DataBind()
        dt.Clear()

    End Function

    Protected Sub ButtonSearch_Click(sender As Object, e As EventArgs) Handles ButtonSearch.Click
        dt.Clear()
        strsql = "select Id,PartyName,ContactNumber,Station from PartyInfo where PartyName = '" + TextBoxSearch.Text + "' "
        cmd = New SqlCommand(strsql, mycon)
        adp = New SqlDataAdapter(cmd)
        adp.Fill(dt)
        ' cmd.ExecuteNonQuery()
        GridView1.DataSource = dt
        GridView1.DataBind()
        '  dt.Clear()

    End Sub

    Private Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridView1.RowEditing

        GridView1.EditIndex = e.NewEditIndex
        Me.BindGrid()


    End Sub

    Private Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridView1.RowUpdating

        Dim row As GridViewRow = GridView1.Rows(e.RowIndex)
        Dim Id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim PartyName As String = (TryCast(row.FindControl("txtPName"), TextBox)).Text
        Dim CNo As String = (TryCast(row.FindControl("txtCNo"), TextBox)).Text
        Dim Station As String = (TryCast(row.FindControl("txtStation"), TextBox)).Text
        Dim query As String = "UPDATE PartyInfo SET PartyName=@b,ContactNumber=@c,Station=@d WHERE Id=@id"

        Using cmd As SqlCommand = New SqlCommand(query)
            cmd.Parameters.AddWithValue("@id", Id)
            cmd.Parameters.AddWithValue("@b", PartyName.ToUpper())
            cmd.Parameters.AddWithValue("@c", CNo.ToUpper())
            cmd.Parameters.AddWithValue("@d", Station.ToUpper())
            cmd.Connection = mycon

            cmd.ExecuteNonQuery()

        End Using
        GridView1.EditIndex = -1
        ' dt.Clear()
        Me.BindGrid()
    End Sub

    Private Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1
        Me.BindGrid()
    End Sub

    Private Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim Id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim query As String = "DELETE FROM PartyInfo WHERE Id=@Id"

        Using cmd As SqlCommand = New SqlCommand(query)
            cmd.Parameters.AddWithValue("@Id", Id)
            cmd.Connection = mycon
            cmd.ExecuteNonQuery()
        End Using
        dt.Clear()
        Me.BindGrid()
    End Sub

    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow AndAlso e.Row.RowIndex <> GridView1.EditIndex Then
            TryCast(e.Row.Cells(3).Controls(2), LinkButton).Attributes("onclick") = "return confirm('Do you want to delete this row?');"
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

    Public Sub ButtonClose_Click(sender As Object, e As EventArgs) Handles ButtonClose.Click
        ' dt.Reset()
        'dt.Dispose()
        '  dt.Rows.Clear()
        dt.Columns.Remove("PartyName")
        dt.Columns.Remove("ContactNumber")
        dt.Columns.Remove("Station")
        Response.Redirect("EditPage.aspx")
    End Sub
End Class