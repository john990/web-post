package com.psy.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by kai.wang on 12/3/13.
 */
@Controller
@RequestMapping("")
public class CommonController {

    @RequestMapping(value = "success", method = RequestMethod.GET)
    public String success() {
        return "success";
    }
}
