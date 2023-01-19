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
using System.Net.Mail;

namespace mocoolmaid
{
    public partial class hkregister : System.Web.UI.Page
    {

        private string _conString =
        WebConfigurationManager.ConnectionStrings["MocoolmaidCS"]
       .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            rvDob.MinimumValue = DateTime.Now.AddYears(-60).ToShortDateString();
            rvDob.MaximumValue = DateTime.Now.AddYears(-18).ToShortDateString();
            rvDob.Type = ValidationDataType.Date;

            if (!Page.IsPostBack)
            {
                getLocation();
                ListItem li = new ListItem("Choose a location: ", "-1");
                ddlLocation.Items.Insert(0, li);
            }
        }

        public void getLocation()
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
            ddlLocation.DataSource = dt;
            //assign a field name and id to ddl
            ddlLocation.DataTextField = "Loc_Name";
            ddlLocation.DataValueField = "Loc_Id";
            ddlLocation.DataBind();
        }

        protected void txthkwork_TextChanged(object sender, EventArgs e)
        {
            int counter;
            counter = txthkwork.Text.Length;
            msg.InnerHtml = counter.ToString();
        }

        protected void chk1_CheckedChanged(object sender, EventArgs e)
        {
            if (chk1.Checked)
            {
                chk1.Checked = true;
            }
            else
            {
                chk2.Checked = false;
            }
        }

        protected void btnregister_Click(object sender, EventArgs e)
        {

            string filen = "user.jpg";
            string file = "user.jpg";
            string fil = "user.jpg";
            //Check whether the fileupload contains a file
            if (FileUpload1.HasFile)
            {
                if (CheckFileType(FileUpload1.FileName))
                {
                    filen = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/img/") +
                    filen);
                }
                if (FileUpload2.HasFile)
                {
                    if (CheckFileType(FileUpload2.FileName))
                    {
                        file = Path.GetFileName(FileUpload2.PostedFile.FileName);
                        FileUpload2.PostedFile.SaveAs(Server.MapPath("/img/") +
                        file);
                    }
                }

                if (FileUpload3.HasFile)
                {
                    if (CheckFileType(FileUpload3.FileName))
                    {
                        fil = Path.GetFileName(FileUpload3.PostedFile.FileName);
                        FileUpload3.PostedFile.SaveAs(Server.MapPath("/img/") +
                        fil);
                    }
                }

            }
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            //create a parameterized query for the username
            cmd.Parameters.AddWithValue("@hkun", txthkuname.Text);
            //search for username from tbluser
            cmd.CommandText = "select  * from tblHK where HK_username=@hkun";
            //Create DataReader
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            //Check if username already exists in the DB
            if (dr.HasRows)
            {
                lblmsg.Text = "Username Already Exist, Please Choose Another";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                txthkuname.Focus();
            }
            else
            {

                //Ensure the DataReader is closed
                dr.Close();
                string strDate = txthkdob.Text;

                //DateTime dt = Convert.ToDateTime(strDate);
                // Create another Command object for the insert statement
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = con;
                cmd1.CommandText = "INSERT INTO tblHK(HK_lastname, HK_firstname, HK_phonenumber, HK_mobilenumber, HK_email, HK_gender, HK_DOB, Loc_Id, HK_imageurl, HK_skill, HK_cv, HK_certificate, HK_experience, HK_username, HK_pwd, HK_dateregistered, HK_status) VALUES(@lastname, @firstname, @phone, @mobile, @email, @gender, @dob, @location, @image, @skill, @cv, @certificate, @exp, @hkun, @hkpwd, @date, @status)";
                cmd1.Parameters.AddWithValue("@lastname", txthklname.Text.Trim());
                cmd1.Parameters.AddWithValue("@firstname", txthkfname.Text.Trim());
                cmd1.Parameters.AddWithValue("@phone", txthkphone.Text.Trim());
                cmd1.Parameters.AddWithValue("@mobile", txthkmobile.Text.Trim());
                cmd1.Parameters.AddWithValue("@email", txthkemail.Text.Trim());
                cmd1.Parameters.AddWithValue("@dob", strDate);
                cmd1.Parameters.AddWithValue("@gender", lblhkgender.Visible);
                //retrieve the country dropdown list value
                cmd1.Parameters.AddWithValue("@location", ddlLocation.SelectedValue);
                cmd1.Parameters.AddWithValue("@image", filen);
                cmd1.Parameters.AddWithValue("@skill", txthkskill.Text.Trim());
                cmd1.Parameters.AddWithValue("@cv", file);
                cmd1.Parameters.AddWithValue("@certificate", fil);
                cmd1.Parameters.AddWithValue("@exp", txthkwork.Text.Trim());
                cmd1.Parameters.AddWithValue("@hkun", txthkuname.Text.Trim());
                //add a method to encrypt your password
                cmd1.Parameters.AddWithValue("@hkpwd", Encrypt(txthkpassword.Text));
                DateTime dt = DateTime.Now;
                cmd1.Parameters.AddWithValue("@date", dt);
                Console.WriteLine(dt.ToString());
                //set the status to active or inactive
                cmd1.Parameters.AddWithValue("@status", 1);
                cmd1.CommandType = CommandType.Text;
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Redirect("login.aspx");

                if (txtVerificationCode.Text.ToLower() == Session["CaptchaVerify"].ToString())
                {
                    lblCaptchaMessage.Text = "You have entered correct captch code";
                    lblCaptchaMessage.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("home.aspx");
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
            txthklname.Text = "";
            txthkfname.Text = "";
            txthkphone.Text = "";
            txthkmobile.Text = "";
            txthkemail.Text = "";
            txthkdob.Text = "";
            ddlLocation.SelectedIndex = 0;
            txthkskill.Text = "";
            txthkwork.Text = "";
            txthkuname.Text = "";
            txthkpassword.Text = "";
            txthkconfirm.Text = "";
            txtdatereg.Text = "";
        }
    }
}
