using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication2
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string user = Text1.Value;
            string pass = Password1.Value;
            using (SqlConnection con = new SqlConnection("Server = localhost;" + "Trusted_Connection = true;" + "Database = mybase"))
            {
                con.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = con;
                comm.CommandText = "select * from Utilisateurs where nom_utilisateur = '" + user + "' and mot_de_pass = '" + pass + "'";
                SqlDataReader r = comm.ExecuteReader();
                if (r.Read())
                {
                    Response.Redirect("WebForm2.aspx");
                }
                else
                {
                    Label1.Visible = true;
                    Text1.Value = null;
                }
            }
          }

       
    }
}