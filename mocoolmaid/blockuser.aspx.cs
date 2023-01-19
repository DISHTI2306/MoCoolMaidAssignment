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
    public partial class blockuser : System.Web.UI.Page
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
                getActiveHK();
                getActiveHO();
        }
        }

        void getActiveHK()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select HK_Id, HK_firstname, HK_lastname, HK_username, HK_imageurl from tblHK where HK_status = 1";
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvs.DataSource = dt;
            gvs.DataBind();
        }

        protected void lnkblock_Click(object sender, EventArgs e)
        {
            //Retrieving the HKID from the command argument link button

            int hkid = Convert.ToInt32((sender as LinkButton).CommandArgument);

            SqlConnection con = new SqlConnection(_conString);
            //open Connection
            con.Open();
            //Create Command
            SqlCommand ucmd = new SqlCommand();
            ucmd.CommandType = CommandType.Text;
            ucmd.CommandText = "update tblHK set HK_status='0' where HK_Id=" + hkid;
            ucmd.Connection = con;
            ucmd.ExecuteNonQuery();
            con.Close();
            getActiveHK();
        }

        protected void gvs_PreRender(object sender, EventArgs e)
        {
            if (gvs.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                gvs.UseAccessibleHeader = true;
                //This will add the <thead> and <tbody> elements
                gvs.HeaderRow.TableSection =
                TableRowSection.TableHeader;
            }
        }

        void getActiveHO()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select HO_Id, HO_firstname, HO_lastname, HO_username, HO_imageurl from tblHO where HO_status = 1";
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }



        protected void GridView1_PreRender(object sender, EventArgs e)
        {
            if (gvs.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                GridView1.UseAccessibleHeader = true;
                //This will add the <thead> and <tbody> elements
                GridView1.HeaderRow.TableSection =
                TableRowSection.TableHeader;
            }
        }

        protected void lnkhoblock_Click(object sender, EventArgs e)
        {
            //Retrieving the HOID from the command argument link button

            int hoid = Convert.ToInt32((sender as LinkButton).CommandArgument);

            SqlConnection con = new SqlConnection(_conString);
            //open Connection
            con.Open();
            //Create Command
            SqlCommand ucmd = new SqlCommand();
            ucmd.CommandType = CommandType.Text;
            ucmd.CommandText = "update tblHO set HO_status='0' where HO_Id=" + hoid;
            ucmd.Connection = con;
            ucmd.ExecuteNonQuery();
            con.Close();
            getActiveHO();
        }
    }
}