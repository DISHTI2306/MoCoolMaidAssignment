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
    public partial class managejob : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["MocoolmaidCS"].ConnectionString;

        //private string selectedValue;
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
                    BindJobData();

                    //LoadHouseowner();
                    
                    BindCategory();
                    ListItem li = new ListItem("Select Category", "-1");
                    ddlcat.Items.Insert(0, li);

                    BindLocation();
                    ListItem list = new ListItem("Select Location", "-1");
                    ddlloc.Items.Insert(0, list);

                }
            }
        }

        private void BindJobData()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblJob WHERE HO_ID = @hoid";
            cmd.Parameters.AddWithValue("@hoid", Session["hoid"]);
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
        //private void LoadHouseowner()
        //{
        //    DataTable dt = new DataTable();
        //    using (SqlConnection con = new SqlConnection(_conString))
        //    {
        //        try
        //        {
        //            SqlDataAdapter da = new SqlDataAdapter("select HO_Id, HO_lastname from tblHO", _conString);

        //            da.Fill(dt);
        //            ddlho.DataSource = dt;
        //            ddlho.DataTextField = "HO_lastname";
        //            ddlho.DataValueField = "HO_Id";
        //            ddlho.DataBind();
        //        }
        //        catch (Exception ex)
        //        {
        //            Response.Write(ex.Message);
        //        }
        //    }
        //    ddlho.Items.Insert(0, new ListItem("Select Houseowner", "-1"));
        //}

        private void BindCategory()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT DISTINCT Category_Id, Category_Name FROM tblCategory ORDER BY Category_Id";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Create a DataTable
            DataTable dt = new DataTable();
            using (da)
            {
                //Populate the DataTable
                da.Fill(dt);
            }
            //Set the DataTable as the DataSource
            ddlcat.DataSource = dt;
            //assign the FIELD values to the dropdown
            ddlcat.DataTextField = "Category_Name";
            ddlcat.DataValueField = "Category_Id";
            ddlcat.DataBind();
        }

        private void BindLocation()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT DISTINCT Loc_Street, Loc_Id FROM tblLocation ORDER BY Loc_Id";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Create a DataTable
            DataTable dt = new DataTable();
            using (da)
            {
                //Populate the DataTable
                da.Fill(dt);
            }

            //Set the DataTable as the DataSource
            ddlloc.DataSource = dt;
            //assign the FIELD values to the dropdown
            ddlloc.DataTextField = "Loc_Street";
            ddlloc.DataValueField = "Loc_Id";
            ddlloc.DataBind();


        }



        protected void gvs_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtJobId.Text =
           (gvs.DataKeys[gvs.SelectedIndex].Value.ToString());
            txtjobtitle.Text =
           ((Label)gvs.SelectedRow.FindControl("lbljobtitle")).Text;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //create the jobid parameter
            cmd.Parameters.AddWithValue("@hoid", Session["hoid"]);
            cmd.Parameters.AddWithValue("@jid", txtJobId.Text);
            //assign the parameter to the sql statement
            cmd.CommandText = "SELECT DISTINCT Job_Id, HO_Id, Category_Id, Loc_Id, Title, Description, Salary, Date_posted, Deadline, Job_status FROM tblJob where HO_Id = @hoid";
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                //retrieving FIELD values and assign the form controls
                ddlcat.SelectedIndex = Convert.ToInt32(dr["Category_Id"]);
                ddlloc.SelectedIndex = Convert.ToInt32(dr["Loc_Id"]);
                //ddlho.SelectedIndex = Convert.ToInt32(dr["HO_Id"]);
                txtjobtitle.Text = dr["Title"].ToString();
                txtdesc.Text = dr["Description"].ToString();
                txtsalary.Text = dr["Salary"].ToString();
                txtdatep.Text = dr["Date_posted"].ToString();
                txtdeadline.Text = dr["Deadline"].ToString();
                chkstatus.Checked = (Boolean)dr["Job_status"];
            }
            con.Close();
            btnPostjob.Visible = false;
            btnupdate.Visible = true;
            btndelete.Visible = true;
            btncancel.Visible = true;
        }

        private void ResetAll()
        {
            btnPostjob.Visible = true;
            btncancel.Visible = false;
            btndelete.Visible = false;
            //ddlho.SelectedIndex = 0;
            ddlcat.SelectedIndex = 0;
            ddlloc.SelectedIndex = 0;
            txtjobtitle.Text = "";
            txtdesc.Text = "";
            txtsalary.Text = "";
            txtdatep.Text = "";
            txtdeadline.Text = "";
            chkstatus.Checked = false;
        }

        protected void btnPostjob_Click(object sender, EventArgs e)
        {
            Boolean IsAdded = false;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //add INSERT statement to add a new job
            cmd.CommandText = " insert into tblJob(HO_Id, Category_Id, Loc_Id, Title, Description, Salary, Date_posted, Deadline, Job_status)  values(@hoid, @cid, @location, @title, @desc, @salary, @datep, @deadline, @status)";

            //create Parameterized query to prevent sql injection by
            cmd.Parameters.AddWithValue("@title", txtjobtitle.Text.Trim());
            cmd.Parameters.AddWithValue("@desc", txtdesc.Text.Trim());
            cmd.Parameters.AddWithValue("@salary", txtsalary.Text.Trim());

            DateTime dt = DateTime.Now;
            cmd.Parameters.AddWithValue("@datep", dt);
            Console.WriteLine(dt.ToString());

            DateTime adddays = dt.AddDays(250);
            cmd.Parameters.AddWithValue("@deadline", adddays);
            Console.WriteLine(adddays.ToString());

            cmd.Parameters.AddWithValue("@status", chkstatus.Checked);
            //cmd.Parameters.AddWithValue("@hoid", ddlho.SelectedValue);
            cmd.Parameters.AddWithValue("@hoid", Session["hoid"]);
            cmd.Parameters.AddWithValue("@cid", ddlcat.SelectedValue);
            cmd.Parameters.AddWithValue("@location", ddlloc.SelectedValue);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute INSERT statement and return
            //Boolean true if number of records inserted is greater than zero
            IsAdded = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsAdded)
            {
                lblMsg.Text = txtjobtitle.Text + " Job added successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindJobData()
                BindJobData();
            }
            else
            {
                lblMsg.Text = "Error while adding job " + txtjobtitle.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            //check whether the moviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtjobtitle.Text))
            {
                lblMsg.Text = "Please select record to update";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsUpdated = false;
            //get the movieid from the textbox
            int jobid = Convert.ToInt32(txtJobId.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update the job
            cmd.CommandText = " update tblJob set Category_Id=@cid, Loc_Id=@location, Title=@title, Description=@desc, Salary=@salary, Job_status=@status where Job_Id=@jid";

            //Create the parameterized queries
            cmd.Parameters.AddWithValue("@cid", ddlcat.SelectedValue);
            cmd.Parameters.AddWithValue("@location", ddlloc.SelectedValue);
            cmd.Parameters.AddWithValue("@jid", txtJobId.Text.Trim());
            cmd.Parameters.AddWithValue("@title", txtjobtitle.Text.Trim());
            cmd.Parameters.AddWithValue("@desc", txtdesc.Text.Trim());
            cmd.Parameters.AddWithValue("@salary", txtsalary.Text.Trim());
            cmd.Parameters.AddWithValue("@status", chkstatus.Checked);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = txtjobtitle.Text + " Job updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindJobData()
                BindJobData();
            }
            else
            {
                lblMsg.Text = "Error while updating job " + txtjobtitle.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            //check whether the txtjobtitle textbox is empty
            if (string.IsNullOrWhiteSpace(txtjobtitle.Text))
            {
                lblMsg.Text = "Please select record to delete";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsDeleted = false;
            //get the jobid from the textbox
            int jobid = Convert.ToInt32(txtJobId.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add DELETE statement to delete the selected job
            cmd.CommandText = " delete from tblJob where Job_Id=@jid";

            //Create a parametererized query
            cmd.Parameters.AddWithValue("@jid", txtJobId.Text.Trim());
            cmd.Connection = con;
            con.Open();
            //use Command method to execute DELETE statement and return
            //Boolean True if number of records DELETED is greater than zero
            IsDeleted = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsDeleted)
            {
                lblMsg.Text = txtjobtitle.Text + " Job deleted successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindJobData()
                BindJobData();
            }
            else
            {
                lblMsg.Text = "Error while deleting job " + txtjobtitle.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }

        public static void RemoveDuplicateItems(DropDownList ddlloc)
        {

            for (int i = 0; i < ddlloc.Items.Count; i++)
            {
                ddlloc.SelectedIndex = i;
                string str = ddlloc.SelectedItem.ToString();
                for (int counter = i + 1; counter < ddlloc.Items.Count; counter++)
                {
                    ddlloc.SelectedIndex = counter;
                    string compareStr = ddlloc.SelectedItem.ToString();
                    if (str == compareStr)
                    {
                        ddlloc.Items.RemoveAt(counter);
                        counter = counter - 1;
                    }
                }
            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            ResetAll();
        }
        //protected void ddlho_DataBinding(object sender, EventArgs e)
        //{
        //    DropDownList ddlho = (DropDownList)sender;
        //    ddlho.DataBinding -= new EventHandler(ddlho_DataBinding);
        //    ddlho.AppendDataBoundItems = true;

        //    selectedValue = "";
        //    try
        //    {
        //        ddlho.DataBind();
        //    }
        //    catch (ArgumentOutOfRangeException)
        //    {
        //        ListItem lis = new ListItem("Select Houseowner", "-1");
        //        ddlho.Items.Insert(0, lis);
        //        ddlho.Items.Clear();
        //        ddlho.SelectedValue = "";
        //    }
        //}
    }

}
