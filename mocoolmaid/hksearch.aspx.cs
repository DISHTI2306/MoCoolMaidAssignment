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
    public partial class hksearch : System.Web.UI.Page
    {

        private string _conString =
WebConfigurationManager.ConnectionStrings["MocoolmaidCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["houname"] == null)
            {
                Response.Redirect("~/home.aspx");
            }
            else
            {

                SqlConnection con = new SqlConnection(_conString);
                // Create Command
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = con;
                cmd1.CommandType = CommandType.Text;
                cmd1.CommandText = "SELECT Loc_Id, Loc_Name FROM tblLocation";
                //Create DataReader
                SqlDataReader dr1;
                //open connection
                con.Open();
                //execute sql statememt
                dr1 = cmd1.ExecuteReader();
                //Bind the reader to the repeater control
                dlstHkloc.DataSource = dr1;
                dlstHkloc.DataBind();
                con.Close();

                // Create Command
                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = con;
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = "SELECT Category_Id, Category_Name FROM tblCategory";
                //Create DataReader
                SqlDataReader dr2;
                //open connection
                con.Open();
                //execute sql statememt
                dr2 = cmd2.ExecuteReader();
                //Bind the reader to the repeater control
                dlstHKCategory.DataSource = dr2;
                dlstHKCategory.DataBind();
                con.Close();
            }
        }

        protected void txtlname_TextChanged(object sender, EventArgs e)
        {
            //Add the following codes in a TextChanged event
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //create the movieid parameter
            cmd.Parameters.AddWithValue("@lname", txtlname.Text);
            //assign the parameter to the sql statement
            cmd.CommandText = "SELECT * FROM tblHK where HK_lastname= @lname";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Create a DataTable
            DataTable dt = new DataTable();

            using (da)
            {
                //Populate the DataTable
                da.Fill(dt);
            }
            //Set the DataTable as the DataSource
            dlstHK.DataSource = dt;
            dlstHK.DataBind();
        }
    }

}

    
