using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace mocoolmaid
{
    public partial class updatecategory : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["MocoolmaidCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminuname"] == null)
            {
                Response.Redirect("~/home.aspx");
            }
            else
            {

                if (!Page.IsPostBack)
                {
                    BindCategoryData();
                }
            }
        }

        private void BindCategoryData()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblCategory";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Create a DataTable
            DataTable dt = new DataTable();
            using (da)
            {
                //Populate the DataTable
                da.Fill(dt);
            }
            //Set the DataTable as the DataSource
            gvs.DataSource = dt;
            gvs.DataBind();
        }

        protected void gvs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvs.PageIndex = e.NewPageIndex;
            BindCategoryData();
        }

        protected void gvs_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Read data from GridView and Populate the form
            txtCategoryId.Text = (gvs.DataKeys[gvs.SelectedIndex].Value.ToString());
            txtCategoryName.Text =
           ((Label)gvs.SelectedRow.FindControl("lblCatName")).Text;
            //Hide Insert button during update/delete 
            btnInsert.Visible = false;
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            Boolean IsAdded = false;
            //Add built-in function to remove spaces from Textbox Category name
            String CatName = txtCategoryName.Text;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            //add INSERT statement to create new category name
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into tblcategory (category_name) values (@cname)";
            //create one Parameterized query to prevent sql injection by
            //using above String name
            cmd.Parameters.AddWithValue("@cname", CatName);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute INSERT statement and return
            //Boolean true if number of records inserted is greater than zero
            IsAdded = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsAdded)
            {
                lblMsg.Text = CatName + " category added successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindCategoryData()
                BindCategoryData();
            }
            else
            {
                lblMsg.Text = "Error while adding " + CatName + " category";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //check whether the categoryid textbox is empty
            if (string.IsNullOrWhiteSpace(txtCategoryId.Text))
            {
                lblMsg.Text = "Please select record to update";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsUpdated = false;
            int CatID = Convert.ToInt32(txtCategoryId.Text);
            //Add built-in function to remove spaces from Textbox Category name
            String CatName = txtCategoryName.Text.Trim();
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update category name for the above CatID
            cmd.CommandText = "update tblcategory set category_name=@cname where category_id=@cid";
            //Create two parameterized queries [CatID and CatName]
            cmd.Parameters.AddWithValue("@cid", CatID);
            cmd.Parameters.AddWithValue("@cname", CatName);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = CatName + " category updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindCategoryData()
                BindCategoryData();
            }
            else
            {
                lblMsg.Text = "Error while updating " + CatName + " category";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            //Ensure that no rows are selected in Gridview by changing the EditIndex
            ResetAll();

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ResetAll();
        }

        private void ResetAll()
        {
            btnInsert.Visible = true;
            txtCategoryId.Text = "";
            txtCategoryName.Text = "";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //check whether the categoryid textbox is empty
            if (string.IsNullOrWhiteSpace(txtCategoryId.Text))
            {
                lblMsg.Text = "Please select record to delete";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsDeleted = false;
            int CatID = Convert.ToInt32(txtCategoryId.Text);
            //Add built-in function to remove spaces from Textbox Category name
            String CatName = txtCategoryName.Text;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add DELETE statement to delete the selected category for the above CatID
            cmd.CommandText = "delete from tblcategory where category_id=@cid";
            //Create a parametererized query for CatID
            cmd.Parameters.AddWithValue("@cid", CatID);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute DELETE statement and return
            //Boolean True if number of records DELETED is greater than zero
            IsDeleted = cmd.ExecuteNonQuery() > 0;
            con.Close();

            if (IsDeleted)
            {
                lblMsg.Text = CatName + " category deleted successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindCategoryData()
                BindCategoryData();
            }
            else
            {
                lblMsg.Text = "Error while deleting " + CatName + " category";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }


    }
}