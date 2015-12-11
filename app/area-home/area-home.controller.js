(function () {
    'use strict';

    angular.module('attendanceAdmin').controller('DepartmentHomeCtrl', DepartmentHomeCtrl);

    DepartmentHomeCtrl.$inject = ['initialData', 'attendanceApi'];

    /* @ngInject */
    function DepartmentHomeCtrl(initialData, attendanceApi) {
        /* jshint validthis: true */
        var vm = this;

        vm.activate = activate;
        vm.department = initialData;
        vm.homeContent = initialData.homeScreen;
        vm.reset = reset;
        vm.save = save;

        activate();

        ////////////////

        function activate() {
        }

        function reset(){
            vm.homeContent = initialData.homeScreen;
        }

        function save(){
            vm.department.homeScreen = vm.homeContent;
            attendanceApi.saveDepartment(vm.department);
        }



    }
})();