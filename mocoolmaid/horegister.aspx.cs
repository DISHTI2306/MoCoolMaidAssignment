using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Security.Cryptography;

namespace mocoolmaid
{
    public partial class horegister : System.Web.UI.Page
    {

        private string _conString =
         WebConfigurationManager.ConnectionStrings["MocoolmaidCS"]
        .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getLoc();
                ListItem li = new ListItem("Choose a location: ", "-1");
                ddlLoc.Items.Insert(0, li);
            }
        }

        public void getLoc()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT Loc_Id, Loc_Name FROM tblLocation";
            cmd.Connection = con;
            //Create DataAdapter
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Create a Datatable or a DataSet
            DataTable dt = new DataTable();
            //Fill the Dataset and ensure the DB Connection is closed
            using (da)
            {
                da.Fill(dt);
            }
            //To load country names in dropdown
            ddlLoc.DataSource = dt;
            //assign a field name and id to ddl
            ddlLoc.DataTextField = "Loc_Name";
            ddlLoc.DataValueField = "Loc_Id";
            ddlLoc.DataBind();
        }

        protected void btnregister_Click(object sender, EventArgs e)
        {

            string filen = "user.jpg";
            //Check whether the fileupload contains a file
            if (FileUpload1.HasFile)
            {
                if (CheckFileType(FileUpload1.FileName))
                {
                    filen = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/img/") +
                    filen);
                }

            }
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            //create a parameterized query for the username
            cmd.Parameters.AddWithValue("@houn", txthouname.Text);
            //search for username from tblho
            cmd.CommandText = "select  * from tblHO where HO_username=@houn";
            //Create DataReader
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            //Check if username already exists in the DB
            if (dr.HasRows)
            {
                lblmsg.Text = "Username Already Exist, Please Choose Another";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                txthouname.Focus();
            }
            else
            {

                //Ensure the DataReader is closed
                dr.Close();
                string strDate = txthodob.Text;

                //DateTime dt = Convert.ToDateTime(strDate);
                // Create another Command object for the insert statement
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = con;
                cmd1.CommandText = "INSERT INTO tblHO(HO_lastname, HO_firstname, HO_phonenumber, HO_mobilenumber, HO_email, HO_gender, HO_DOB, Loc_Id, HO_imageurl, HO_username, HO_pwd, HO_status) VALUES(@holastname, @hofirstname, @hophone, @homobile, @hoemail, @hogender, @hodob, @holocation, @hoimage, @houn, @hopass, @hostatus)";
                cmd1.Parameters.AddWithValue("@holastname", txtholname.Text.Trim());
                cmd1.Parameters.AddWithValue("@hofirstname", txthofname.Text.Trim());
                cmd1.Parameters.AddWithValue("@hophone", txthophone.Text.Trim());
                cmd1.Parameters.AddWithValue("@homobile", txthomobile.Text.Trim());
                cmd1.Parameters.AddWithValue("@hoemail", txthoemail.Text.Trim());
                cmd1.Parameters.AddWithValue("@hodob", strDate);
                cmd1.Parameters.AddWithValue("@hogender", lblhogender.Visible);
                //retrieve the country dropdown list value
                cmd1.Parameters.AddWithValue("@holocation", ddlLoc.SelectedValue);
                cmd1.Parameters.AddWithValue("@hoimage", filen);
                cmd1.Parameters.AddWithValue("@houn", txthouname.Text.Trim());
                //add a method to encrypt your password
                cmd1.Parameters.AddWithValue("@hopass", Encrypt(txthopassword.Text));
                //set the status to active or inactive
                cmd1.Parameters.AddWithValue("@hostatus", 1);
                cmd1.CommandType = CommandType.Text;
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Redirect("loginho.aspx");

                if (txtVerificationCode.Text.ToLower() == Session["CaptchaVerify"].ToString())
                {
                    lblCaptchaMessage.Text = "You have entered correct captch code";
                    lblCaptchaMessage.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("~/home.aspx");
                }
                else
                {
                    lblCaptchaMessage.Text = "Please enter correct captcha !";
                    lblCaptchaMessage.ForeColor = System.Drawing.Color.Red;
                }

            }
        }

        //check file format before uploading
        bool CheckFileType(string fileName)
        {
            string ext = Path.GetExtension(fileName);
            switch (ext.ToLower())
            {
                case ".gif":
                    return true;
                case ".png":
                    return true;
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                default:
                    return false;
            }
        }

        public string Encrypt(string clearText)
        {
            // defining encrytion key
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new
               byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    // encoding using key
                    using (CryptoStream cs = new CryptoStream(ms,
                   encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        protected void linkreset_Click(object sender, EventArgs e)
        {
            txtholname.Text = "";
            txthofname.Text = "";
            txthophone.Text = "";
            txthomobile.Text = "";
            txthoemail.Text = "";
            txthodob.Text = "";
            ddlLoc.SelectedIndex = 0;
            txthouname.Text = "";
            txthopassword.Text = "";
            txthoconfirm.Text = "";
        }

        
    }
    }
