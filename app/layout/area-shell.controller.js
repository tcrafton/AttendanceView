(function () {
    'use strict';

    angular.module('attendanceAdmin').controller('AreaShellCtrl', AreaShellCtrl);

    AreaShellCtrl.$inject = ['$state', '$stateParams'];

    function AreaShellCtrl($state, $stateParams) {
        /* jshint validthis:true */
        var vm = this;
        vm.areaId = $stateParams.areaId;
        vm.areaName = $state.params.areaName;
        vm.tabs = [
            { text: 'Employees', state: 'area.employees' },
            { text: 'Absences', state: 'area.absences' },
            { text: 'Absences Calendar', state: 'area.absences-calendar' }
        ];

        activate();

        function activate() {
            _.each(vm.tabs, function (tab) {
                tab.active = ($state.current.name === tab.state);
            });            
        }
    }
})();