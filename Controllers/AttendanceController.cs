using AttendanceView.Repository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace AttendanceView.Controllers
{
    public class AttendanceController : ApiController
    {
        DataRepo repo = new DataRepo();

        [ActionName("GetAreas")]
        public DataTable GetAreas()
        {
            return repo.GetAreas();
        }

        [ActionName("GetEmployees")]
        public DataTable GetEmployees(int areaId)
        {
            return repo.GetEmployees(areaId);
        }

        [ActionName("GetAbsences")]
        public DataTable GetAbsences(int areaId, int year)
        {
            return repo.GetAbsences(areaId, year);
        }

        [ActionName("GetHoursAbsentByArea")]
        public DataTable GetHoursAbsentByArea(int areaId, int year)
        {
            return repo.GetHoursAbsentByArea(areaId, year);
        }

        [ActionName("GetAbsenceReasons")]
        public DataTable GetAbsenceReasons()
        {
            return repo.GetAbsenceReasons();
        }
    }
}
