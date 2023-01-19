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
    public partial class updatelocation : System.Web.UI.Page
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
                BindLocationData();
            }
        }
        }

        private void BindLocationData()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblLocation";
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
            BindLocationData();
        }

        protected void gvs_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Read data from GridView and Populate the form
            txtLocationId.Text = (gvs.DataKeys[gvs.SelectedIndex].Value.ToString());
            txtLocName.Text =
           ((Label)gvs.SelectedRow.FindControl("lblCatName")).Text;
            txtstreet.Text =
           ((Label)gvs.SelectedRow.FindControl("lblstreet")).Text;
            //Hide Insert button during update/delete 
            btnInsert.Visible = false;
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            Boolean IsAdded = false;
            //Add built-in function to remove spaces from Textbox Location name
            String LocStreet = txtstreet.Text;
            String LocName = txtLocName.Text;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            //add INSERT statement to create new Location name
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into tblLocation (Loc_Street, Loc_Name) values (@street,@lname)";
            //create one Parameterized query to prevent sql injection by
            //using above String name
            cmd.Parameters.AddWithValue("@street", LocStreet);
            cmd.Parameters.AddWithValue("@lname", LocName);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute INSERT statement and return
            //Boolean true if number of records inserted is greater than zero
            IsAdded = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsAdded)
            {
                lblMsg.Text = LocName + " location added successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindCategoryData()
                BindLocationData();
            }
            else
            {
                lblMsg.Text = "Error while adding " + LocName + " location";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //check whether the Locationid textbox is empty
            if (string.IsNullOrWhiteSpace(txtLocationId.Text))
            {
                lblMsg.Text = "Please select record to update";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsUpdated = false;
            int LocID = Convert.ToInt32(txtLocationId.Text);
            //Add built-in function to remove spaces from Textbox location name
            String LocStreet = txtstreet.Text.Trim();
            String LocName = txtLocName.Text.Trim();
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update location name for the above CatID
            cmd.CommandText = "update tblLocation set Loc_Street=@street, Loc_Name=@lname where Loc_Id=@lid";
            //Create two parameterized queries [LocID and LocName]
            cmd.Parameters.AddWithValue("@lid", LocID);
            cmd.Parameters.AddWithValue("@street", LocStreet);
            cmd.Parameters.AddWithValue("@lname", LocName);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = LocName + " location updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindLocationData()
                BindLocationData();
            }
            else
            {
                lblMsg.Text = "Error while updating " + LocName + " category";
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
            txtLocationId.Text = "";
            txtstreet.Text = "";
            txtLocName.Text = "";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //check whether the locationid textbox is empty
            if (string.IsNullOrWhiteSpace(txtLocationId.Text))
            {
                lblMsg.Text = "Please select record to delete";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsDeleted = false;
            int LocID = Convert.ToInt32(txtLocationId.Text);
            //Add built-in function to remove spaces from Textbox Category name
            String LocName = txtLocName.Text;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add DELETE statement to delete the selected category for the above CatID
            cmd.CommandText = "delete from tblLocation where Loc_Id=@lid";
            //Create a parametererized query for CatID
            cmd.Parameters.AddWithValue("@lid", LocID);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute DELETE statement and return
            //Boolean True if number of records DELETED is greater than zero
            IsDeleted = cmd.ExecuteNonQuery() > 0;
            con.Close();

            if (IsDeleted)
            {
                lblMsg.Text = LocName + " Location deleted successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindCategoryData()
                BindLocationData();
            }
            else
            {
                lblMsg.Text = "Error while deleting " + LocName + " category";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }

    }
}