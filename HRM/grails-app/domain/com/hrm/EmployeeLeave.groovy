package com.hrm

class EmployeeLeave {

    static belongsTo = [employee: Employee]

    Double earnLeave
    Double usedLeave
    Double remainingLeave
    String createdBy
    Date createdDate
    String modifiedBy
    Date modifiedDate

    static constraints = {
        earnLeave nullable: true, blank: false
        usedLeave nullable: true, blank: false
        remainingLeave nullable: true, blank: false
        createdBy nullable: true, blank: false
        createdDate nullable: true, blank: false
        modifiedBy nullable: true, blank: false
        modifiedDate nullable: true, blank: false
    }
}
