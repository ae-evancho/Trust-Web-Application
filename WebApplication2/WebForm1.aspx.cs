using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        public void gridBind()
        {
            DataTable dt = new DataTable();
            SqlConnection myconnect = new SqlConnection("Server=localhost;" + "Trusted_Connection=true;" + "Database=mybase");
            try
            {
                myconnect.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            try
            {
                SqlCommand mycomm = new SqlCommand();
                mycomm.Connection = myconnect;
                mycomm.CommandText = "select * from PROFIL where STATUT = 1";
                SqlDataAdapter sqm = new SqlDataAdapter(mycomm);
                sqm.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            try
            {
                myconnect.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            this.gridBind();
        }

        protected void onPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.gridBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Server=localhost;" + "Trusted_Connection=true;" + "Database=mybase";
            
            con.Open();
            SqlCommand comm = new SqlCommand();
            comm.Connection = con;
            string str = TextBox1.Text;
            int a = Int32.Parse(TextBox3.Text);
            if (str == "" || TextBox3.Text == "")
            {
                Response.Write("<script>alert('case nom ou id vide')</script>");
            }
            else
            {
                comm.CommandText = "update PROFIL set NOM_PROFIL=@nom, DATE_MODIF=@date where ID_PROFIL=@id";
                comm.Parameters.AddWithValue("@nom", str);
                comm.Parameters.AddWithValue("@date", DateTime.Now);
                comm.Parameters.AddWithValue("@id", a);
                comm.ExecuteNonQuery();
            

                con.Close();
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Server=localhost;" + "Trusted_Connection=true;" + "Database=mybase";
            con.Open();

            SqlCommand comm = new SqlCommand();
            comm.Connection = con;
            string coll = TextBox2.Text;
            string tab = TextBox1.Text;
            comm.CommandText = "alter table "+tab+" drop column "+coll;
           
            comm.ExecuteNonQuery();
            con.Close();
        }

        protected void Button4_Click(object sender,  EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Server=localhost;" + "Trusted_Connection=true;" + "Database=mybase";
            con.Open();
            SqlCommand comm = new SqlCommand();
            comm.Connection = con;
            string str=TextBox1.Text;
            if (str == "")
            {
                Response.Write("<script>alert('case nom vide')</script>");
            }
            else
            {
                comm.CommandText = "select max(ID_PROFIL) from PROFIL";
                SqlDataReader read = comm.ExecuteReader();
                if (read.Read())
                {
                    int a = read.GetInt32(0);
                    read.Close();
                    comm.CommandText = @"insert into PROFIL (ID_PROFIL, NOM_PROFIL , DATE_CREAT, STATUT, MAT_USER_CREAT) 
                                 Values (@id,@nom,@date,@st,@mat)";
                    comm.Parameters.AddWithValue("@id", a + 1);
                    comm.Parameters.AddWithValue("@nom", TextBox1.Text);
                    comm.Parameters.AddWithValue("@date", DateTime.Now);
                    comm.Parameters.AddWithValue("@st", 1);
                    comm.Parameters.AddWithValue("@mat", 125);

                    comm.ExecuteNonQuery();
                }
            }

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Server=localhost;" + "Trusted_Connection=true;" + "Database=mybase";
            con.Open();
            SqlCommand comm = new SqlCommand();
            comm.Connection = con;
            string str= TextBox3.Text;
            if (str == "")
            {
                Response.Write("<script>alert('case id vide')</script>");
            }
            else
            {
                comm.CommandText = "update PROFIL set STATUT = 0 where ID_PROFIL=" + str;
                comm.ExecuteNonQuery();
                con.Close();
            }
        }
      
    }
}