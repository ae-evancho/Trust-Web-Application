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
    public partial class WebForm4 : System.Web.UI.Page
    {
        List<int> oldV;
        List<int> newV;
        int size;
 
        protected void Page_Load(object sender, EventArgs e)
        {

           
            if (!IsPostBack)
            {

                STRCT.Items.Insert(0, new ListItem("--Choisissez une structure --", "0"));
                DropDownList1.Items.Insert(0, new ListItem("--Choisissez un Profil --", "0"));
                DropDownList1.Visible = false;
                STRCT.AppendDataBoundItems = true;

                using (SqlConnection con = new SqlConnection("Server = localhost;" + "Trusted_Connection = true;" + "Database = mybase"))
                {
                    con.Open();
                    SqlCommand comm = new SqlCommand(); SqlCommand comm2 = new SqlCommand(); SqlCommand comm3 = new SqlCommand();
                    comm.Connection = con; comm2.Connection = con; comm3.Connection = con;
                    comm.CommandText = "select * from PROFIL where STATUT = 1";
                    SqlDataReader r = comm.ExecuteReader();
                   
                    
 
                    r.Close();
                    comm2.CommandText = "select * from structure_tba";
                    r=comm2.ExecuteReader();
                    STRCT.DataSource=r;
                    STRCT.DataBind();
                    r.Close();
                  
                }
            }
            if (GetPostBackControl(this) != DropDownList1 && GetPostBackControl(this) != STRCT && this.IsPostBack) dynCBL();
            
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

          newV= new List<int>();
          bool b;
          string st = DropDownList1.Text;
          List<int> nb = new List<int>();

          if (st == "0") { Response.Write("<script>alert('Veuillez Choisir Un Profil')</script>"); }

          else
          {
            for (int i = 1; i < size + 1; i++)
              {
                  string txtID = "txt" + i.ToString();
                  CheckBoxList txt = (CheckBoxList)FindControl(txtID);
                  for (int j = 0; j < txt.Items.Count; j++)
                  {
                      if (txt.Items[j].Selected)
                      {
                          newV.Add(Convert.ToInt32(txt.Items[j].Value));
                      }
                  }
              }

              using (SqlConnection con = new SqlConnection("Server = localhost;" + "Trusted_Connection = true;" + "Database = mybase"))
              {
                  con.Open();
                  SqlCommand comm = new SqlCommand();
                  comm.Connection = con;
                  string nxt = "";
                 
                  //AJOUT
                  
                  
                  
                  for (int i = 0; i < newV.Count; i++)
                  {
                      b = true;
                      for (int j = 0; j < oldV.Count; j++)
                      {
                          if (newV[i] == oldV[j]) { b = false; break; }
                      }

                      if (b) nb.Add(newV[i]);
                  }

                  if (nb.Count != 0)
                  {
                      for (int i = 0; i < nb.Count - 1; i++)
                      {
                          nxt = nxt + "(" + st + "," + nb[i] + "),";
                      }
                      nxt = nxt + "(" + st + "," + nb[nb.Count - 1] + ")";

                      comm.CommandText = @"insert into ETAT_PROFIL (ID_PROFIL, ID_ETAT)
                                     values " + nxt;

                      try
                      {
                          comm.ExecuteNonQuery();
                      }
                      catch (Exception ex)
                      {
                          Response.Write(ex.ToString());
                      }
                  }

                  //SUPRESSION


                  nb.Clear();
                  for (int i = 0; i < oldV.Count; i++)
                  {
                      b = true;
                      for (int j = 0; j < newV.Count; j++)
                      {
                          if (newV[j] == oldV[i]) { b = false; break; }
                      }

                      if (b) nb.Add(oldV[i]);
                  }
                  if (nb.Count != 0)
                  {
                      nxt = "(";
                      for (int i = 0; i < nb.Count - 1; i++)
                      {
                          nxt = nxt + nb[i].ToString() + ",";
                      }
                      nxt = nxt + nb[nb.Count - 1] + ")";

                      comm.CommandText = "delete from ETAT_PROFIL where ID_ETAT in " + nxt + " and ID_PROFIL = " + st;


                      try
                      {
                          comm.ExecuteNonQuery();
                      }
                      catch (Exception ex)
                      {
                          Response.Write(ex.ToString());
                      }
                  }
              }
 
          }
        }

       
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           this.dynCBL();
        }



        protected void dynCBL()
        {
            using (SqlConnection con = new SqlConnection("Server = localhost;" + "Trusted_Connection = true;" + "Database = mybase;" + "MultipleActiveResultSets=true;"))
            {
                con.Open();
                String st = DropDownList1.Text;
                int j = Int32.Parse(st);

                SqlCommand comm = new SqlCommand(); SqlCommand comm2 = new SqlCommand(); SqlCommand comm3 = new SqlCommand();
                SqlCommand comm4 = new SqlCommand(); SqlCommand comm5 = new SqlCommand();
                comm.Connection = con; comm2.Connection = con; comm3.Connection = con; comm4.Connection = con; comm5.Connection = con;
                comm.CommandText = "select ID_ETAT from ETAT_PROFIL where ID_PROFIL = " + j.ToString();
                comm2.CommandText = "select ID_RUBRIQUE from RUBRIQUE";
                comm3.CommandText = "select ID_RUBRIQUE from ETAT";
                SqlDataReader rRub = comm2.ExecuteReader();
                int ct = 0;
                int count = 0;
                while (rRub.Read())
                {
                    int nb = rRub.GetInt32(0);
                    SqlDataReader rEtat = comm3.ExecuteReader();
                    while (rEtat.Read())
                    {

                        if (rEtat.GetInt32(0) == nb)
                        {

                            comm4.CommandText = "select NOM_RUBRIQUE from RUBRIQUE where ID_RUBRIQUE = " + nb.ToString();
                            SqlDataReader temp = comm4.ExecuteReader();
                            String nomR = "";
                            if (temp.Read())
                            {
                                nomR = temp[0].ToString();
                            }
                            count++;
                            temp.Close();
                            Literal lit = new Literal();
                            if (count == 1) { lit.Text = "<tr> <td valign=\"top\" width=\"500\"> <h3>" + nomR + "</h3>"; }
                            else { lit.Text = "<td valign=\"top\" width=\"500\" >  <h3>" + nomR + "</h3>"; }
                            CheckBoxList ch = new CheckBoxList();
                            ct++;
                            ch.ID = "txt" + ct.ToString();
                            ch.CssClass = "check";
                            ch.DataTextField = "NOM_ETAT";
                            ch.DataValueField = "ID_ETAT";
                            comm5.CommandText = "select * from ETAT where ID_RUBRIQUE = " + nb.ToString();
                            temp = comm5.ExecuteReader();
                            ch.DataSource = temp;
                            ch.DataBind();
                            PlaceHolder1.Controls.Add(lit);
                            PlaceHolder1.Controls.Add(ch);
                            Literal lit2 = new Literal();
                            if (count == 3) { lit2.Text = "</td> </tr>"; count = 0; }
                            else lit2.Text = "</td>";
                            PlaceHolder1.Controls.Add(lit2);

                            temp.Close();
                            break;
                        }

                    }
                    rEtat.Close();
                }

                if (count != 3) { Literal lit = new Literal(); lit.Text = "</tr>"; PlaceHolder1.Controls.Add(lit); }

                SqlDataReader r = comm.ExecuteReader();
                this.oldV = new List<int>();
                while (r.Read())
                {
                    int x = r.GetInt32(0);

                    for (int i = 1; i < ct + 1; i++)
                    {
                        string txtID = "txt" + i.ToString();
                        System.Web.UI.WebControls.CheckBoxList txt = (System.Web.UI.WebControls.CheckBoxList)FindControl(txtID);
                        for (int k = 0; k < txt.Items.Count; k++)
                        {
                            if (x == Convert.ToInt32(txt.Items[k].Value))
                            {
                                txt.Items[k].Selected = true;
                                this.oldV.Add(Convert.ToInt32(txt.Items[k].Value));
                            }
                        }
                    }
                }
                r.Close(); size = ct;

            }
            
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

        protected void STRCT_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList1.Visible = true;
            Label1.Visible = true;
            using (SqlConnection con = new SqlConnection("Server = localhost;" + "Trusted_Connection = true;" + "Database = mybase"))
            {
                con.Open();
                SqlCommand comm = new SqlCommand(); 
                comm.Connection = con;
                string id=STRCT.Text;
                comm.CommandText = "select * from PROFIL where STATUT = 1 and id_str = '"+id+"'";
                SqlDataReader r = comm.ExecuteReader();
                DropDownList1.DataSource = r; 
                 DropDownList1.DataBind();
                 DropDownList1.Items.Insert(0, new ListItem("--Choisissez un Profil --", "0"));
            }
        }




       
    }
}