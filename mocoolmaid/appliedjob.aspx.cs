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
    public partial class appliedjob : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["MocoolmaidCS"].ConnectionString;
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
                    getAppliedJoblist();
                }
            }
        }

        private void getAppliedJoblist()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);

            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT hkjob.HK_Id, hkjob.Date_Applied, job.Title, job.Description, hk.HK_email, hk.HK_imageurl, hk.HK_lastname, hk.HK_firstname FROM tblHK hk INNER JOIN tblHKJob hkjob ON hkjob.HK_Id = hk.HK_Id INNER JOIN tblJob job ON hkjob.Job_Id = job.Job_Id where status=1";
            cmd.Connection = con;

            // Create DataAdapter named da
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            //Create DataSet/DataTable named dtHO
            DataTable dtHKJob = new DataTable();

            //Populate the datatable using the Fill()
            using (da)
            {
                da.Fill(dtHKJob);
            }

            //Bind datatable to gridview
            GrdView1.DataSource = dtHKJob;
            GrdView1.DataBind();

        }

        protected void GrdView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdView1.PageIndex = e.NewPageIndex;
            getAppliedJoblist();
        }

    }

}
