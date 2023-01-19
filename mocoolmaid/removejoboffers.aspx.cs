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
    public partial class removejoboffers : System.Web.UI.Page
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

                getJob();
          }
        }

        void getJob()
        {
            SqlConnection con = new SqlConnection(_conString);
            con.Open();
            SqlCommand ccmd = new SqlCommand();
            ccmd.Connection = con;
            ccmd.CommandType = CommandType.Text;
            ccmd.CommandText = ccmd.CommandText = "Select Job_Id, Title, Salary, Description,Deadline, Date_posted, Job_status from tblJob where Job_status = 1";
            SqlDataAdapter sqlda = new SqlDataAdapter(ccmd);
            DataTable dta = new DataTable();
            sqlda.Fill(dta);
            con.Close();
            gvs2.DataSource = dta;
            gvs2.DataBind();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            //Retrieving the JobID from the command argument link button

            int jo_id = Convert.ToInt32((sender as LinkButton).CommandArgument);

            SqlConnection con = new SqlConnection(_conString);
            con.Open();
            SqlCommand scmd = new SqlCommand();
            scmd.Connection = con;
            scmd.CommandType = CommandType.Text;
            scmd.CommandText = "delete from tblJob where Job_Id= " + jo_id;
            scmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }

        protected void gvs2_PreRender(object sender, EventArgs e)
        {
            if (gvs2.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                gvs2.UseAccessibleHeader = true;
                //This will add the <thead> and <tbody> elements
                gvs2.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}