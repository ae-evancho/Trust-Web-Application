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
    public partial class WebForm3 : System.Web.UI.Page
    {
        String cond = "where STATUT = 1";
        protected void Page_Load(object sender, EventArgs e)
        {
 
            if (GetPostBackControl(this) == GridView1) gridBind(cond); 

            if (!IsPostBack)
            {
                Tab1.CssClass = "Clicked";
                MainView.ActiveViewIndex = 0;

                STRCT.Items.Add((new ListItem("::: Choisissez Une Structure :::", "0")));
                using (SqlConnection con = new SqlConnection("Server=localhost;" + "Trusted_Connection=true;" + "Database=mybase" ))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("select * from structure_tba ", con)) 
                    {
                        SqlDataReader rdr = cmd.ExecuteReader();
                        while (rdr.Read())
                        {
                            string str = rdr.GetString(0);
                            string str1=rdr.GetString(0).PadRight(8, '\u00A0');
                            string str2 = rdr.GetString(1);
                            String text = String.Format("{0}|{1}\n", str1, str2);

                             STRCT.Items.Add(new ListItem(text,str)); 
                         }
                    }
                }
            }

        }
        public void gridBind(String cond)
        {
            DataTable dt = new DataTable();
            SqlConnection myconnect = new SqlConnection("Server=localhost;" + "Trusted_Connection=true;" + "Database=mybase");
            try
            {
                myconnect.Open();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

            try
            {
                SqlCommand mycomm = new SqlCommand();
                mycomm.Connection = myconnect;
                mycomm.CommandText = "select * from PROFIL "+cond;
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
                Console.Write(ex.ToString());
            }


            try
            {
                myconnect.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

        }
        
        protected void onPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.gridBind(cond);
        }
        
        protected void GD1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells[5].Text == "True") e.Row.Cells[5].Text = "Actif";
            else if (e.Row.Cells[5].Text == "False") e.Row.Cells[5].Text = "Bloqué";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.gridBind(cond);
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
            

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Server=localhost;" + "Trusted_Connection=true;" + "Database=mybase";
            con.Open();
            SqlCommand comm = new SqlCommand();
            comm.Connection = con;
            string str = TextBox1.Text;
             
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
                    comm.CommandText = @"insert into PROFIL (ID_PROFIL, NOM_PROFIL , DATE_CREAT, STATUT, MAT_USER_CREAT, ID_STR) 
                                 Values (@id,@nom,@date,@st,@mat,@str)";
                    comm.Parameters.AddWithValue("@id", a + 1);
                    comm.Parameters.AddWithValue("@nom", TextBox1.Text);
                    comm.Parameters.AddWithValue("@date", DateTime.Now);
                    comm.Parameters.AddWithValue("@st", 1);
                    comm.Parameters.AddWithValue("@mat", 125);
                    comm.Parameters.AddWithValue("@str", STRCT.Text);
                    comm.ExecuteNonQuery();

                }
            }

        }

       

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AppendHeader("content-disposition", "attachment; filename=Profil.xls");
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

        public static Control GetPostBackControl(Page page)
        {
            Control control = null;

            string ctrlname = page.Request.Params.Get("__EVENTTARGET");
            if (ctrlname != null && ctrlname != string.Empty)
            {
                control = page.FindControl(ctrlname);
            }
            else
            {
                foreach (string ctl in page.Request.Form)
                {
                    Control c = page.FindControl(ctl);
                    if (c is System.Web.UI.WebControls.Button)
                    {
                        control = c;
                        break;
                    }
                }
            }
            return control;
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

     
        protected void ButSupp(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Server=localhost;" + "Trusted_Connection=true;" + "Database=mybase";
            con.Open();
            SqlCommand comm = new SqlCommand();
            comm.Connection = con;

            string str = GridView1.DataKeys[e.RowIndex].Value.ToString();
            if (str == "")
            {
                Response.Write("<script>alert('erreur')</script>");
            }
            else
            {
                comm.CommandText = "update PROFIL set STATUT = 0 where ID_PROFIL=" + str;
                try
                {
                    comm.ExecuteNonQuery();
                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                this.gridBind(cond);
            }
        }
        
        protected void ButMod(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.gridBind(cond);
        }

        protected void ButAnn(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1; 
            this.gridBind(cond);
        }
        protected void ButMaj(object sender, GridViewUpdateEventArgs e)
        {
           
           using (SqlConnection con = new SqlConnection("Server=localhost;" + "Trusted_Connection=true;" + "Database=mybase"))
            {
                GridViewRow b = GridView1.Rows[e.RowIndex];
                DropDownList dl = b.Cells[1].Controls[1] as DropDownList;
                TextBox tb = b.Cells[2].Controls[0] as TextBox;
                string str1 = dl.SelectedItem.Value;
                string str2 = tb.Text;
                string str3 = b.Cells[0].Text;

                con.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = con;
                    
                    comm.CommandText = "update PROFIL set NOM_PROFIL=@nom, DATE_MODIF=@date, ID_STR=@str where ID_PROFIL=@id";
                    comm.Parameters.AddWithValue("@nom", str2);
                    comm.Parameters.AddWithValue("@date", DateTime.Now);
                    comm.Parameters.AddWithValue("@id", str3);
                    comm.Parameters.AddWithValue("@str", str1);
                    comm.ExecuteNonQuery();

                
            }
            
            
            GridView1.EditIndex = -1;
            this.gridBind(cond);
        }

        protected void STRCT_SelectedIndexChanged(object sender, EventArgs e)
        {
             using (SqlConnection con = new SqlConnection("Server = localhost;" + "Trusted_Connection = true;" + "Database = mybase"))
             {
                con.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = con;
                string id = STRCT.Text;
                comm.CommandText = "select nom_fonct from fonction where  id_str = '" + id + "'";
                SqlDataReader r = comm.ExecuteReader();
                GridView2.DataSource = r;
                GridView2.DataBind();
                r.Close();
             }
             GridView2.HeaderRow.Cells[0].Text = "Fonctions De La Structure";
        }
         

      
        


       
    }
}