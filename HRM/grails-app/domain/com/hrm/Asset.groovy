package com.hrm

class Asset {

    static belongsTo = [company: Company]

    String name
    String type
    String issueDate
    String serialNo
    String productID
    String createdBy
    Date createdDate
    String modifiedBy
    Date modifiedDate
    Employee employee

    static constraints = {
        name nullable: true, blank: false
        type nullable: true, blank: false
        issueDate nullable: true, blank: false
        serialNo nullable: true, blank: false
        productID nullable: true, blank: false
        createdBy nullable: true, blank: false
        createdDate nullable: true, blank: false
        modifiedBy nullable: true, blank: false
        modifiedDate nullable: true, blank: false
        employee nullable: true, blank: false
    }
}
