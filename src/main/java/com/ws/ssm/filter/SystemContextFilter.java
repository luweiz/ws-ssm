package com.ws.ssm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.ws.ssm.utils.SystemContext;


public class SystemContextFilter implements Filter {

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException,
            ServletException {
        Integer pageSize = 10;
        Integer offset= 1;
        try {
            offset = Integer.parseInt(req.getParameter("offset"));
        } catch (NumberFormatException e) {
            offset = 1;
        }
        if (offset < 1) {
            offset = 1;
        }
        try {
            pageSize = Integer.parseInt(req.getParameter("pageSize"));
        } catch (NumberFormatException e) {
            pageSize = 10;
        }
        try {
            SystemContext.setPageOffset(offset);
            SystemContext.setPageSize(pageSize);
            SystemContext.setRealPath(((HttpServletRequest) req).getSession().getServletContext()
                    .getRealPath("/"));
            chain.doFilter(req, resp);
        } finally {
            SystemContext.removePageOffset();
            SystemContext.removePageSize();
            SystemContext.removeRealPath();
        }
    }

    @Override
    public void init(FilterConfig cfg) throws ServletException {
    }

}
