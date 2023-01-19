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
    public partial class rating : System.Web.UI.Page
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

                int param = Convert.ToInt32(Request.QueryString["id"]);
                if (!IsPostBack)
                {

                    DataTable dt = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM tblRating where HK_Id = " + param.ToString());

                    Rating1.CurrentRating = Convert.ToInt32(dt.Rows[0]["AverageRating"]);
                    lblRatingStatus.Text = string.Format("{0} Houseowners have rated. Average Rating {1}",
                    dt.Rows[0]["RatingCount"], dt.Rows[0]["AverageRating"]);

                }

                using (SqlConnection con = new SqlConnection(_conString))
                {
                    // Create Command
                    SqlCommand cmd2 = new SqlCommand();
                    cmd2.Connection = con;
                    cmd2.CommandType = CommandType.Text;
                    cmd2.CommandText = "SELECT HK_Id, HK_firstname, HK_lastname, HK_email, HK_imageurl FROM tblHK where HK_Id=" + param;
                    //Create DataReader
                    SqlDataReader reader2;
                    con.Open();
                    reader2 = cmd2.ExecuteReader();

                    while (reader2.Read())
                    {
                        Image1.ImageUrl = "~../img/" + reader2["HK_imageurl"];
                        lbllname.Text = reader2["HK_lastname"].ToString();
                        lblfname.Text = reader2["HK_firstname"].ToString();
                        lblemail.Text = reader2["HK_email"].ToString();
                    }
                }
            }

        }

        private DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(_conString))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        }

        protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
        {
            System.Threading.Thread.Sleep(300);
            //Save e.Value to database. 
            e.CallbackResult = "success";
        }

        protected void Rating1_Click(object sender, AjaxControlToolkit.RatingEventArgs e)
        {
            int param = Convert.ToInt32(Request.QueryString["id"]);
            lblRatingStatus.Text = "sdsd";
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand("INSERT INTO tblRating (HO_Id, HK_Id, Rating) VALUES(@hoid, @hkid, @Rating)");
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@hoid", Session["hoid"]);
            cmd.Parameters.AddWithValue("@hkid", param.ToString());
            cmd.Parameters.AddWithValue("@Rating", e.Value);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }

}
