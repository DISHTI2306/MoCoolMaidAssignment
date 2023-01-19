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
    public partial class hkprofile : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT HK_Id, HK_imageurl FROM tblHK";

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                using (da)
                {
                    //Fill DataTable
                    da.Fill(dt);
                }
                dlsthk.DataSource = dt;
                dlsthk.DataBind();

                int qs = Convert.ToInt32(Request.QueryString["ID"]);

                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = con;
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = "select Hk_firstname, HK_lastname, HK_imageurl, HK_email, HK_gender, HK_experience, HK_skill, HK_status from tblHK where HK_Id = " + qs;

                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                DataTable dt2 = new DataTable();
                using (da2)
                {
                    //Fill DataTable
                    da2.Fill(dt2);
                }

                dlsthkdetails.DataSource = dt2;
                dlsthkdetails.DataBind();
                dlsthkdetails.Visible = true;
            }
        }

    }
}