(function () {
    'use strict';

    angular.module('attendanceAdmin').controller('EmployeesCtrl', EmployeesCtrl);

    EmployeesCtrl.$inject = ['$modal', '$state', '$stateParams', 'initialData', 'attendanceApi'];

    /* @ngInject */
    function EmployeesCtrl($modal, $state, $stateParams, initialData, attendanceApi) {
        /* jshint validthis: true */
        var vm = this;

        vm.activate = activate;
        vm.employees = initialData;
        vm.year = new Date().getFullYear();
        vm.years = generateYears();
        vm.update = update;

        activate();

        ////////////////

        function activate() {
        }

        function generateYears(startYear) {
            var years = [];
            var currentYear = new Date().getFullYear();
            startYear = startYear || 2014;

            while (startYear <= currentYear) {
                years.push(startYear++);
            }

            return years;
        };

        function update() {
            //doubt this is the best way to handle this but if I don't add 'then' it just returns 
            //a $$state object
            var data = attendanceApi.getHoursAbsentByArea($stateParams.areaId, vm.year).then(function(employees){
                vm.employees = employees;
            });
        }


        function initializeGroups() {
            vm.groups = _.chain(vm.employees)
                .sortBy('name')
                .groupBy('divisionName')
                .pairs()
                .map(function(item){
                    return { divisionName: item[0], employees: item[1], isOpen: true };
                })
                .sortBy('divisionName')
                .value();
        }
    }
})();