package com.hrm

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.transaction.annotation.Propagation

@Secured('permitAll')
class ManagerController {

    def springSecurityService
    def leaveAction() {
        def name = springSecurityService.currentUser.getUsername()
        def manager = Employee.findByUsername(name)
        render(view: 'leaveAction', model: [username: name, manager: manager, leaveCount: new ManagerController().leaveCount(manager)])
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def saveLeaveAction(){
        def list = params.list('id')
        for(def data: list){
            String []dataSplit = data.split('-')
            if(!(dataSplit[1].equals('Pending'))){
                def leave = Leaves.get(Integer.parseInt(dataSplit[0]))
                leave.setStatus(dataSplit[1])
                leave.validate()
            }
        }
        redirect(controller: 'secure')
    }

    def employees(){
        def name = springSecurityService.currentUser.getUsername()
        def manager = Employee.findByUsername(name)
        render(view:'employees', model: [username: name, manager: manager, leaveCount: new ManagerController().leaveCount(manager)])
    }

    def showEmployee(Employee employee){
        def manager = Employee.findManagerByEmployee(employee.id).get()
        def name = springSecurityService.currentUser.getUsername()
        render(view: 'employeeDetails', model: [username: name, employee: employee, leaveCount: new ManagerController().leaveCount(manager)])
    }

    def holiday(){
        def name = springSecurityService.currentUser.getUsername()
        def manager = Employee.findByUsername(name)
        def holidays = manager.company.holidays.findAll{it.year == Calendar.getInstance().get(Calendar.YEAR)}
        render(view: 'holidays', model: [username: name, companyName: manager.company.companyName, holidays: holidays, leaveCount: new ManagerController().leaveCount(manager)])
    }

    def assets(){
        def name = springSecurityService.currentUser.getUsername()
        def manager = Employee.findByUsername(name)
        render(view: 'assets', model: [username: name, company: manager.company, leaveCount: new ManagerController().leaveCount(manager)])
    }

    def assignAsset(){
        def name = springSecurityService.currentUser.getUsername()
        def manager = Employee.findByUsername(name)
        render(view: 'selectEmployee', model: [username: name, manager: manager, leaveCount: new ManagerController().leaveCount(manager)])
    }

    def assetToEmployee(Employee employee){
        def name = springSecurityService.currentUser.getUsername()
        def manager = Employee.findByUsername(name)
        render(view: 'assetToEmployee', model: [username: name, employee: employee, leaveCount: new ManagerController().leaveCount(manager)])
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def saveAssetToEmploye(Employee employee){
        def arr = params.assetId
        if(params.act.equals('Add')){
            for(String id : arr){
                def asset = Asset.get(Integer.parseInt(id))
                employee.addToAssets(asset)
                asset.setIssueDate((String)new Date())
                asset.save()
            }
            redirect(controller: 'manager', action: 'assignAsset')
        }else if(params.act.equals('Remove')){
            for(String id : arr){
                def asset = Asset.get(Integer.parseInt(id))
                employee.removeFromAssets(asset)
                asset.setIssueDate(null)
                asset.save()
            }
            redirect(controller: 'manager', action: 'assignAsset')
        }
    }

    def Integer leaveCount(Employee manager){
        Integer count = 0
        for(def employee: manager.employees){
            for(def leave : employee.leaves){
                if(leave.status.equals('Pending')){
                    count++
                }}}
        return count
    }
}
