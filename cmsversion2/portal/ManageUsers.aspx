﻿<%@ Page Title="" Language="C#" MasterPageFile="~/cmsversion.Master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="_ManageUsers" %>

<%@ MasterType VirtualPath="~/cmsversion.master" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
    <link href="../styles/default.css" rel="stylesheet" />


</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    
    <div id="wrapper">
   <div id="page-wrapper"  >

            <div class="container-fluid" ">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                     
                            <h4>USER MAINTENANCE</h4>   
                        
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="#">Administration</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-file"></i> Manage Users
                            </li>
                        </ol>
                        <hr />

                    </div>
                </div>
                <!-- /.row -->

                <div class="size-wide">
                    <telerik:RadSearchBox RenderMode="Lightweight" runat="server" ID="radSearchUser" EmptyMessage="Search "
                        OnSearch="radSearchUser_Search"  Width="300"
                        DataKeyNames="UserId"
                        DataTextField="FullName"
                        DataValueField="UserId"
                        ShowSearchButton="false">
                        <DropDownSettings Width="300">
                           
            </DropDownSettings>
                    </telerik:RadSearchBox>
                    
                 </div>
                <br />
                        <telerik:LayoutColumn HiddenMd="true" HiddenSm="true" HiddenXs="true">
                        <telerik:RadAjaxPanel ID="RadAjaxPanel2" ClientEvents-OnRequestStart="onRequestStart" runat="server" CssClass="gridwrapper">


                            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
                                <AjaxSettings>
                                    <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                                        <UpdatedControls>
                                            <telerik:AjaxUpdatedControl ControlID="RadGrid2" LoadingPanelID="gridLoadingPanel"></telerik:AjaxUpdatedControl>
                                        </UpdatedControls>
                                    </telerik:AjaxSetting>
                                    <telerik:AjaxSetting AjaxControlID="radgrid2">
                                        <UpdatedControls>
                                            <telerik:AjaxUpdatedControl ControlID="RadGrid2" LoadingPanelID="gridLoadingPanel"></telerik:AjaxUpdatedControl>
                                        </UpdatedControls>
                                    </telerik:AjaxSetting>
                                </AjaxSettings>
                            </telerik:RadAjaxManager>
                            <telerik:RadAjaxLoadingPanel runat="server" ID="gridLoadingPanel"></telerik:RadAjaxLoadingPanel>
                           
                            <telerik:RadGrid ID="RadGrid2" OnItemCreated="RadGrid2_ItemCreated"
                                runat="server" AllowPaging="True" ExportSettings-Excel-DefaultCellAlignment="Right"
                                PageSize="10" Skin="Glow" AllowSorting="true" OnItemCommand="RadGrid2_ItemCommand1"
                                RenderMode="Mobile"
                                DataKeyNames="UserId" CommandItemDisplay="Top"
                                OnNeedDataSource="RadGrid2_NeedDataSource"> 
                                <ExportSettings ExportOnlyData="true" IgnorePaging="true"></ExportSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="UserId"
                                    AllowFilteringByColumn="false"
                                    DataKeyNames="UserId" CommandItemDisplay="Top" 
                                    InsertItemPageIndexAction="ShowItemOnFirstPage">
                                   <CommandItemSettings ShowExportToWordButton="true" ShowExportToExcelButton="true" 
            ShowExportToCsvButton="true" ShowExportToPdfButton="true"></CommandItemSettings>
                                    <Columns>

                                        <telerik:GridBoundColumn DataField="Username" HeaderText="Username" SortExpression="Username"
                                            UniqueName="Username">
                                            <HeaderStyle />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridNumericColumn DataField="FirstName" HeaderText="First name" SortExpression="FirstName"
                                            UniqueName="FirstName">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>

                                        <telerik:GridNumericColumn DataField="LastName" HeaderText="Last name" SortExpression="LastName"
                                            UniqueName="LastName">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>

                                        <telerik:GridNumericColumn DataField="RevenueArea" HeaderText="Revenue Area" SortExpression="RevenueArea"
                                            UniqueName="RevenueArea">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>
                                        
                                        <telerik:GridNumericColumn DataField="PositionName" HeaderText="Position" SortExpression="PositionName"
                                            UniqueName="PositionName">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>
                                       <telerik:GridDateTimeColumn DataField="CreatedDate" HeaderText="Date Created" SortExpression="CreatedDate"
                                            UniqueName="CreatedDate" PickerType="DatePicker" DataFormatString="{0:MM/dd/yyyy}">
                                            <HeaderStyle />
                                        </telerik:GridDateTimeColumn>
                                        <telerik:GridTemplateColumn UniqueName="TemplateEditColumn" AllowFiltering="false">
                                            <ItemTemplate>
                                                <asp:HyperLink  ID="EditLink" runat="server" Text="Edit"  ></asp:HyperLink>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    <%--    <telerik:GridButtonColumn  CommandName="Delete" Text="Delete" UniqueName="DeleteColumn" HeaderText="">
                                            <HeaderStyle />
                                        </telerik:GridButtonColumn>--%>
                                         <telerik:GridButtonColumn ConfirmText="Are you sure you want to deactivate this user?" ButtonType="LinkButton"
                                            ConfirmDialogType="RadWindow" ConfirmDialogHeight="150px" ConfirmTitle="Deactivate User" 
                                             CommandName="Delete" Text="Delete" UniqueName="DeleteColumn" HeaderText="">
                                            <HeaderStyle />
                                        </telerik:GridButtonColumn>
                                    </Columns>

                                    <CommandItemTemplate>

                                        |

                                         <a href="#"  onclick="return ShowInsertForm();">
                                            <img src="../images/emblem.png" alt="Add New User" width="20px">
                                            Add new user
                                            </a>
                                        |    
                                        
                                        <a href="#"  onclick="return ShowExportForm();">
                                            <img src="../images/emblem.png" alt="Print Preview" width="20px">
                                           Print Preview
                                            </a>
       |
                   
                                 
                                        <a href="#"  onclick="location.reload();">
                                            <img src="../images/emblem.png" alt="Export to Excel" width="20px">
                                            Refresh Data
                                            </a>
                        
                            |
                                       
                                    </CommandItemTemplate>
                              
                                </MasterTableView>
                                <ClientSettings>
                                    <Selecting AllowRowSelect="true"></Selecting>
                                    <ClientEvents OnRowDblClick="RowDblClick"></ClientEvents>
                                </ClientSettings>
                            </telerik:RadGrid>
                            <br />
                            <br />
                            <telerik:RadWindowManager RenderMode="Mobile" ID="RadWindowManager1" runat="server" EnableShadow="true">
                                <Windows>
                                    <telerik:RadWindow RenderMode="Mobile" ID="UserListDialog" runat="server" Title="Editing record" Height="520px"
                                        Width="380px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false"
                                        Modal="true" Behaviors="Close,Move">
                                    </telerik:RadWindow>

                                     <telerik:RadWindow RenderMode="Mobile" ID="AddUser" runat="server" Title="Adding record" Height="600px"
                                        Width="380px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false" VisibleStatusbar ="false" AutoSize="false"
                                        Modal="true" Behaviors="Close,Move"  >
                                    </telerik:RadWindow>

                                    
                                     <telerik:RadWindow RenderMode="Mobile" ID="ShowExport" runat="server" Title="Export Report Preview" Height="590px"
                                        Width="900px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false" VisibleStatusbar ="false" AutoSize="false"
                                        Modal="true" Behaviors="Close,Move"  >
                                    </telerik:RadWindow>
                                </Windows>
                            </telerik:RadWindowManager>
                        </telerik:RadAjaxPanel>
                        <telerik:RadCodeBlock runat="server">
                            <script type="text/javascript">
                                function onRequestStart(sender, args) {
                                    if (args.get_eventTarget().indexOf("Button") >= 0) {
                                        args.set_enableAjax(false);
                                    }
                                }
                            </script>
                                

                            <script type="text/javascript">
                                function ShowEditForm(id, rowIndex) {
                                    var grid = $find("<%= RadGrid2.ClientID %>");

                                    var rowControl = grid.get_masterTableView().get_dataItems()[rowIndex].get_element();
                                    grid.get_masterTableView().selectItem(rowControl, true);

                                    window.radopen("UserModal/EditForm_csharp.aspx?UserId=" + id, "UserListDialog");
                                    return false;
                                }
                                function ShowInsertForm() {
                                    window.radopen("UserModal/AddNewUser.aspx", "AddUser");
                                    return false;
                                }

                                function ShowExportForm() {
                                    window.radopen("Reports/UserExportPreview.aspx", "ShowExport");
                                    return false;
                                }


                                function refreshGrid(arg) {
                                    if (!arg) {
                                        $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("Rebind");
                                    }
                                    else {
                                        $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("RebindAndNavigate");
                                    }
                                }
                                function RowDblClick(sender, eventArgs) {

                                    <%--<%--    //changed code here 
                                    var grid = $find("<%= RadGrid2.ClientID %>");
                                    var MasterTable = grid.get_masterTableView();
                                    var row = MasterTable.get_dataItems()[eventArgs.get_itemIndexHierarchical()];
                                    var key = MasterTable.getCellByColumnUniqueName(row, "UserId");  // get the value by uniquecolumnname
                                    var ID = key.innerHTML;        
                                    MasterTable.fireCommand("MyClick2",ID);        
                                --%>
                                    //ShowEditForm();
                                    window.radopen("UserModal/EditForm_csharp.aspx?UserID=" + eventArgs.getDataKeyValue("UserId"), "UserListDialog");
                                }
                            </script>


                        </telerik:RadCodeBlock>

                    </telerik:LayoutColumn>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

                 
           </div>
</asp:Content>
