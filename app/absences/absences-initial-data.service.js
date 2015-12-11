(function () {
    'use strict';

    angular.module('attendanceAdmin').factory('absencesInitialDataService', absencesInitialDataService);

    absencesInitialDataService.$inject = ['$q', 'attendanceApi'];
    /* @ngInject */
    function absencesInitialDataService($q, attendanceApi) {
        var service = {
            getData: getData
        };

        return service;

        ////////////////

        function getData(areaId, year) {
            return $q.all([
                attendanceApi.getEmployees(areaId),
                attendanceApi.getAbsences(areaId, year),
                attendanceApi.getAbsenceReasons()
            ]).then(function (results) {
                return {
                    employees: results[0],
                    absences: results[1],
                    absenceReasons: results[2]
                };
            });
        }
    }
})();