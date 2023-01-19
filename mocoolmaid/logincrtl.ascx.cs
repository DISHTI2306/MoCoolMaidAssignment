using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mocoolmaid
{
    public partial class logincrtl : System.Web.UI.UserControl
    {

        public string Username
        {
            get { return txtUsername.Text; }
            set { txtUsername.Text = value; }
        }
        public string Password
        {
            get { return txtPassword.Text; }
            set { txtPassword.Attributes["value"] = value; }
        }
        public bool Chk
        {
            get { return chkremem.Checked; }
            set { chkremem.Checked = value; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}