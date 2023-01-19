using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace mocoolmaid
{
    public partial class hosearch : System.Web.UI.Page
    {

        private string _conString =
WebConfigurationManager.ConnectionStrings["MocoolmaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["hkuname"] == null)
            {
                Response.Redirect("~/home.aspx");
            }
            else
            {

                SqlConnection con = new SqlConnection(_conString);
                // Create Command
                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = con;
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = "SELECT DISTINCT Loc_Id, Loc_Street FROM tblLocation";
                //Create DataReader
                SqlDataReader dr2;
                //open connection
                con.Open();
                //execute sql statememt
                dr2 = cmd2.ExecuteReader();
                //Bind the reader to the repeater control
                dlstHkloc.DataSource = dr2;
                dlstHkloc.DataBind();
                con.Close();

                // Create Command
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = con;
                cmd1.CommandType = CommandType.Text;
                cmd1.CommandText = "SELECT DISTINCT Category_Id, Category_Name FROM tblCategory";
                //Create DataReader
                SqlDataReader dr1;
                //open connection
                con.Open();
                //execute sql statememt
                dr1 = cmd1.ExecuteReader();
                //Bind the reader to the repeater control
                dlstHOcategory.DataSource = dr1;
                dlstHOcategory.DataBind();
                con.Close();

            }

        }

        protected void txtholname_TextChanged(object sender, EventArgs e)
        {
            //Add the following codes in a TextChanged event
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //create the movieid parameter
            cmd.Parameters.AddWithValue("@holname", txtholname.Text);
            //assign the parameter to the sql statement
            cmd.CommandText = "SELECT HO_Id, HO_imageurl, HO_lastname, HO_firstname, HO_phonenumber, HO_email FROM tblHO where HO_lastname= @holname";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Create a DataTable
            DataTable dt = new DataTable();

            using (da)
            {
                //Populate the DataTable
                da.Fill(dt);
            }
            //Set the DataTable as the DataSource
            dlstHO.DataSource = dt;
            dlstHO.DataBind();
        }

        protected void txthoid_TextChanged(object sender, EventArgs e)
        {
            //Add the following codes in a TextChanged event
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd1 = new SqlCommand();
            cmd1.Connection = con;
            cmd1.CommandType = CommandType.Text;
            //create the movieid parameter
            cmd1.Parameters.AddWithValue("@hoid", txthoid.Text);
            //assign the parameter to the sql statement
            cmd1.CommandText = "SELECT HO_Id, HO_imageurl, HO_lastname, HO_firstname, HO_phonenumber, HO_email FROM tblHO where HO_Id= @hoid";
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            //Create a DataTable
            DataTable dt1 = new DataTable();

            using (da1)
            {
                //Populate the DataTable
                da1.Fill(dt1);
            }
            //Set the DataTable as the DataSource
            dlstHO.DataSource = dt1;
            dlstHO.DataBind();
        }

    }

}