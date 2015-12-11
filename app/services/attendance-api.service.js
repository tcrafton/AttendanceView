(function () {
    'use strict';

    angular.module('attendanceAdmin').factory('attendanceApi', attendanceApi);

    attendanceApi.$inject = ['$http', 'appSpinner'];

    function attendanceApi($http, appSpinner) {
        var service = {
            getAreas: getAreas,
            getArea: getArea,
            getEmployees: getEmployees,
            getAbsences: getAbsences,
            getAbsenceReasons: getAbsenceReasons,
            getHoursAbsentByArea: getHoursAbsentByArea
        };

        var baseUrl = '/api/Attendance/';

        return service;

        function getAreas() {
            return httpGet('GetAreas');
        }

        function getArea(areaId) {
            return httpGet('GetEmployees?areaId=' + areaId);
        }

        function getEmployees(areaId) {
            return httpGet('GetEmployees?areaId=' + areaId);
        }

        function getAreaNameById(areaId) {
            return httpGet('GetEmployees?areaId=' + areaId);
        }

        function getAbsences(areaId, year) {
            if (!year) {
                year = new Date().getFullYear();
            }
            return httpGet('GetAbsences?areaId=' + areaId + '&year=' + year);
        }

        function getHoursAbsentByArea(areaId, year) {
            if (!year) {
                year = new Date().getFullYear();
            }
            return httpGet('GetHoursAbsentByArea?areaId=' + areaId + '&year=' + year);
        }

        function getAbsenceReasons() {
            return httpGet('GetAbsenceReasons');
        }

        /** Private Methods **/

        function httpExecute(requestUrl, method, data) {
            appSpinner.showSpinner();
            return $http({
                url: baseUrl + requestUrl,
                method: method,
                data: data
            }).then(function (response) {
                appSpinner.hideSpinner();
                //console.log('**response from EXECUTE', response);
                return response.data;
            });
        }

        function httpGet(url) {
            return httpExecute(url, 'GET');
        }
    }
})();