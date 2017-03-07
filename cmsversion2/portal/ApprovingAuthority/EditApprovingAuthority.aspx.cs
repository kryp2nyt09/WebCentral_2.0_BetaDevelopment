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


public partial class _EditApprovingAuthority : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            if (Request.QueryString["ID"] == null)
            {

            }
            else
            {
                string GroupId = Request.QueryString["ID"].ToString();

                rcbComapny.DataSource = BLL.Company.GetCompanies(getConstr.ConStrCMS);
                rcbComapny.DataValueField = "CompanyId";
                rcbComapny.DataTextField = "CompanyName";
                rcbComapny.DataBind();
                DataTable GroupInfo = GetApprovingAuthorityDetails(new Guid(GroupId));
                int counter = 0;
                foreach (DataRow row in GroupInfo.Rows)
                {
                    if (counter == 0)
                    {
                        string FirstName = row["FirstName"].ToString();
                        string LastName = row["LastName"].ToString();
                        string title = row["Title"].ToString();
                        string position = row["Position"].ToString();
                        string department = row["Department"].ToString();
                        string contactno = row["ContactNo"].ToString();
                        string Mobile = row["Mobile"].ToString();
                        string fax = row["Fax"].ToString();
                        string email = row["Email"].ToString();
                        string company = row["CompanyName"].ToString();
                        string AAId = row["ApprovingAuthorityId"].ToString();

                        lblCompanyID.Text = AAId;
                        txtFname.Text = FirstName;
                        txtLname.Text = LastName;
                        txtTitle.Text = title;
                        txtPosition.Text = position;
                        txtDepartment.Text = department;
                        txtContactNumber.Text = contactno;
                        txtMobile.Text = Mobile;
                        txtFax.Text = fax;
                        txtEmail.Text = email;
                         rcbComapny.SelectedItem.Text = company;
                        counter++;
                    }
                }
                

            }
        }
    }



    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.Page.Title = "Edit Approving Authority";
    }

    public DataTable GetApprovingAuthorityDetails(Guid ID)
    {
        //DataTable data = new DataTable();
        DataSet data = BLL.ApprovingAuthority.GetApprovingAuthorityDetailsById(getConstr.ConStrCMS, ID);
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

        if (lblCompanyID.Text != "")
        {
            Guid ID = new Guid(lblCompanyID.Text);
            string CompanyId = this.rcbComapny.SelectedItem.Value.ToString();
            Guid CompanyIDguid = new Guid(CompanyId);
            Guid ModifiedBy = new Guid("11111111-1111-1111-1111-111111111111");

            BLL.ApprovingAuthority.UpdateApprovingAuthorityDetails(ID, txtFname.Text, txtLname.Text, txtTitle.Text, txtPosition.Text, txtDepartment.Text, txtContactNumber.Text, txtMobile.Text, txtFax.Text, txtEmail.Text, CompanyIDguid, ModifiedBy, 1, getConstr.ConStrCMS);
        }

        RefreshPage();
    }

    private void RefreshPage()
    {
        string script = "<script>RefreshParentPage()</" + "script>";
        //RadScriptManager.RegisterStartupScript(this, this.GetType(), "RefreshParentPage", script, false);
        ClientScript.RegisterStartupScript(this.GetType(), "RefreshParentPage", script);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        RefreshPage();
    }

    protected void CloseButton_Click(object sender, EventArgs e)
    {
        RefreshPage();



    }

    //protected void CloseButton_Click1(object sender, EventArgs e)
    //{

    //    Page.ClientScript.RegisterClientScriptBlock(GetType(),
    //        "CloseScript", "Close()", true);

    //}
}