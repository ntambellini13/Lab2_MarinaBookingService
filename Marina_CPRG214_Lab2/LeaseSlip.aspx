﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LeaseSlip.aspx.cs" Inherits="Marina_CPRG214_Lab2.WebForm5"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <br />
    <div class="container mb-2">
    <asp:Label ID="filterLabel" CssClass="text-primary text-lg-center col-xs-3" runat="server" Text="Services Needed: "></asp:Label>
    <asp:DropDownList ID="filterDropDownList" runat="server" AutoPostBack="True" CssClass="col-xs-3" OnSelectedIndexChanged="filterDropDownList_SelectedIndexChanged">
        <asp:ListItem Text="None" Selected="True" Value="None"></asp:ListItem>
        <asp:ListItem Text="Electrical Service Required"  Value="ES"></asp:ListItem>
        <asp:ListItem Text="Water Service Required"  Value="WS"></asp:ListItem>
        <asp:ListItem Text="Electrical and Water Service Required"  Value="ESWS"></asp:ListItem>
    </asp:DropDownList>

    <asp:Label ID="dockLabel" CssClass="text-primary text-lg-center col-xs-3 ml-2" runat="server" Text="Choose Dock: "></asp:Label>
    <asp:DropDownList ID="dockDropDownList" runat="server" AutoPostBack="True" CssClass="col-xs-3" DataSourceID="AllDocksObjectDataSource" DataTextField="Name" DataValueField="DockId"></asp:DropDownList>
    <br />
        </div>
    <h2 class="text-primary mt-3">Available Slips</h2>
    <asp:GridView ID="slipsGridView" CssClass="table table-bordered" AutoGenerateColumns="False" runat="server" DataSourceID="SlipsByDockObjectDataSource" OnRowCommand="slipsGridView_RowCommand">
        <Columns>
            <asp:BoundField DataField="SlipId" HeaderText="Slip Id" SortExpression="SlipId" />
            <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
            <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
            <asp:CommandField ShowInsertButton="true" NewText="Lease" />
        </Columns>
    </asp:GridView>
    <br />
    <h2 class="text-primary">Leased Slips</h2>
    <asp:GridView ID="leasedSlipsGridView" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="LeasedSlipsObjectDataSource">
        <Columns>
            <asp:BoundField DataField="SlipId" HeaderText="Slip Id" SortExpression="SlipId" />
            <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
            <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="AllDocksObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDocks" TypeName="Marina_CPRG214_Lab2.App_Code.DockDB"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="SlipsByDockObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetSlipsByDock" TypeName="Marina_CPRG214_Lab2.App_Code.SlipDB" InsertMethod="LeaseSlip">
        <SelectParameters>
            <asp:ControlParameter ControlID="dockDropDownList" Name="DockId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="LeasedSlipsObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetLeasesByCustomerId" TypeName="Marina_CPRG214_Lab2.App_Code.LeaseDB" OnSelecting="LeasedSlipsObjectDataSource_Selecting">
        <SelectParameters>
            <asp:Parameter DefaultValue="-1" Name="CustomerId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
