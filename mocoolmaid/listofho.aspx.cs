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
    public partial class listofho : System.Web.UI.Page
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

                if (!Page.IsPostBack)
                {
                    getHOlist();
                }
            }
        }

        private void getHOlist()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);

            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT HO_Id, HO_lastname, HO_firstname, HO_email, HO_phonenumber, HO_gender, HO_DOB, HO_imageurl, HO_status FROM tblHO where HO_status=1";
            cmd.Connection = con;

            // Create DataAdapter named da
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            //Create DataSet/DataTable named dtHO
            DataTable dtHO = new DataTable();

            //Populate the datatable using the Fill()
            using (da)
            {
                da.Fill(dtHO);
            }

            //Bind datatable to gridview
            GrdView1.DataSource = dtHO;
            GrdView1.DataBind();

        }

        protected void GrdView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdView1.PageIndex = e.NewPageIndex;
            getHOlist();
        }


    }
}