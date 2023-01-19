using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace mocoolmaid.App_Code
{

    public class DataAccessLayer
    {

        private readonly string _conString;
        public DataAccessLayer()
        {
            _conString =
            WebConfigurationManager.ConnectionStrings["MoviesCS"].ConnectionString;
        }

    }
}