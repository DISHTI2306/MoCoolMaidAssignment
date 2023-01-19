using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using Newtonsoft.Json;
using System.Net;

namespace mocoolmaid
{
    public partial class loginho : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["MocoolmaidCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Verify if uname and pw cookies are not null
                if (Response.Cookies["HO_username"] != null && Response.Cookies["HO_pwd"] != null)
                {
                    //Populate the Username and Password Textboxes by retrieving the values from
                    //the cookies
                    uchologin.Username = Request.Cookies["HO_username"].Value;
                    uchologin.Password = Request.Cookies["HO_pwd"].Value;
                }
            }
        }

        public string Encrypt(string cipherText)
        {
            // defining encrytion key
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey,
               new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
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
                    cipherText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return cipherText;
        }

        protected void btnLogin1_Click(object sender, EventArgs e)
        {
            //get the value of username, password fields and state of checkbox from login
            //form
            string husername = uchologin.Username;
            string hpassword = uchologin.Password;
            bool hchk = uchologin.Chk;

            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //searching for a record containing matching username & password with
            //an active status
            cmd.CommandText = "select * from tblHO where HO_username=@houn and HO_pwd=@hopass and HO_status=1";

            //create two parameterized query for the above select statement
            //use above variables and encrypt password
            cmd.Parameters.AddWithValue("@houn", husername);
            cmd.Parameters.AddWithValue("@hopass", Encrypt(hpassword));

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
                    Response.Cookies["HO_username"].Value = husername;
                    Response.Cookies["HO_pwd"].Value = hpassword;

                    if (hchk)
                    {
                        //if checkbox is checked, make cookies persistent
                        Response.Cookies["HO_username"].Expires = DateTime.Now.AddDays(100);
                        Response.Cookies["HO_pwd"].Expires = DateTime.Now.AddDays(100);
                    }
                    else
                    {
                        //delete the cookies if checkbox is unchecked
                        //delete content of password field
                        Response.Cookies["HO_username"].Expires = DateTime.Now.AddDays(-100);
                        Response.Cookies["HO_pwd"].Expires = DateTime.Now.AddDays(-100);
                    }
                    //check if role type is admin or user - optional
                    //create and save username in a session variable
                    Session["houname"] = husername;

                    //create and save userid in a session variable
                    Session["hoid"] = dr["Ho_Id"].ToString();

                    //redirect to the corresponding page
                    Response.Redirect("~/home.aspx");
                }
                con.Close();
            }
            else
            {
                //delete content of password field

                lblmsg1.Text = "You are not registered or your account has been suspended!";
            }

        }

    }
}