using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace WebApplication2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        String cond = "where STATUT = 1";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.Items.Insert(0, new ListItem("--Choisissez un rubrique --", "0"));
                DropDownList1.AppendDataBoundItems = true;
                SqlConnection con = new SqlConnection("Server=localhost;" + "Trusted_Connection=true;" + "Database=mybase");
                SqlCommand comm = new SqlCommand();
                con.Open();
                comm.Connection = con;
                comm.CommandText = "select NOM_RUBRIQUE, ID_RUBRIQUE from RUBRIQUE";
                DropDownList1.DataSource = comm.ExecuteReader();
                DropDownList1.DataBind();
                con.Close();
   
            }
        }
        protected void onPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.gridBind(this.cond);
        }
        protected void GD1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells[4].Text == "True") e.Row.Cells[4].Text = "Actif";
            else if (e.Row.Cells[4].Text == "False") e.Row.Cells[4].Text = "Bloqué";
        }
        protected void gridBind(string str)
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
                mycomm.CommandText = "select * from ETAT "+str;
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
            Button5.Visible = true;
            this.gridBind(this.cond);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Server=localhost;" + "Trusted_Connection=true;" + "Database=mybase";

            con.Open();
            SqlCommand comm = new SqlCommand();
            SqlCommand comm2 = new SqlCommand();
            SqlCommand comm3 = new SqlCommand();
            comm.Connection = con;
            comm2.Connection = con;
            comm3.Connection = con;
            string str = TextBox1.Text;
            
            if (str == "" || TextBox2.Text == "")
            {
                Response.Write("<script>alert('case nom ou id vide')</script>");
            }
            else
            {
                int a = Int32.Parse(TextBox2.Text);
                comm2.CommandText = "select NOM_ETAT from ETAT where ID_ETAT=@id ";
                comm2.Parameters.AddWithValue("@id", a);
                SqlDataReader r= comm2.ExecuteReader();
                if (r.Read())
                {
                   string str2= r[0].ToString();
                    comm.CommandText = "update ETAT set NOM_ETAT=@nom, DATE_MODIF=@date where ID_ETAT=@id";
                    comm3.CommandText = "sp_rename 'WebUser."+str2+"' , '"+str+"', 'column'   ";
                    comm.Parameters.AddWithValue("@nom", str);
                    comm.Parameters.AddWithValue("@date", DateTime.Now);
                    comm.Parameters.AddWithValue("@id", a);
                    
                    r.Close();
                    comm.ExecuteNonQuery();
                    comm3.ExecuteNonQuery();
                    
                }
                else Response.Write("<script>alert('id non existante')</script>");
            }
            con.Close();
            Button5.Visible = false;

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Server=localhost;" + "Trusted_Connection=true;" + "Database=mybase";
            con.Open();
            SqlCommand comm = new SqlCommand();
            SqlCommand comm2 = new SqlCommand();
            SqlCommand comm3 = new SqlCommand();
            SqlCommand comm4 = new SqlCommand();
            comm.Connection = con;
            comm2.Connection = con;
            comm3.Connection = con;
            comm4.Connection = con;

            string str = TextBox1.Text;
            if (str == "")
            {
                Response.Write("<script>alert('case nom vide')</script>");
            }
            else if (DropDownList1.Text == "0")
            {
                Response.Write("<script>alert('veuillez choisir un rubrique')</script>");

            }
            else 
            {
            
               comm.CommandText = "select max(ID_ETAT) from ETAT";
               SqlDataReader read = comm.ExecuteReader();
               if (read.Read())
              {
                  int a = read.GetInt32(0);
                  read.Close();
                  comm.CommandText = @"
                                 insert into ETAT (ID_ETAT, NOM_ETAT , DATE_CREAT, STATUT, MAT_USER_CREAT, ID_RUBRIQUE) 
                                 Values (@id,@nom,@date,@st,@mat,@rub)";

                  comm.Parameters.AddWithValue("@id", a + 1);
                  comm.Parameters.AddWithValue("@nom", str);
                  comm.Parameters.AddWithValue("@date", DateTime.Now);
                  comm.Parameters.AddWithValue("@st", 1);
                  comm.Parameters.AddWithValue("@mat", 125);
                  comm.Parameters.AddWithValue("@rub", DropDownList1.Text);
                  
                  comm2.CommandText = "alter table WebUser add " + str + " bit";
                  comm3.CommandText = "update WebUser set " + str + "= 0";
                  comm4.CommandText = "alter table WebUser alter column " + str + " bit not null";

                  comm.ExecuteNonQuery();
                  comm2.ExecuteNonQuery();
                  comm3.ExecuteNonQuery();
                  comm4.ExecuteNonQuery();
                  


              }
            }
            con.Close();
            Button5.Visible = false;

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Server=localhost;" + "Trusted_Connection=true;" + "Database=mybase";
            con.Open();
            SqlCommand comm = new SqlCommand();
            comm.Connection = con;
            
            string str = TextBox2.Text;
            if (str == "")
            {
                Response.Write("<script>alert('case id vide')</script>");
            }
            else
            {
                comm.CommandText = "select NOM_ETAT from ETAT where ID_ETAT=@id";
                comm.Parameters.AddWithValue("@id", str);
                SqlDataReader r = comm.ExecuteReader();
                if (r.Read())
                {
                    string s = r[0].ToString();
                    HiddenField1.Value = s;
                    r.Close();
                    comm.CommandText = " select " + s + " from WebUser where " + s + "=1";
                    try
                    {
                        SqlDataReader read = comm.ExecuteReader();
                        if (read.Read())
                        {
                            Button6.Visible = true;
                            Button7.Visible = true;
                            Panel1.Visible = true;
                            read.Close();

                        }
                        else del();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.ToString());
                    }
                    
                }
                else Response.Write("<script>alert('id non existante')</script>");

            }
            Button5.Visible = false;

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AppendHeader("content-disposition", "attachment; filename=Etat.xls");
            Response.ContentType = "application/excel";
            
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            Response.ContentEncoding = System.Text.Encoding.Default;
            GridView1.AllowPaging = false;
            this.gridBind("");
            

            GridView1.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
        }

        public void Button7_Click(object sender, EventArgs e)
        {
            Button6.Visible = false;
            Button7.Visible = false;
            Panel1.Visible = false;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Button6.Visible = false;
            Button7.Visible = false;
            Panel1.Visible = false;
            del();
        }
        protected void del()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Server=localhost;" + "Trusted_Connection=true;" + "Database=mybase";
            con.Open();
            SqlCommand comm = new SqlCommand();
            SqlCommand comm2 = new SqlCommand();
            comm.Connection = con;
            comm2.Connection = con;
            string str = TextBox2.Text;
            string s = HiddenField1.Value;
            comm.CommandText = "alter table WebUser drop column " + s;
            comm2.CommandText = "update ETAT set STATUT = 0 where ID_ETAT=@id";
            comm2.Parameters.AddWithValue("@id", str);
            try
            {
                comm.ExecuteNonQuery();
                comm2.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void Tab1_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Clicked";
            Tab2.CssClass = "Initial";
            MainView.ActiveViewIndex = 0;
        }

        protected void Tab2_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Clicked";
            MainView.ActiveViewIndex = 1;

        }


    }
}