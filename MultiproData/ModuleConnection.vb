Imports System.Data.SqlClient

Module ModuleConnection
    Public mycon As New SqlConnection
    Public cmd As New SqlCommand
    Dim strsql As String
    Public adp As New SqlDataAdapter
    Public dt As New DataTable
    Public UserId As Long
    Function UserConnection()

        mycon = New SqlConnection("Data Source=.\sqlexpress;Initial Catalog=MultiproData;Integrated Security=True")
        mycon.Open()

    End Function
End Module
