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
    public partial class mocoolmaid : System.Web.UI.MasterPage
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["MocoolmaidCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //verify if session housekeeper is not null
            if (Session["hkuname"] != null)
            {
                pnllog.Style.Add("visibility", "hidden");
                Page.Controls.Remove(pnllog);
                pnlregister.Style.Add("visibility", "hidden");
                Page.Controls.Remove(pnlregister);
                lgregis.CssClass = "nav navbar-nav navbar-right";
                lgreg.CssClass = "nav navbar-nav navbar-right";
                lbllgged.CssClass = "btn btn-outline-success text-black";
                //add the session name
                lbllgged.Text = "Welcome " + Session["hkuname"];
                btnlgout.Visible = true;
                pnlhkprofile.Visible = true;
            }

            if (Session["houname"] != null)
            {
                pnllog.Style.Add("visibility", "hidden");
                Page.Controls.Remove(pnllog);
                pnlregister.Style.Add("visibility", "hidden");
                Page.Controls.Remove(pnlregister);
                lgregis.CssClass = "nav navbar-nav navbar-right";
                lgreg.CssClass = "nav navbar-nav navbar-right";
                lbllgged.CssClass = "btn btn-outline-success text-black";
                //add the session name
                lbllgged.Text = "Welcome " + Session["houname"];
                btnlgout.Visible = true;
                pnlhoprofile.Visible = true;
            }

            if (Session["adminuname"] != null)
            {
                pnllog.Style.Add("visibility", "hidden");
                Page.Controls.Remove(pnllog);
                pnlregister.Style.Add("visibility", "hidden");
                Page.Controls.Remove(pnlregister);
                lgregis.CssClass = "nav navbar-nav navbar-right";
                lgreg.CssClass = "nav navbar-nav navbar-right";
                lbllgged.CssClass = "btn btn-outline-success text-black";
                //add the session name
                lbllgged.Text = "Welcome " + Session["adminuname"];
                btnlgout.Visible = true;
                pnlstats.Visible = true;
            }

        }

        void lgout()
        {
            if (Session["houname"] != null || Session["hkuname"] != null || Session["adminuname"] != null)
            {
                //Remove all session
                Session.RemoveAll();
                //Destroy all Session objects
                Session.Abandon();
                //Redirect to homepage or login page
                Response.Redirect("~/home.aspx");
            }
        }

        protected void btnlgout_Click(object sender, EventArgs e)
        {
            lgout();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //get the value of username and password fields and state of checkbox from
            //admin login form
            string adusername = ucadminlogin.Username;
            string adpassword = ucadminlogin.Password;
            bool adchk = ucadminlogin.Chk;

            SqlConnection con = new SqlConnection(_conString);

            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;

            //searching for a recod containing matching username & password with
            //an active status
            cmd.CommandText = "select * from tblAdmin WHERE Admin_Username=@adun and Admin_Password=@adpass and Admin_Status=1";

            //create two parameterized query for the above select statement
            //use above variables
            cmd.Parameters.AddWithValue("@adun", adusername);
            cmd.Parameters.AddWithValue("@adpass", adpassword);

            //Create DataReader
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();

            // check if the DataReader contains a record
            if (dr.HasRows)
            {
                if (dr.Read())
                {
                    //create a memory cookie to store username and pwd


                    if (adchk)
                    {
                        //if checkbox is checked, make cookies persistent


                    }
                    else
                    {
                        //delete the cookies if checkbox is unchecked
                        //delete content of password field


                    }
                    //create and save adminuname in a session variable
                    Session["adminuname"] = adusername;

                    //create and save adminid in a session variable
                    Session["adminid"] = dr["Admin_Id"].ToString();

                    //redirect to the dashboard page
                    Response.Redirect("~/home.aspx");
                }
                con.Close();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop",
"adminModal();", true);

                //delete content of password field
                lblmsg.Style.Add("margin-left", "10%");
                lblmsg.ForeColor = System.Drawing.Color.Red;
                adusername = "";
                adpassword = "";
                lblmsg.Text = "You are not registered or your account has been suspended!";
            }
        }

        
    }
}
