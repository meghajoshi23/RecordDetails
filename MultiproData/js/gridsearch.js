﻿function Search_Gridview(strKey) {
       <% -- var strGV = '<%=GridView1.ClientID%>'-- %>
        var strData = strKey.value.toLowerCase().split(" ");
    var tblData = document.getElementById("<%=GridView1.ClientID %>");
    var rowData;
    for (var i = 1; i < tblData.rows.length; i++) {
        rowData = tblData.rows[i].innerHTML;
        var styleDisplay = 'none';
        for (var j = 0; j < strData.length; j++) {
            if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                styleDisplay = '';
            else {
                styleDisplay = 'none';
                break;
            }
        }
        tblData.rows[i].style.display = styleDisplay;
    }
} 