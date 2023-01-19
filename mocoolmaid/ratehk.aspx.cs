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
    public partial class ratehk : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT HK_Id, HK_imageurl, HK_lastname, HK_firstname, HK_email, HK_skill, HK_experience, HK_dateregistered FROM tblHK ";
                //Create DataReader
                SqlDataReader dr;
                //open connection
                con.Open();
                //execute sql statememt
                dr = cmd.ExecuteReader();
                //Bind the reader to the repeater control
                rptHk.DataSource = dr;
                rptHk.DataBind();
                con.Close();
            }
        }
    }

}