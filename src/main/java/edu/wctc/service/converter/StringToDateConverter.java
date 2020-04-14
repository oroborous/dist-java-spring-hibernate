package edu.wctc.service.converter;

import edu.wctc.DateUtils;
import org.springframework.core.convert.converter.Converter;

import java.time.LocalDate;

public class StringToDateConverter implements Converter<String, LocalDate> {
    /*
     * Source is guaranteed to not be null, see:
     * https://docs.spring.io/spring/docs/4.1.3.RELEASE/spring-framework-reference/htmlsingle/#core-convert
     */
    @Override
    public LocalDate convert(String source) {
        return DateUtils.parseWebDate(source);
    }
}
