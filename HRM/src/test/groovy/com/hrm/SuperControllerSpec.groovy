package com.hrm

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@Mock([Module])
@TestFor(SuperController)
class SuperControllerSpec extends Specification {
    def module
    def setup() {
        //def company = new Company('Excite','11111','active','101000','aaa@gmail.com','9148939424','Brookefield','Bangalore','Karnataka','India',2.0,12.0 )

    }

    def cleanup() {

    }

    void "test something"() {
        //def holiday = new Holiday('2017-01-01','Holi',2017)



        /*expect:"fix me"
            true == false*/
    }
}
