﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using BLL = BusinessLogic;
using Tools = utilities;
using DAL = DataAccess;


public partial class _AddAwbSeries : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            LoadCity();
            LoadArea();
            LoadBranchCorpOffice();
            //if (Request.QueryString["ID"] == null)
            //{

            //}
            //else
            //{
            //    string GroupId = Request.QueryString["ID"].ToString();


            //    DataTable GroupInfo = GetGroupIsland(new Guid(GroupId));
            //    int counter = 0;
            //    foreach (DataRow row in GroupInfo.Rows)
            //    {
            //        if (counter == 0)
            //        {
            //            string x = row["GroupId"].ToString();
            //            string y = row["GroupName"].ToString();

            //            txtIslandGroup.Text = y;
            //            lblGroupID.Text = x;
            //            counter++;
            //        }
            //    }

            //}
        }
    }



    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.Page.Title = "Add Series";
    }

    public DataTable GetGroupIsland(Guid ID)
    {
        //DataTable data = new DataTable();
        DataSet data = BLL.IslandGroup.GetIslandGroupById(getConstr.ConStrCMS, ID);
        DataTable convertdata = new DataTable();
        convertdata = data.Tables[0];
        return convertdata;
    }
    private void LoadBranchCorpOffice()
    {
        rdcBCO.DataSource = BLL.BranchCorpOffice.GetBranchCorpOffice(getConstr.ConStrCMS);
        rdcBCO.DataValueField = "BranchCorpOfficeId";
        rdcBCO.DataTextField = "BranchCorpOfficeName";
        rdcBCO.DataBind();
    }

    private void LoadArea()
    {
        rdcArea.DataSource = BLL.Area.GetArea(getConstr.ConStrCMS);
        rdcArea.DataValueField = "RevenueUnitId";
        rdcArea.DataTextField = "RevenueUnitName";
        rdcArea.DataBind();
    }

    private void LoadCity()
    {
        rcbCity.DataSource = BLL.City.GetCity(getConstr.ConStrCMS);
        rcbCity.DataValueField = "CityId";
        rcbCity.DataTextField = "CityName";
        rcbCity.DataBind();
    }

    protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind();", true);
        }
        else if (e.CommandName == "Insert")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind('navigateToInserted');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CancelEdit();", true);
        }
    }

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //logic to truncate long string to prevent SQL error
        for (int i = 1; i < 4; i++)
        {
            string val = e.NewValues[i - 1].ToString();
            int maxLength = i * 10;
            if (val.Length > maxLength) e.NewValues[i - 1] = val.Substring(0, maxLength);
        }
    }

    protected void DetailsView1_ItemCommand1(object sender, DetailsViewCommandEventArgs e)
    {

    }

    protected void DetailsView1_ItemUpdating1(object sender, DetailsViewUpdateEventArgs e)
    {

    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        Guid BCOid = new Guid(rdcBCO.SelectedItem.Value.ToString());
        Guid CityId = new Guid(rcbCity.SelectedItem.Value.ToString());
        Guid AreaId = new Guid(rdcArea.SelectedItem.Value.ToString());
        string seriesStart = txtStartSeries.Text;
        string seriesEnd = txtEndSeries.Text;
        DateTime assignedate = RadDateTimePicker1.SelectedDate.Value;

        Guid ModifiedBy = new Guid("11111111-1111-1111-1111-111111111111");
        string host = HttpContext.Current.Request.Url.Authority;
        DAL.awbissuance.InsertAWBIssuance(seriesStart,seriesEnd, assignedate, AreaId,BCOid,ModifiedBy,ModifiedBy,   getConstr.ConStrCMS);
        string script = "<script>CloseOnReload()</" + "script>";
        ClientScript.RegisterStartupScript(this.GetType(), "CloseOnReload", script);

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        string script = "<script>RefreshParentPage()</" + "script>";
        //RadScriptManager.RegisterStartupScript(this, this.GetType(), "RefreshParentPage", script, false);
        ClientScript.RegisterStartupScript(this.GetType(), "RefreshParentPage", script);
    }

    protected void CloseButton_Click(object sender, EventArgs e)
    {
        string script = "<script>RefreshParentPage()</" + "script>";
        //RadScriptManager.RegisterStartupScript(this, this.GetType(), "RefreshParentPage", script, false);
        ClientScript.RegisterStartupScript(this.GetType(), "RefreshParentPage", script);



    }

    //protected void CloseButton_Click1(object sender, EventArgs e)
    //{

    //    Page.ClientScript.RegisterClientScriptBlock(GetType(),
    //        "CloseScript", "Close()", true);

    //}
}