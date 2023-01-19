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
    public partial class statistics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminuname"] == null)
            {
                Response.Redirect("~/home.aspx");
            }
            else
            {

                if (!IsPostBack)
                {
                    string query = "select Category_Id, Category_Name from tblCategory";
                    DataTable dt = GetData(query);
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "Category_Name";
                    ddlCategory.DataValueField = "Category_Id";
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("Select a category", "-1"));
                }
            }
        }

        private static DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string constr =
           WebConfigurationManager.ConnectionStrings["MocoolmaidCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
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

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            //add an SQL statement to search for moviename and
            //boxofficetotals as per category chosen from dropdown
            string query = string.Format("Select Category_Id, Title, Salary from tblJob where Category_Id={0}", ddlCategory.SelectedValue);
            DataTable dt = GetData(query);
            //Loop and add each datatable row to the Pie Chart Values
            foreach (DataRow row in dt.Rows)
            {
                PieChart1.PieChartValues.Add(new
               AjaxControlToolkit.PieChartValue
                {
                    Category = row["Title"].ToString(),
                    Data = Convert.ToDecimal(row["Salary"])
                });
            }
        }

    }
}