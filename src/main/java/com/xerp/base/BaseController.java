package com.xerp.base;

import com.alibaba.fastjson.JSON;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Joseph.L
 * @date 2019-10-29
 * @description BaseController
 */
public abstract class BaseController {

    /**
     * 视图模型
     */
    public ModelAndView modelAndView;

    /**
     * 查詢所有數據
     */
    public String listData() {
        return null;
    }

    /**
     * 查詢所有數據
     *
     * @param uuid
     * @return String
     */
    public String getByUuid(String uuid) {
        return null;
    }

    /**
     * 查詢所有數據
     *
     * @param code
     * @return String
     */
    public String getByCode(String code) {
        return null;
    }

    /**
     * 修改和新增數據
     *
     * @return String
     */
    public String saveData() {
        return null;
    }

    /**
     * 刪除數據
     *
     * @return String
     */
    public String deleteData() {
        return null;
    }


    /**
     * 返回JSON字符串
     *
     * @param response
     * @param object
     * @return
     */
    protected void printString(HttpServletResponse response, Object object) {
        printString(response, JSON.toJSONString(object));
    }

    /**
     * 打印字符串到页面
     *
     * @param response
     * @param string
     * @return
     */
    protected void printString(HttpServletResponse response, String string) {
        try {
            response.reset();
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(string);
        } catch (IOException e) {

        }
    }
}
