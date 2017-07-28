package com.hrm

class Employee extends User{

    static hasMany = [employees: Employee, assets: Asset, leaves: Leaves]
    //static hasOne= [employeeLeave:  EmployeeLeave, roleEmployee: RoleEmployee]
    static belongsTo = [company : Company]

    RoleEmployee roleEmployee
    EmployeeLeave employeeLeave
    String firstName
    String middleName
    String lastName
    String email
    String phone
    String location
    String age
    Boolean isEmployee
    String createdBy
    Date createdDate
    String modifiedBy
    Date modifiedDate


    static constraints = {
        firstName nullable: true, blank: false
        middleName nullable: true, blank: false
        lastName nullable: true, blank: false
        location nullable: true, blank: false
        email nullable: true, blank: false
        phone nullable: true, blank: false
        age nullable: true, blank: false
        isEmployee nullable: true, blank:false
        createdBy nullable: true, blank: false
        createdDate nullable: true, blank: false
        modifiedBy nullable: true, blank: false
        modifiedDate nullable: true, blank: false
        company nullable: true, blank: false
        employeeLeave nullable: true, blank:false
    }


    static namedQueries = {

        findManagerByEmployee{ employeeId ->

            employees {eq 'id', employeeId}

        }

    }


    static mapping = {
        discriminator 'isEmployee'
        tablePerHierarchy true
    }
}

