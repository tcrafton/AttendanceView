using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AttendanceView.Repository
{
    public class DataRepo
    {
        string connString = Properties.Settings.Default.dbConnStr;

        public DataTable GetAreas()
        {
            var dt = new DataTable();
            using (var conn = new SqlConnection(connString))
            using (var cmd = new SqlCommand("usp_GetAreas", conn))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                da.Fill(dt);
            }

            return dt;
        }

        public DataTable GetEmployees(int areaId)
        {
            var dt = new DataTable();
            using (var conn = new SqlConnection(connString))
            using (var cmd = new SqlCommand("usp_GetEmployeesByArea", conn))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@areaId", SqlDbType.Int).Value = areaId;
                da.Fill(dt);
            }

            return dt;
        }

        public DataTable GetAbsences(int areaId, int selectedYear)
        {
            var dt = new DataTable();
            using (var conn = new SqlConnection(connString))
            using (var cmd = new SqlCommand("usp_GetAbsencesByArea", conn))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@areaId", SqlDbType.Int).Value = areaId;
                cmd.Parameters.Add("@year", SqlDbType.Int).Value = selectedYear;
                da.Fill(dt);
            }

            return dt;
        }

        public DataTable GetHoursAbsentByArea(int areaId, int selectedYear)
        {
            var dt = new DataTable();
            using (var conn = new SqlConnection(connString))
            using (var cmd = new SqlCommand("usp_GetHoursAbsentByArea", conn))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@areaId", SqlDbType.Int).Value = areaId;
                cmd.Parameters.Add("@year", SqlDbType.Int).Value = selectedYear;
                da.Fill(dt);
            }

            return dt;
        }

        public DataTable GetAbsenceReasons()
        {
            var dt = new DataTable();
            using (var conn = new SqlConnection(connString))
            using (var cmd = new SqlCommand("usp_GetAbsenceReasons", conn))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                da.Fill(dt);
            }

            return dt;
        }
    }
}