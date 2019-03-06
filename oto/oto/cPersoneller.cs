using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
namespace oto
{
    class cPersoneller
    {
        cGenel gnl = new cGenel(); // cGenel classını daha önce oluşturmuştuk burada cgenel classından nesnesini oluşturduk.
        #region fields
        private int _PersonelId;
        private int _personelGorevId;
        private string _personelAd;
        private string _personelSoyad;
        private string _personelParola;
        private string _personelKullaniciAdi;
        private bool _personelDurum;

        internal bool PersonelEntryControl(string text)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region Properties
        public int PersonelId { get => _PersonelId; set => _PersonelId = value; }
        public int PersonelGorevId { get => _personelGorevId; set => _personelGorevId = value; }
        public string PersonelAd { get => _personelAd; set => _personelAd = value; }
        public string PersonelSoyad { get => _personelSoyad; set => _personelSoyad = value; }
        public string PersonelParola { get => _personelParola; set => _personelParola = value; }
        public string PersonelKullaniciAdi { get => _personelKullaniciAdi; set => _personelKullaniciAdi = value; }
        public bool PersonelDurum { get => _personelDurum; set => _personelDurum = value; } 
        #endregion

        public bool PersonelEntryControl(string password,int UserId) //Personel giriş.
        {

            bool result = false;

            SqlConnection con = new SqlConnection(gnl.conString);
            SqlCommand cmd = new SqlCommand("Select * from Personeller where ID=@Id and PAROLA=@password",con);
            cmd.Parameters.Add("@Id", SqlDbType.VarChar).Value = UserId;
            cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = password; //Önce bunlar çalışıcak buradaki değerlerimi
                                                                                    //sorguma götürdü daha sonra try catch ile de kontrol edilecek.

          
           
            try
            {
                if (con.State==ConnectionState.Closed)
                {
                    con.Open();
                }
                result = Convert.ToBoolean(cmd.ExecuteScalar());
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
                throw;
            }

            return result;

        }
        public void personelGetbyInformation(ComboBox cb ) //comboboxa giren personellerin değerini tutan fonksiyonum.
        {
            cb.Items.Clear();
            SqlConnection con = new SqlConnection(gnl.conString);
            SqlCommand cmd = new SqlCommand("Select * from Personeller ", con);
           


            if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
            SqlDataReader dr= cmd.ExecuteReader();

            while (dr.Read())
            {
                cPersoneller p = new cPersoneller();
                p._PersonelId = Convert.ToInt32(dr["ID"]);
                p._personelGorevId = Convert.ToInt32(dr["GOREVID"]);
                p._personelAd = Convert.ToString(dr["AD"]);
                p._personelSoyad = Convert.ToString(dr["SOYAD"]);
                p._personelParola = Convert.ToString(dr["PAROLA"]);
                p._personelKullaniciAdi = Convert.ToString(dr["KULLANICIADI"]);
                p._personelDurum = Convert.ToBoolean(dr["Durum"]);
                cb.Items.Add(p);

            }
            dr.Close();
            con.Close();
        }
        public override string ToString()
        {
            return PersonelAd + " "+ PersonelSoyad ;
        }
    }
}
