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
    public partial class jobapplication : System.Web.UI.Page
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

                lblServerTime.Text = DateTime.Now.ToString();

                if (!IsPostBack)
                {
                    LoadCategory();
                    TextBox1_TextChanged(TextBox1, null);
                }
            }
        }
        private void LoadCategory()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(_conString))
            {
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter("SELECT * from tblCategory", _conString);

                    da.Fill(dt);
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "Category_Name";
                    ddlCategory.DataValueField = "Category_Id";
                    ddlCategory.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
            ddlCategory.Items.Insert(0, new ListItem("Select Category", "-1"));
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            String CatIDs = ddlCategory.SelectedValue;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            //Call to select SQL command
            cmd.CommandType = CommandType.Text;
            String sqlParam = TextBox1.Text.Trim();
            String sqlParamCat = "";
            if (TextBox1.Text.Trim() != null)
                sqlParam = "and Title LIKE '%' + @title + '%'";
            if (CatIDs != "-1")
                sqlParamCat = "and tblJob.Category_Id = @CatID";
            cmd.CommandText = "SELECT Job_id, Title, Description, Salary FROM tblJob WHERE Job_status = 1 " 
            + sqlParam + sqlParamCat;
            cmd.Parameters.AddWithValue("@title", TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@CatID", CatIDs);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            using (da)
            {
                da.Fill(dt);
            }
            lvJob.DataSource = dt;
            lvJob.DataBind();
        }

        protected void lvJob_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvJob.FindControl("DataPager1") as
           DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            TextBox1_TextChanged(TextBox1, null);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Session["hkid"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            else
            {
                LinkButton btn = (LinkButton)sender;
                int x = Convert.ToInt32(btn.CommandArgument.ToString());
                if (chkexist(x))
                {

                    Label1.Text = "Housekeeper already applied for this job!!!";
                    Label1.ForeColor = System.Drawing.Color.Red;
                    btn.Text = "Job Already Applied";
                }
                else
                {
                    SqlConnection con = new SqlConnection(_conString);
                    SqlCommand cmd = new SqlCommand();
                    //add INSERT statement to apply for a job
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "insert into tblHKJob(Job_Id, HK_Id, Date_Applied, Status) Values (@jobid, @hkid, @dateapplied, @status)";
                    cmd.Parameters.AddWithValue("@hkid", Session["hkid"]);
                    cmd.Parameters.AddWithValue("@jobid", x);
                    cmd.Parameters.AddWithValue("@dateapplied", lblServerTime.Text);
                    cmd.Parameters.AddWithValue("@status", 1);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    btn.Text = "Job Applied";
                    Label1.Text = "Job Applied!";
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
            }

        }

        private Boolean chkexist(int x)
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //search for user
            cmd.CommandText = "select * from tblHkJob where Job_Id=@jobid and HK_Id = @hkid";
            cmd.Connection = con;
            //create a parameterized query
            cmd.Parameters.AddWithValue("@jobid", x);
            cmd.Parameters.AddWithValue("@hkid", Session["hkid"]);

            //Create DataReader
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            //Check if the housekeeper's job applied already exists in the table
            if (dr.HasRows)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

    }
    }
