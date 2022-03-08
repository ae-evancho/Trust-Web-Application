using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class WebForm51 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AGC.Items.Insert(0, new ListItem("  ::: Choisissez Une Agence :::  ", "0"));
                AGC.AppendDataBoundItems = true;
                this.MATBind();
                info.Visible = false;

            }
        }

        protected void AGCBind()
        {
            
            using (SqlConnection con = new SqlConnection("Server = localhost;" + "Trusted_Connection = true;" + "Database = mybase"))
            {
                con.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = con;
                comm.CommandText = "select * from agence";
                SqlDataReader r = comm.ExecuteReader();
                while (r.Read())
                {
                    string str = r.GetString(0);
                    string str1 = r.GetString(0).PadRight(8, '\u00A0');
                    string str2 = r.GetString(1);
                    String text = String.Format("{0}|{1}\n", str1, str2);

                    AGC.Items.Add(new ListItem(text, str));
                }
            }
        }

        protected void AGCIndexChanged(object sender, EventArgs e)
        {
            Existence.Text = null;
            ExistProfil.Text = null;
            HF1.Value = null;
            PRFL.Items.Clear();
            Avert.Visible = false;
            Y.Visible = false;
            N.Visible = false;
            using (SqlConnection con = new SqlConnection("Server = localhost;" + "Trusted_Connection = true;" + "Database = mybase"))
            {
                con.Open();
                SqlCommand comm = new SqlCommand(); SqlCommand comm2 = new SqlCommand();
                comm.Connection = con; comm2.Connection = con;
                string log = MAT.Text;
                string agc = AGC.Text;
                /*PROBLEME*/
                comm.CommandText = @"select a.nom_profil, a.id_profil from PROFIL a where a.id_str in (select distinct b.id_str from WebUser b where b.login = "
                                   + log + ") and a.ID_PROFIL not in (select c.id_profil from Profil_Employe c  where c.matricule=" + log + "and c.agence=" + agc + ")";

                SqlDataReader r = comm.ExecuteReader();
                while (r.Read())
                {
                    string str = r.GetInt32(1).ToString();
                    string str1 = r.GetInt32(1).ToString().PadRight(8, '\u00A0');
                    string str2 = r.GetString(0);
                    String text = String.Format("{0}|{1}\n", str1, str2);
                    PRFL.Items.Add(new ListItem(text, str));
                }
                r.Close();

                comm.CommandText = "select nom from WebUser where login = " + log + " and agence = " + AGC.Text;
                r = comm.ExecuteReader();
                if (r.Read()) Existence.Text = "Record Exists";
                else { Existence.Text = "Record Doesn't Exist"; HF1.Value = "0"; }
                r.Close();

                comm.CommandText = "select id_profil from profil_employe where matricule = " + log + " and agence = " + AGC.Text;
                r = comm.ExecuteReader();
                if (HF1.Value != "0")
                {
                    if (r.Read())
                    { 
                        ExistProfil.Text = "Profil Exists: \n";
                        ExistProfil.Text = ExistProfil.Text + "- " + r.GetInt32(0) + "\n";
                        HF1.Value = "2";
                        while (r.Read())
                        {
                            ExistProfil.Text = ExistProfil.Text + "- " + r.GetInt32(0) + "\n";
                        }
                    }
                    else { ExistProfil.Text = "Profil Doesn't Exist"; HF1.Value = "1"; }
                }
            }
            PRFL.Visible = true;
            Profil.Visible = true;
            AJT.Visible = true;
        }

        protected void MATBind()
        {
            
            using (SqlConnection con = new SqlConnection("Server = localhost;" + "Trusted_Connection = true;" + "Database = mybase"))
            {
                MAT.Items.Insert(0, new ListItem(":::\u00A0\u00A0\u00A0\u00A0\u00A0|:::", "0"));
                MAT.AppendDataBoundItems = true;
                con.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = con;
                comm.CommandText = @"select login, nom, prenom from Active_Directory";
                                    
                SqlDataReader r = comm.ExecuteReader();
                while (r.Read())
                {
                    string str = r.GetString(0);
                    string str1 = r.GetString(0).PadRight(8, '\u00A0');
                    string str2 = r.GetString(1);
                    string str3 = r.GetString(2);
                    String text = String.Format("{0}|{1} {2}\n", str1, str2, str3);
                    MAT.Items.Add(new ListItem(text, str));
                }
            }
        }

        protected void MATIndexChanged(object sender, EventArgs e)
        {
            this.AGCBind();
            PRFL.Visible = false;
            Profil.Visible = false;
            AJT.Visible = false;
            AGC.SelectedIndex = 0;
            info.Visible = true;
            ExistProfil.Text = "";
            Existence.Text = "";
            Avert.Visible = false;
            Y.Visible = false;
            N.Visible = false;
            using (SqlConnection con = new SqlConnection("Server = localhost;" + "Trusted_Connection = true;" + "Database = mybase"))
            {
                string s = MAT.SelectedValue;
                con.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = con;
                comm.CommandText = "select nom, prenom, e_mail from active_directory where login = "+s;

                SqlDataReader r = comm.ExecuteReader();
                if (r.Read())
                {
                    Nom.Text = r.GetString(0) +" "+ r.GetString(1);
                    Email.Text = r.GetString(2);
                }
                r.Close();
       
            }
            
        }

        protected void AJTOnClick(object sender, EventArgs e)
        {
            if (HF1.Value == "0") noRecord();
            if (HF1.Value == "1") noProfil(); 
            if (HF1.Value == "2") PrflRcrd();
            
            //Insertion dans PROFIL_EMPLOYE    
            using (SqlConnection con = new SqlConnection("Server = localhost;" + "Trusted_Connection = true;" + "Database = mybase"))
            {
                con.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = con;
                string id = PRFL.Text;
                string agc = AGC.Text;
                string mat = MAT.Text;
                PRFL.Items.Remove(PRFL.Items.FindByValue(id));
                comm.CommandText = @"insert into Profil_Employe (id_profil, agence, matricule, date_ajout, mat_user_ajout)
                                     values (@id,@agc,@mat,@dat,@matu)";
                comm.Parameters.AddWithValue("@id", id);
                comm.Parameters.AddWithValue("@agc", agc);
                comm.Parameters.AddWithValue("@mat", mat);
                comm.Parameters.AddWithValue("@dat", DateTime.Now);
                comm.Parameters.AddWithValue("@matu", 255);
                comm.ExecuteNonQuery();

                string ListeEtat = "";
                comm.CommandText = @"select a.nom_etat from etat a where a.id_etat in 
                                    (select b.id_etat from etat_profil b where b.id_profil= 1)";
                SqlDataReader r = comm.ExecuteReader();
                while (r.Read())
                {
                    ListeEtat = ListeEtat + r.GetString(0) + ",";
                }
                r.Close();

            }
        }

        protected void noRecord() 
        {
            using (SqlConnection con = new SqlConnection("Server = localhost;" + "Trusted_Connection = true;" + "Database = mybase"))
            {
                con.Open();
                SqlCommand comm = new SqlCommand(); SqlCommand comm2 = new SqlCommand();
                comm.Connection = con; comm2.Connection = con;
                comm.CommandText = "select name from sys.columns where object_id= OBJECT_ID('dbo.WebUser')";
                comm2.CommandText = "select a.NOM_ETAT from etat a where a.ID_ETAT in (select b.id_etat from ETAT_PROFIL b where ID_PROFIL="+PRFL.Text+")";
                SqlDataReader r = comm2.ExecuteReader();
                List<string> etats= new List<string>();
                while (r.Read())
                {
                    etats.Add(r.GetString(0).Replace(" ", ""));
                }
                r.Close();

                r = comm.ExecuteReader();
                string values = "";
                string columns = "";
                List<string> nomcols = new List<string>();
                while (r.Read())
                { 
                    nomcols.Add(r.GetString(0).Replace(" ", ""));
                    columns = columns + r.GetString(0) + ", ";
                }
                r.Close();

                int j = 11; bool b = false;
                while (nomcols.Count > j)
                {
                    int i = 0;
                    while (etats.Count > i)
                    {
                        if (nomcols[j].Equals(etats[i])) { b = true; break; }
                        i++;
                    }

                    if (b) values = values + "1, ";
                    else values = values + "0, ";
                    
                    j++;
                    b = false;
                }

                comm.CommandText = "select nom, prenom from active_directory where login= @log";
                comm.Parameters.AddWithValue("@log", MAT.Text);
                r = comm.ExecuteReader();
                string nom="", prenom="";
                if (r.Read())
                {
                    nom = r.GetString(0);
                    prenom = r.GetString(1);
                }
                r.Close();

                columns = columns.Substring(0, columns.Length - 2);
                values = values.Substring(0, values.Length - 2);
                comm.CommandText = @"insert into WebUser (" + columns + ") Values (" + "'" + nom + "', " + "'" + prenom + "', "
                                   + "'" + MAT.Text + "', " + "null, " + "'" + AGC.Text + "', " + "null, " + "null, " + "1, "
                                   + "null, " + "null, " + "null, " + values + ")";
                comm.ExecuteNonQuery();

            }
        }
        protected void noProfil() 
        {
            using (SqlConnection con = new SqlConnection("Server = localhost;" + "Trusted_Connection = true;" + "Database = mybase"))
            {
                con.Open();
                SqlCommand comm = new SqlCommand(); SqlCommand comm2 = new SqlCommand();
                comm.Connection = con; comm2.Connection = con;
                comm.CommandText = "select nom_etat from etat";
                comm2.CommandText = "select a.NOM_ETAT from etat a where a.ID_ETAT in (select b.id_etat from ETAT_PROFIL b where ID_PROFIL=" + PRFL.Text + ")";
                SqlDataReader r = comm2.ExecuteReader();
                List<string> etats = new List<string>();
                while (r.Read())
                {
                    etats.Add(r.GetString(0).Replace(" ", ""));
                }
                r.Close();

                r = comm.ExecuteReader();
                string columns = "";
                while (r.Read())
                {
                    string str = r.GetString(0).Replace(" ", "");
                    int i = 0; bool b = false;
                    while (etats.Count > i)
                    {
                        if (str.Equals(etats[i])) { b = true; break; }
                        i++;
                    }

                   if(b) columns = columns + r.GetString(0) + " =1, ";
                   else  columns = columns + r.GetString(0) + " =0, ";

                    b = false;
                }
                r.Close();
                
                columns = columns.Substring(0, columns.Length - 2);
                comm.CommandText = "update WebUser set " + columns + " where login=@log and agence=@agc";
                comm.Parameters.AddWithValue("@log",MAT.Text);
                comm.Parameters.AddWithValue("@agc", AGC.Text);

                comm.ExecuteNonQuery();

            }
        }
        protected void PrflRcrd() 
        {
            Avert.Visible = true;
            Y.Visible = true;
            N.Visible = true;
        }

        protected void onClickOui(object sender, EventArgs e)
        {
            Avert.Visible = false;
            Y.Visible = false;
            N.Visible = false;
            noProfil();

        }
        protected void onClickNon(object sender, EventArgs e)
        {
            Avert.Visible = false;
            Y.Visible = false;
            N.Visible = false;
            using (SqlConnection con = new SqlConnection("Server = localhost;" + "Trusted_Connection = true;" + "Database = mybase"))
            {
                con.Open();
                SqlCommand comm = new SqlCommand(); 
                comm.Connection = con;
                comm.CommandText = "select a.NOM_ETAT from etat a where a.ID_ETAT in (select b.id_etat from ETAT_PROFIL b where ID_PROFIL=" + PRFL.Text + ")";
                SqlDataReader r = comm.ExecuteReader();
                string columns="";
                while (r.Read())
                {
                    columns = columns + r.GetString(0).Replace(" ", "")+"=1, ";
                }
                r.Close();

                columns = columns.Substring(0, columns.Length - 2);
                comm.CommandText = "update WebUser set " + columns + " where login=@log and agence=@agc";
                comm.Parameters.AddWithValue("@log", MAT.Text);
                comm.Parameters.AddWithValue("@agc", AGC.Text);

                comm.ExecuteNonQuery();
            }

        }

    }
}