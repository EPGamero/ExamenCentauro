using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using ML;
using ML.Entities;

namespace BL
{
    public class GPS_DATA
    {
        public static MethodResponse<List<GPS_DATAS>> Get()
        {
            MethodResponse<List<GPS_DATAS>> response = new MethodResponse<List<GPS_DATAS>>();
            try
            {
                using (SqlConnection context = new SqlConnection(DL.Conexion.ConnectionString()))
                {
                    string Query = "sp_GetGPS_DATA";
                    SqlCommand cmd = DL.Conexion.CreateCommand(Query, context);
                    cmd.CommandType = CommandType.StoredProcedure;
                    DataTable table = DL.Conexion.ExecuteCommandSelect(cmd);
                    if (table.Rows.Count > 0)
                    {
                        response.Code = 200;
                        response.Messagge = "Datos encontrados";
                        response.Result = new List<GPS_DATAS>();
                        foreach(DataRow row in table.Rows)
                        {
                            GPS_DATAS items = new GPS_DATAS();
                            items.Id = Convert.ToInt32(row[0]);
                            items.DateSystem = Convert.ToString(row[1]);
                            items.DateEvent = Convert.ToString(row[2]);
                            items.Latitude = Convert.ToDouble(row[3]);
                            items.Longitude = Convert.ToDouble(row[4]);
                            items.Battery = Convert.ToInt32(row[5]);
                            items.Source = Convert.ToInt32(row[6]);
                            items.Type = Convert.ToInt32(row[7]);
                            response.Result.Add(items);
                        }
                        return response;
                    }
                    else
                    {
                        response.Code = 400;
                        response.Messagge = "No hay datos que mostrar";
                        response.Result = new List<GPS_DATAS>();
                        return response;
                    }
                }
            }
            catch (Exception Ex)
            {
                response.Code = 500;
                response.Messagge = Ex.ToString();
                response.Result = new List<GPS_DATAS>();
                return response;
            }
        }
    }
}
