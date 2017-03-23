﻿<%@ Page Language="C#" Title="Master Sales" AutoEventWireup="true" MasterPageFile="~/cmsversion.master" CodeFile="MasterSalesReport.aspx.cs" Inherits="portal_Operation_Sales_MasterSalesReport" %>

<%@ MasterType VirtualPath="~/cmsversion.master" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
    <link href="../../../styles/default.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="MasterSales" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
<div class="wrapper">
    <div id="page-wrapper">
        <div class="container">
            <!--- PAGE HEADER--->
            <div class="row">
                <h3>MASTER SALES</h3>
                <ol class="breadcrumb">
                    <li>Operation</li>
                    <li>Sales</li>
                    <li>Master Sales Report</li>
                </ol>
            </div>

            <!--- PAGE BODY--->
            <div class="row">

                 <telerik:RadGrid ID="grid_MasterSales" runat="server"  Skin="Glow"
                    AllowPaging="True"  ShowGroupPanel="true" ShowFooter="true"
                    PageSize="10"  
                    AllowFilteringByColumn="true" 
                    AutoGenerateColumns="false"
                    AllowSorting="true" 
                    OnNeedDataSource="grid_MasterSales_NeedDataSource" ClientSettings-Scrolling-AllowScroll="true" Height="400px" ItemStyle-Wrap="false">
                    
                    <ExportSettings HideStructureColumns="true" ExportOnlyData="true" Pdf-DefaultFontFamily="Calibri Light" 
                        IgnorePaging="true" UseItemStyles="true" Pdf-BorderColor="Black" Pdf-FontType="Subset">
                        <Pdf ForceTextWrap="false"  PageWidth="397mm" PageHeight="210mm" BorderColor="Black" DefaultFontFamily="Calibri Light" 
                             BorderType="AllBorders" BorderStyle="Thin" PageHeaderMargin="10px" 
                             PageTopMargin="100px">
                          <PageHeader>
                              <MiddleCell  Text="<img src='../../../images/APCARGO-Logo.jpg' width='100%' height='100%'/>" TextAlign="Center" />
                          </PageHeader>
                        </Pdf>
                    </ExportSettings>          
                    <MasterTableView ShowFooter="true" AllowMultiColumnSorting="true" CommandItemDisplay="Top" FilterItemStyle-VerticalAlign="Top" Font-Size="X-Small">
                        <CommandItemSettings ShowExportToExcelButton="true" ShowExportToPdfButton="true" ExportToPdfText="PDF" ShowExportToWordButton="false" ShowExportToCsvButton="false" ShowAddNewRecordButton="false"  ShowRefreshButton="false" />                       
                        <Columns>
                            <telerik:GridDateTimeColumn
                                 DataField="TRANSACTION DATE" HeaderText="TRANSACTION DATE" SortExpression="TRANSACTION DATE" AllowFiltering="true" FilterListOptions="VaryByDataType"
                                 PickerType="DatePicker" EnableRangeFiltering="true"  DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime"  FilterControlWidth="85px" 
                                 ></telerik:GridDateTimeColumn>

                             <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false"  AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="ISLAND" HeaderText="ISLAND"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="400" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" AllowFiltering="false"
                                  DataField="REGION" HeaderText="REGION"></telerik:GridBoundColumn>
                            
                             <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" AllowFiltering="false" 
                                  DataField="CLUSTER" HeaderText="CLUSTER"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="REVENUE UNIT" HeaderText="REVENUE UNIT"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="AREA" HeaderText="AREA"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="AWB #" HeaderText="AWB #"></telerik:GridBoundColumn>                             

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="SHIPPER NAME" HeaderText="SHIPPER NAME"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="true"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="SHIPPER BCO" HeaderText="SHIPPER BCO"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="SHIPPER CITY" HeaderText="SHIPPER CITY"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="SHIPPER ADDRESS" HeaderText="SHIPPER ADDRESS"></telerik:GridBoundColumn>


                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="CONSIGNEE NAME" HeaderText="CONSIGNEE NAME"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="true"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="CONSIGNEE BCO" HeaderText="CONSIGNEE BCO"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="CONSIGNEE CITY" HeaderText="CONSIGNEE CITY"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="CONSIGNEE ADDRESS" HeaderText="CONSIGNEE ADDRESS"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="true"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="COMMODITY TYPE" HeaderText="COMMODITY TYPE"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="COMMODITY" HeaderText="COMMODITY"></telerik:GridBoundColumn>


                             <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="true"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="SHIP MODE" HeaderText="SHIP MODE"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="true"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="SERVICE MODE" HeaderText="SERVICE MODE"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="true"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="PAYMENT MODE" HeaderText="PAYMENT MODE"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="AGW" HeaderText="AGW"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Aggregate="Sum" FilterDelay="200" ShowFilterIcon="false" AllowFiltering="false"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="AMOUNT" HeaderText="AMOUNT" FooterText="TOTAL AMOUNT: "></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn FilterDelay="200" ShowFilterIcon="false" AllowFiltering="true"
                                  CurrentFilterFunction="Contains" AutoPostBackOnFilter="false" 
                                  DataField="USER" HeaderText="USER"></telerik:GridBoundColumn>

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
            </div>
        </div>
    </div>
</div> 
</asp:Content>