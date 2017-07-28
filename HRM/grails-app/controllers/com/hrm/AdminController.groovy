package com.hrm

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.transaction.annotation.Propagation

@Secured('permitAll')
class AdminController {

    def testRole
    def testuser
    def springSecurityService

    def module() {
        def name = springSecurityService.currentUser.getUsername()
        def companyName = Employee.findByUsername(name).company.companyName
        render(view: 'module', model: [username: name, companyName: companyName, module: Module.findByModuleName(params.module)])
    }

    def newEmployee(){
        def name = springSecurityService.currentUser.getUsername()
        def companyName = Employee.findByUsername(name).company.companyName
        def usernames = User.list().username
        def roleList = RoleEmployee.list()
        render (view: 'newEmployee', model:[username:name, users: usernames, companyName: companyName, roles: roleList])
    }
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def saveEmployee(Employee employee, User user){
        def createDate = new Date()
        def name = springSecurityService.currentUser.getUsername()
        def company = Employee.findByUsername(name).company

        employee.setCreatedDate(createDate)
        employee.setCreatedBy(name)

        def roleEmployee = RoleEmployee.read(Integer.parseInt(params.rolex))
        employee.setRoleEmployee(roleEmployee)

        //company.addToEmployees(employee)
        EmployeeLeave employeeLeave = new EmployeeLeave()
        employeeLeave.setEarnLeave(0)
        employeeLeave.setUsedLeave(0)
        employeeLeave.setRemainingLeave(0)
        employeeLeave.setCreatedBy(name)
        employeeLeave.setCreatedDate(createDate)
        employee.setEmployeeLeave(employeeLeave)
        company.addToEmployees(employee)
        employee.save()

        testuser= user.save(failonError: true)
        testRole=  Role.findByAuthority('ROLE_ADMIN')
        UserRole.create(testuser,testRole)
        redirect(controller: 'admin', action: 'employee')
    }

    def employee(){
        def name = springSecurityService.currentUser.getUsername()
        def company = Employee.findByUsername(name).company
        render(view: 'employee', model: [username: name, company: company])
    }

    def employeeModify(Employee employee){
        def name = springSecurityService.currentUser.getUsername()
        if(params.modify.equals("Show")){
            render(view: 'empDetails', model: [username: name, employee: employee])
        }else if(params.modify.equals("Edit")){
            def roleList = RoleEmployee.list()
            def usernames = User.list().username
            render(view: 'editEmployee', model: [username: name, users: usernames, employee: employee, roles: roleList])
        }else if(params.modify.equals("Delete")){
            def company = employee.company
            company.removeFromEmployees(employee)
            employee.delete(flush: true)
            redirect(controller: 'admin', action: 'employee')
        }
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def updateEmployee(Employee employee){
        /*if (employee.roleEmployee.priority == 5){
            println("-*-*-*-*-*-**-*--**-*-*-*-*-*-*-*-*-*-*-")
        }*/
        if(params.pass != ""){
            employee.setPassword(params.pass)
        }
        employee.setRoleEmployee(RoleEmployee.get(params.int('role')))
        employee.setModifiedBy(springSecurityService.currentUser.getUsername())
        employee.setModifiedDate(new Date())
        employee.validate()
        redirect(controller: 'admin', action: 'employee')
    }

    def roleAssign(){
        def name = springSecurityService.currentUser.getUsername()
        def company = Employee.findByUsername(name).company
        def roles = RoleEmployee.list()
        render(view: 'selectEmployee', model: [username: name, company: company, roles: roles])
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def selectAction(Employee employee){
        def name = springSecurityService.currentUser.getUsername()
        if(params.modify.equals('Show')){
            render(view: 'empDetails', model: [username: name, employee: employee])
        }else if(params.modify.equals('Save')){
            def roleEmployee = RoleEmployee.findByName(params["role${employee.id}"])
            employee.setRoleEmployee(roleEmployee)
            employee.validate()
            if(employee.roleEmployee.accessibility.equals('normal')){
                render(view: 'employeeAssign', model: [username: name, employee: employee])
            }else {
                redirect(controller: 'secure')
            }
        }
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def saveEmployeeToManager(Employee employee){
        def empList = params.list('emplist')
        if(params.act.equals('Add')){
            for(def id : empList){
                employee.addToEmployees(Employee.get(Integer.parseInt(id)))
            }
        }else if(params.act.equals('Remove')){
            for(def id : empList){
                employee.removeFromEmployees(Employee.get(Integer.parseInt(id)))
            }
        }
        redirect(controller: 'admin', action: 'roleAssign')
    }

}
