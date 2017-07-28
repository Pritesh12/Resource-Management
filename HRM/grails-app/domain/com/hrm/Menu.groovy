package com.hrm

class Menu {

    static belongsTo = [module : Module]

    String name
    Menu parent

    static constraints = {
        name nullable: true, blank: false
        parent nullable: true, blank: false
    }
}
