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


public partial class _AddBranchCorp : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            LoadProvince();
            
        }
    }


    private void LoadProvince()
    {
        rcbGroup.DataSource = BLL.Province.GetProvince(getConstr.ConStrCMS);
        rcbGroup.DataValueField = "ProvinceId";
        rcbGroup.DataTextField = "ProvinceName";
        rcbGroup.DataBind();
    }


    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.Page.Title = "Edit BranchCorp";
    }

    public DataTable GetBranchCorpById(Guid ID)
    {
        //DataTable data = new DataTable();
        DataSet data = BLL.BranchCorpOffice.GetBranchCorpOfficeById(ID, getConstr.ConStrCMS);
        DataTable convertdata = new DataTable();
        convertdata = data.Tables[0];
        return convertdata;
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
        Guid ProvinceId = new Guid(rcbGroup.SelectedItem.Value.ToString());
        //Guid BranchCorpId = new Guid(lblGroupID.Text);
        Guid ModifiedBy = new Guid("11111111-1111-1111-1111-111111111111");
        string host = HttpContext.Current.Request.Url.Authority;
        string RegionName = txtRegionName.Text;
        BLL.BranchCorpOffice.InsertBranchCorpOffice(ProvinceId, txtRegionName.Text, txtBcoCode.Text, ModifiedBy, 1,  getConstr.ConStrCMS);
           
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

 
}