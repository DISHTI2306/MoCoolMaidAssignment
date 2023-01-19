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
    public partial class viewstats : System.Web.UI.Page
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

                getHOCount();
                getHKCount();
                getCategoryCount();
                getJobAvailableCount();
            }
        }
        private void getHOCount()
        {
            SqlConnection dbcon = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select count(*) from tblHO";
            cmd.Connection = dbcon;


            dbcon.Open();
            hyho.Text = cmd.ExecuteScalar().ToString();
            dbcon.Close();
        }

        private void getHKCount()
        {
            SqlConnection dbcon = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select count(*) from tblHK";
            cmd.Connection = dbcon;


            dbcon.Open();
            hyhk.Text = cmd.ExecuteScalar().ToString();
            dbcon.Close();
        }

        private void getCategoryCount()
        {
            SqlConnection dbcon = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select count(*) from tblCategory";
            cmd.Connection = dbcon;


            dbcon.Open();
            hycategory.Text = cmd.ExecuteScalar().ToString();
            dbcon.Close();
        }

        private void getJobAvailableCount()
        {
            SqlConnection dbcon = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select count(*) from tblJob where Job_status=1";
            cmd.Connection = dbcon;


            dbcon.Open();
            hyjob.Text = cmd.ExecuteScalar().ToString();
            dbcon.Close();
        }

    }
}