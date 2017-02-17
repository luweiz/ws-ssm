package com.ws.ssm.utils;

import com.ws.ssm.pojo.Pager;

public class PageUtils {

    public static Pager setPagers(Pager pages) {
        Integer pageSize = SystemContext.getPageSize();
        Integer pageOffset = SystemContext.getPageOffset();
        if (pageOffset == null || pageOffset < 0)
            pageOffset = 0;
        if (pageSize == null || pageSize < 0)
            pageSize = 15;
        pages.setOffset(pageOffset);
        pages.setSize(pageSize);
        return pages;
    }
}
