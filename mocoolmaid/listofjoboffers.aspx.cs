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
    public partial class listofjoboffers : System.Web.UI.Page
    {
        private string _conString =
 WebConfigurationManager.ConnectionStrings["MocoolmaidCS"]
.ConnectionString;


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
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT Top 10 * FROM tblJob where Job_status=1 ORDER by Salary Desc ";
                //Create DataReader
                SqlDataReader dr;
                //open connection
                con.Open();
                //execute sql statememt
                dr = cmd.ExecuteReader();
                //Bind the reader to the repeater control
                rptJob.DataSource = dr;
                rptJob.DataBind();
                con.Close();
            }
        }

    }
}