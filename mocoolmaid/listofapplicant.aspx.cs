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
    public partial class listofapplicant : System.Web.UI.Page
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

                if (!Page.IsPostBack)
                {
                    getApplicantlist();
                }
            }
        }

        private void getApplicantlist()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);

            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = cmd.CommandText = "select * from tblLocation l INNER JOIN tblHK hk ON l.Loc_Id = hk.Loc_Id; ";
            cmd.Connection = con;

            // Create DataAdapter named da
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            //Create DataSet/DataTable named dtHK
            DataTable dtHK = new DataTable();

            //Populate the datatable using the Fill()
            using (da)
            {
                da.Fill(dtHK);
            }

            //Bind datatable to gridview
            GrdView1.DataSource = dtHK;
            GrdView1.DataBind();

        }

        protected void GrdView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdView1.PageIndex = e.NewPageIndex;
            getApplicantlist();
        }

    }
}