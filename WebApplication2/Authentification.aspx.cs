using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Server = localhost;" + "Trusted_Connection = true;" + "Database = mybase"))
            {
                con.Open();
                SqlCommand comm = new SqlCommand(); 
                comm.Connection = con;
                string ut = TextBox1.Text;
                string pass = TextBox2.Text;

                comm.CommandText = "select * from Utilisateurs where nom_utilisateur = '"+ut+"' and mot_de_pass = '"+pass+"'";
                SqlDataReader r = comm.ExecuteReader();
                if (r.Read()) Response.Redirect("PageAcceuil.aspx");
                else Response.Write("<script>alert('Nom Utilisateur ou Mot de Pass erroné')</script>");
            }
        }
    }
}