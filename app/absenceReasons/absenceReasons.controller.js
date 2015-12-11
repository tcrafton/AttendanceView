(function () {
    'use strict';

    angular.module('attendanceAdmin').controller('AbsenceReasonCtrl', AbsenceReasonCtrl);

    AbsenceReasonCtrl.$inject = ['initialData', 'attendanceApi'];

    /* @ngInject */
    function AbsenceReasonCtrl(initialData, attendanceApi) {
        /* jshint validthis: true */
        var vm = this;

        vm.activate = activate;
        vm.absenceReasons = initialData;

        activate();

        ////////////////

        function activate() {
        }
    }
})();