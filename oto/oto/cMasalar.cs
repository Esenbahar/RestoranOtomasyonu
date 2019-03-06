using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace oto
{
    class cMasalar
    {

        #region fields
        private int _ID;
        private int _KAPASİTE;
        private int _SERVISTURU;
        private int _DURUM;
        private int _ONAY;
        #endregion

        #region Properties
        public int ID { get => _ID; set => _ID = value; }
        public int KAPASİTE { get => _KAPASİTE; set => _KAPASİTE = value; }
        public int SERVISTURU { get => _SERVISTURU; set => _SERVISTURU = value; }
        public int DURUM { get => _DURUM; set => _DURUM = value; }
        public int ONAY { get => _ONAY; set => _ONAY = value; }
        #endregion

        cGenel gnl = new cGenel();
        public string SessionSum(int state)
        {
            string dt = "";

            SqlConnection con = new SqlConnection(gnl.conString);
            
            SqlCommand cmd = new SqlCommand();
           
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_MasalarBirlestir";

            SqlDataReader dr = null;
            cmd.Parameters.Add("@durum", SqlDbType.Int).Value = state;

            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                dr = cmd.ExecuteReader();
                while(dr.Read())
                {
                    dt = Convert.ToDateTime(dr["TARIH"]).ToString();
                }
            }
            catch (SqlException ex)
            {
                string hata = ex.Message;
                throw;
            }
            finally
            {
                dr.Close();
                con.Dispose();
                con.Close();
            }

            
            return dt;
        }
        public int TableGetbyNumber ( string TableValue)
        {
            string aa = TableValue;
            int length = aa.Length;

            return Convert.ToInt32(aa.Substring(length - 1, 1));
        }

        public bool TableGetbyState(int ButtonName,int state)
        {

            bool result = false;
            SqlConnection con = new SqlConnection(gnl.conString);

            SqlCommand cmd = new SqlCommand();

            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_Masalar";
            cmd.Parameters.Add("@TableId", SqlDbType.Int).Value = ButtonName;
            cmd.Parameters.Add("@state", SqlDbType.Int).Value = state;
            try
            {
                if (con.State == ConnectionState.Closed)
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
            finally
            {
                
                con.Dispose();
                con.Close();
            }


            return result;


        }
        public void setChangeTableState(string ButtonName,int state)
        {
            SqlConnection con = new SqlConnection(gnl.conString);

            SqlCommand cmd = new SqlCommand();

            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_Update_Masalar";

            if (con.State==ConnectionState.Closed)
            {
                con.Open();
            }
            string aa = ButtonName;
            int uzunluk = aa.Length;
            cmd.Parameters.Add("@MasaDurum", SqlDbType. Int).Value = state;
            cmd.Parameters.Add("@Masano", SqlDbType.Int).Value = aa.Substring(uzunluk - 1, 1);
            cmd.ExecuteNonQuery();
            con.Dispose();
            con.Close();
            


            
        }
    }
}
