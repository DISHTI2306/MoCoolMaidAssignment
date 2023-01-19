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
    public partial class hodetails : System.Web.UI.Page
    {

        private string _conString =
WebConfigurationManager.ConnectionStrings["MocoolmaidCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = con;
            cmd2.CommandType = CommandType.Text;

            int qs = Convert.ToInt32(Request.QueryString["id"]);
            cmd2.CommandText = "SELECT HO_imageurl, HO_lastname, HO_firstname, HO_phonenumber, HO_email, HO_status FROM tblHO where HO_Id= " + qs;
            //Create DataReader
            SqlDataReader dr2;
            //open connection
            con.Open();
            //execute sql statememt
            dr2 = cmd2.ExecuteReader();
            //Bind the reader to the repeater control
            dlstHODetails.DataSource = dr2;
            dlstHODetails.DataBind();
            con.Close();
        }

    }
}