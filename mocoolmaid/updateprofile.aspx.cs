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
    public partial class updateprofile : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["MocoolmaidCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //else grant access to the page and display username
            if (Session["hkuname"] == null)
            {
                Response.Redirect("~/home.aspx");
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    //checks whether the session variable has been created
                    //from the login page and if null redirect to login page
                    //else grant access to the page and display username
                    // Create Connection

                    SqlConnection con = new SqlConnection(_conString);
                    // Create Command
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    //To replace the txtusername.Text by the session variable
                    cmd.CommandText = "SELECT HK_Id, HK_firstname, HK_lastname, HK_phonenumber, HK_email, HK_pwd, HK_imageurl FROM tblHK WHERE HK_username= @hkun";

                    cmd.Parameters.AddWithValue("@hkun", Session["hkuname"]);
                    con.Open();

                    //Create DataReader
                    SqlDataReader reader;

                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        //retrieve the values using the reader[“fieldname”] and
                        //store in corresponding Textboxes
                        txtFname.Text = reader["HK_firstname"].ToString();
                        txtLname.Text = reader["HK_lastname"].ToString();
                        txthkphone.Text = reader["HK_phonenumber"].ToString();
                        txtEmail.Text = reader["HK_email"].ToString();
                        txthkpassword.Text = reader["HK_pwd"].ToString();
                    }
                    reader.Close();
                    //create a dataadapter
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    //create a datatable
                    DataTable dt = new DataTable();
                    //populate the datatable
                    using (da)
                    {
                        da.Fill(dt);
                    }
                    //bind the datatable to the repeater control
                    rptimg.DataSource = dt;
                    rptimg.DataBind();
                    con.Close();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string updateSQL;
            updateSQL = "UPDATE tblHK SET HK_firstname=@fname, HK_lastname = @lname, HK_phonenumber = @phone, HK_email = @email, HK_pwd = @hkpwd WHERE HK_username = @hkun";
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = updateSQL;
            cmd.Connection = con;
            //Create a parameter for the Session username
            cmd.Parameters.AddWithValue("@hkun", Session["hkuname"]);
            // Add the 3 parameters for firstname, lastname and email 
            cmd.Parameters.AddWithValue("@fname", txtFname.Text.Trim());
            cmd.Parameters.AddWithValue("@lname", txtLname.Text.Trim());
            cmd.Parameters.AddWithValue("@phone", txthkphone.Text.Trim());
            cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@hkpwd", Encrypt(txthkpassword.Text.Trim()));
            int updated = 0;
            //Add a “try – catch” block to handle any exceptions thrown during
            //program execution and displays the error Message if any
            try
            {
                con.Open();
                updated = cmd.ExecuteNonQuery();
                lblmsg.Text = updated.ToString() + " record updated. ";
            }
            catch (Exception err)
            {
                lblmsg.Text = "Error updating. " + err.Message;
                con.Close();
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

    }

}
