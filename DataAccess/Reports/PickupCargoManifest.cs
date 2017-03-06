﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Reports
{
    public class PickupCargoManifest
    {
        public static DataSet GetPickupCargoManifest(string conSTR)
        {
            using (SqlConnection con = new SqlConnection(conSTR))
            {
                SqlDataAdapter da = new SqlDataAdapter("sp_view_Reports_PickupCargoManifest", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                //da.SelectCommand.Parameters.Add("@Area", SqlDbType.VarChar).Value = strArea;
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }

        }
    }
}