package com.hrm

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@Mock([Holiday,Company])
@TestFor(HolidayController)
class HolidayControllerSpec extends Specification {

    def company, holiday,obj
    def setup() {
        /*company = new Company(1,0,'Excite','11111','active','101000','aaa@gmail.com','9148939424','Brookefield','Bangalore','Karnataka','India',2.0,12.0 )
        company.save()*/
    }

    def cleanup() {
    }

    void "test save holiday"() {

        obj = new HolidayController()
        String str = obj.hi()
        assertEquals "Hello", str

        /*holiday = new Holiday('2017-01-01','Holi',2017)
        company.addToHolidays(holiday)
        holiday.save()
        assert response.redirectedUrl == '/holiday/holiday'*/

        /*expect:"fix me"
            true == false*/
    }
}
