package com.hrm

class RoleEmployee {

    String name
    String type
    String accessibility
    Integer priority
    String createdBy
    Date createdDate
    String modifiedBy
    Date modifiedDate

    static constraints = {
        name nullable: true, blank: false
        type nullable: true, blank: false
        accessibility nullable: true, blank: false
        priority nullable: true, blank: false
        createdBy nullable: true, blank: false
        createdDate nullable: true, blank: false
        modifiedBy nullable: true, blank: false
        modifiedDate nullable: true, blank: false
    }
}
