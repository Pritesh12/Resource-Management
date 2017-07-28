package com.hrm

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.transaction.annotation.Propagation

@Secured('permitAll')
class SignUpController {

    def testRole
    def testuser

    def signUpPage() {
        def moduleNames = Module.list().moduleName
        def usernames = User.list().username
        def companyNames = Company.list().companyName
        render (view: 'signUp', model: [modules: moduleNames, users:usernames, companies: companyNames])
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def saveSignup(Company company, Employee employee, User user){
        def date = new Date()

        //Company Save----------------------------
        company.setEmail(params.companyEmail)
        company.setPhone(params.companyPhone)
        company.setCreatedDate(date)
        company.setCreatedBy(params.username)
        if(!(params.data.equals(""))){
            String selectedModule = params.data
            String [] moduleNames = selectedModule.split(",")
            for(String moduleName : moduleNames){
                def module = Module.findByModuleName(moduleName)
                company.addToModules(module).save()
            }
        }
        company.save(flush:true)

        //Employee save---------------------------
        employee.setEmail(params.employeeEmail)
        employee.setPhone(params.employeePhone)
        employee.setCreatedBy(params.username)
        employee.setCreatedDate(date)
        //Employee Role---------------------------
        employee.setRoleEmployee(RoleEmployee.findByAccessibility("high"))
        //Employee Leaves--------------------------
        EmployeeLeave employeeLeave = new EmployeeLeave()
        employeeLeave.setEarnLeave(0)
        employeeLeave.setUsedLeave(0)
        employeeLeave.setRemainingLeave(0)
        employeeLeave.setCreatedBy(params.username)
        employeeLeave.setCreatedDate(date)
        employee.setEmployeeLeave(employeeLeave)
        company.addToEmployees(employee)
        employee.save()

        //User Save--------------------------------
        testuser= user.save(failonError: true)
        testRole=  Role.findByAuthority('ROLE_ADMIN')
        UserRole.create(testuser,testRole)
        redirect(uri: "/")
    }
}
