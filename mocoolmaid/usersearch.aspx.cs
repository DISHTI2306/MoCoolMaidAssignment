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
    public partial class usersearch : System.Web.UI.Page
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

                SqlConnection con = new SqlConnection(_conString);
                // Create Command
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT Loc_Id, Loc_Name FROM tblLocation";
                //Create DataReader
                SqlDataReader dr;
                //open connection
                con.Open();
                //execute sql statememt
                dr = cmd.ExecuteReader();
                //Bind the reader to the repeater control
                dlstHousekeeper.DataSource = dr;
                dlstHousekeeper.DataBind();
                con.Close();

                // Create Command
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = con;
                cmd1.CommandType = CommandType.Text;
                cmd1.CommandText = "SELECT HO_Id, HO_lastname FROM tblHO";
                //Create DataReader
                SqlDataReader dr1;
                //open connection
                con.Open();
                //execute sql statememt
                dr1 = cmd1.ExecuteReader();
                //Bind the reader to the repeater control
                dlstHouseowner.DataSource = dr1;
                dlstHouseowner.DataBind();
                con.Close();

            }
        }

       
    }
}