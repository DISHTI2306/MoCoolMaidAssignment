using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text;


namespace mocoolmaid
{
    public partial class application : System.Web.UI.Page
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

                    BindApplicant();
                }
            }
        }

        private void BindApplicant()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT HK_Id, HK_dateregistered, HK_lastname, HK_firstname, HK_email, HK_application_status FROM tblHK";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Create a DataTable
            DataTable dt = new DataTable();
            using (da)
            {
                //Populate the DataTable
                da.Fill(dt);
            }

            //Set the DataTable as the DataSource
            gvs.DataSource = dt;
            gvs.DataBind();

        }

        protected void gvs_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtappid.Text =
           (gvs.DataKeys[gvs.SelectedIndex].Value.ToString());
            txtlname.Text =
           ((Label)gvs.SelectedRow.FindControl("lbllname")).Text;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //create the jobid parameter
            cmd.Parameters.AddWithValue("@appid", txtappid.Text.Trim());
            //assign the parameter to the sql statement
            cmd.CommandText = "SELECT HK_Id, HK_dateregistered, HK_lastname, HK_firstname, HK_email, HK_application_status, HK_status FROM tblHK WHERE HK_Id=@appid ";
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                //retrieving FIELD values and assign the form controls
                txtappid.Text = dr["HK_Id"].ToString();
                txtappdate.Text = dr["HK_dateregistered"].ToString();
                txtlname.Text = dr["HK_lastname"].ToString();
                txtfname.Text = dr["HK_firstname"].ToString();
                txtemail.Text = dr["HK_email"].ToString();
                txtstats.Text = dr["HK_application_status"].ToString();
            }
            con.Close();
        }

        private void ResetAll()
        {
            txtappid.Text = "";
            txtappdate.Text = "";
            txtlname.Text = "";
            txtfname.Text = "";
            txtemail.Text = "";
            txtstats.Text = "";
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            //check whether the moviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtappdate.Text))
            {
                lblMsg.Text = "Please select record to update";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsUpdated = false;
            //get the movieid from the textbox
            int appid = Convert.ToInt32(txtappid.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update the job
            cmd.CommandText = " update tblHK set HK_dateregistered=@appdate, HK_lastname=@lname, HK_firstname=@fname, HK_email=@email, HK_application_status=@appstat FROM tblHK where HK_Id=@appid";

            //Create the parameterized queries
            cmd.Parameters.AddWithValue("@appid", txtappid.Text.Trim());

            DateTime dt = DateTime.Now;
            cmd.Parameters.AddWithValue("@appdate", dt);
            Console.WriteLine(dt.ToString());

            cmd.Parameters.AddWithValue("@lname", txtlname.Text.Trim());
            cmd.Parameters.AddWithValue("@fname", txtfname.Text.Trim());
            cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
            cmd.Parameters.AddWithValue("@appstat", txtstats.Text.Trim());
            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            sendemail();
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = txtlname.Text + " application updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindJobData()
                BindApplicant();
            }
            else
            {
                lblMsg.Text = "Error while updating job " + txtlname.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            ResetAll();
        }

        //Sending an email to notify and welcome housekeeper
        private void sendemail()
        {

            MailMessage m = new MailMessage();
            SmtpClient sc = new SmtpClient();
            try
            {
                m.From = new MailAddress("dchitapain@umail.utm.ac.mu");
                m.To.Add(txtemail.Text);
                m.Subject = "This is a Confirmation Mail";
                m.IsBodyHtml = true;
                StringBuilder msgBody = new StringBuilder();
                msgBody.Append("Dear " + txtlname.Text + ", your registration is successful, you have been invited to attend an interview. Check your email for further notice about day and time.");
                //m.Attachments.Add(new Attachment(Server.MapPath("~../img/")));
                msgBody.Append("<a href='http://" +
               HttpContext.Current.Request.Url.Authority + "~/login.aspx'>Click here to login to...</ a > ");

                m.Body = msgBody.ToString();
                sc.Host = "smtp.gmail.com";
                sc.Port = 587;
                sc.UseDefaultCredentials = false;
                sc.Credentials = new
                System.Net.NetworkCredential("dchitapain@umail.utm.ac.mu", "624kaz8g");
                sc.EnableSsl = true;
                sc.Send(m);
                Response.Write("Email Sent successfully");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

    }
}