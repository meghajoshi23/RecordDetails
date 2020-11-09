Imports System.Data.SqlClient
Imports System.Drawing

Public Class MainDataForm
    Inherits System.Web.UI.Page
    Dim strsql As String
    Dim strsql2 As String

    ' Dim datar As New SqlDataReader  
    Public Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'TextBoxNewParty.Visible = False
        'UserConnection()

        Panel2.Visible = True
        Panel1.Visible = False
        dt.Clear()
        If Session("UserName") IsNot Nothing Then
            'dt.Reset()
            If Not IsPostBack Then
                TextBoxDate.Text = Date.Today.ToString("dd-MM-yyyy")
                'a = Date.Today.ToString("dd-MM-yyyy")
                strsql = "select C.Id, convert(varchar, cast(convert(varchar(10),C.PDate, 110) as datetime), 106) as PDate,LTRIM(RIGHT(CONVERT(VARCHAR(20),C.PTime, 100), 7)) as PTime,C.Party ,C.Problem,C.Remarks , U.UserName  from CmpnyInfo C Left Join NewUser U on C.UserID=U.UserID where CONVERT(varchar, C.PDate, 105) = '" + TextBoxDate.Text + "' Order By C.Id desc "
                cmd = New SqlCommand(strsql, mycon)
                adp = New SqlDataAdapter(cmd)
                adp.Fill(dt)
                cmd.ExecuteNonQuery()
                GridView1.DataSource = dt
                GridView1.DataBind()
                'dt.Clear()
            End If
        Else
            Response.Redirect("UserLogin.aspx")
        End If
    End Sub

    Protected Sub ButtonSave_Click(sender As Object, e As EventArgs) Handles ButtonSave.Click
        Dim dateTime As New DateTime


        'dateTime = DateTime.ParseExact(TextBoxDate.Text, "dd-MM-yyyy", Nothing)
        'dateTime = Convert.ToDateTime(dateTime, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat)
        strsql = "insert into CmpnyInfo(PDate,PTime,Party,Problem,Remarks,UserID) values(@a,@time,@b,@c,@d,@f) "
        cmd = New SqlCommand(strsql, mycon)
        ' CONVERT(VARCHAR(10), DOJ, 101)
        cmd.Parameters.Add(New SqlParameter("@a", Data.SqlDbType.DateTime))
        cmd.Parameters("@a").Value = CDate(Convert.ToDateTime(TextBoxDate.Text).ToString("dd-MM-yyyy"))
        ' cmd.Parameters.AddWithValue("@time", Data.SqlDbType.DateTime)
        cmd.Parameters.Add(New SqlParameter("@time", Data.SqlDbType.DateTime))
        cmd.Parameters("@time").Value = CDate(Convert.ToDateTime(TimeOfDay).ToString())
        cmd.Parameters.AddWithValue("@b", DropDownListParty.Text)
        cmd.Parameters.AddWithValue("@c", TextBoxProblem.Text.ToUpper())
        cmd.Parameters.AddWithValue("@d", TextBoxRemarks.Text.ToUpper())
        cmd.Parameters.AddWithValue("@f", UserId)
        cmd.ExecuteNonQuery()

        adp = New SqlDataAdapter("select C.Id, convert(varchar, cast(convert(varchar(10),C.PDate, 110) as datetime), 106) as PDate,LTRIM(RIGHT(CONVERT(VARCHAR(20), C.PTime, 100), 7)) as PTime,C.Party ,C.Problem,C.Remarks , U.UserName  from CmpnyInfo C Left Join NewUser U on C.UserID=U.UserID where CONVERT(varchar, C.PDate, 105) = '" + TextBoxDate.Text + "' Order By C.Id desc ", mycon)
        dt = New DataTable()
        GridView1.DataSourceID = String.Empty
        adp.Fill(dt)
        GridView1.DataSource = dt
        GridView1.DataBind()
        MsgBox("Saved Successfully!!")
        TextBoxProblem.Text = ""
        TextBoxRemarks.Text = ""
        ' Response.Redirect(Request.RawUrl)

    End Sub

    Protected Sub ButtonNewParty_Click(sender As Object, e As EventArgs) Handles ButtonNewParty.Click
        Panel2.Visible = False
        Panel1.Visible = True
        ' Session("Cname") = DropDownListParty.Text
        ' Response.Redirect("PartyInfo.aspx")
    End Sub

    Protected Sub ButtonClose_Click(sender As Object, e As EventArgs) Handles ButtonClose.Click
        Session.Remove("UserName")
        ' dt.Reset()

        'FormsAuthentication.SignOut()
        Response.Redirect("UserLogin.aspx")
    End Sub


    Public Sub TextBoxDate_TextChanged(sender As Object, e As EventArgs) Handles TextBoxDate.TextChanged
        'Dim a As String
        'a = DateTime.Today.ToString("dd-MM-yyyy")
        'MsgBox(a)


        adp = New SqlDataAdapter("select Id, convert(varchar, cast(convert(varchar(10),PDate, 110) as datetime), 106) as PDate,LTRIM(RIGHT(CONVERT(VARCHAR(20), PTime, 100), 7)) as PTime,Party ,Problem,Remarks  from CmpnyInfo where CONVERT(varchar, PDate, 105) = '" + TextBoxDate.Text + "' order by Id desc ", mycon)
        dt = New DataTable()
        ' GridView1.DataSourceID = String.Empty
        adp.Fill(dt)
        GridView1.DataSource = dt
        GridView1.DataBind()
        ' dt.Clear()

    End Sub


    Protected Sub ButtonEdit_Click(sender As Object, e As EventArgs) Handles ButtonEdit.Click
        dt.Clear()
        Response.Redirect("EditPage.aspx")
    End Sub


    Protected Sub ButtonSearch_Click(sender As Object, e As EventArgs) Handles ButtonSearch.Click
        adp = New SqlDataAdapter("select C.Id, convert(varchar, cast(convert(varchar(10),C.PDate, 110) as datetime), 106) as PDate,LTRIM(RIGHT(CONVERT(VARCHAR(20),C.PTime, 100), 7)) as PTime,C.Party ,C.Problem,C.Remarks , U.UserName  from CmpnyInfo C Left Join NewUser U on C.UserID=U.UserID where CONVERT(varchar, C.PDate, 105) = '" + TextBoxDate.Text + "' Order By C.Id desc ", mycon)
        dt = New DataTable()
        GridView1.DataSourceID = String.Empty
        adp.Fill(dt)
        GridView1.DataSource = dt
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        For Each row As GridViewRow In GridView1.Rows
            If row.RowIndex = GridView1.SelectedIndex Then
                row.BackColor = ColorTranslator.FromHtml("#A1DCF2")
                row.ToolTip = String.Empty
            Else
                row.BackColor = ColorTranslator.FromHtml("#FFFFFF")
                row.ToolTip = "Click to select this row."
            End If
        Next
    End Sub

    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        'If e.Row.RowType = DataControlRowType.DataRow Then
        '    ' e.Row.Attributes("onclick") = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" & e.Row.RowIndex)
        '    ' e.Row.Attributes("onclick") = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" & e.Row.RowIndex)
        '    ' e.Row.Attributes("onkeydown") = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" & e.Row.RowIndex)
        '    e.Row.Attributes("onmouseover") = "javascript:SetMouseOver(me)"
        '    e.Row.ToolTip = "Click to select this row."

        'End If
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

    Private Sub GridView1_PreRender(sender As Object, e As EventArgs) Handles GridView1.PreRender

    End Sub

    Private Sub ButtonClosep_Click(sender As Object, e As EventArgs) Handles ButtonClosep.Click
        Panel2.Visible = True
        Panel1.Visible = False
    End Sub

    Private Sub ButtonAddp_Click(sender As Object, e As EventArgs) Handles ButtonAddp.Click
        strsql = "insert into PartyInfo(PartyName,ContactNumber,Station) values(@a,@b,@c) "
        cmd = New SqlCommand(strsql, mycon)
        cmd.Parameters.AddWithValue("@a", TextBoxParty.Text.ToUpper())
        cmd.Parameters.AddWithValue("@b", TextBoxContact.Text.ToUpper())
        cmd.Parameters.AddWithValue("@c", TextBoxStation.Text.ToUpper())
        cmd.ExecuteNonQuery()
        ' adp.Fill(dt)
        DropDownListParty.DataBind()
        MsgBox("Added Successfully!")
        TextBoxParty.Text = ""
        TextBoxContact.Text = ""
        TextBoxStation.Text = ""
    End Sub

    'Private Sub TextBoxDate_Load(sender As Object, e As EventArgs) Handles TextBoxDate.Load
    '    TextBoxDate.Text = Date.Today.ToString("dd-MM-yyyy")
    'End Sub

    'Private Sub GridView1_Load(sender As Object, e As EventArgs) Handles GridView1.Load
    '    mycon = New SqlConnection("Data Source=.\sqlexpress;Initial Catalog=MultiproData;Integrated Security=True")
    '    mycon.Open()
    '    strsql = "select * from CmpnyInfo"
    '    cmd = New SqlCommand(strsql, mycon)
    '    adp = New SqlDataAdapter(cmd)
    '    adp.Fill(dt)
    '    GridView1.DataSource = dt
    '    GridView1.DataBind()
    '    '  GridView1.Visible = True
    'End Sub
End Class