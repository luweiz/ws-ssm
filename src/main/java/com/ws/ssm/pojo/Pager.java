package com.ws.ssm.pojo;

import java.util.List;

/**
 * 分页对象
 * 
 * @author Administrator
 * 
 * @param <T>
 */
public class Pager<T> {
    /**
     * 分页的大小
     */
    private long size;

    /**
     * 分页的起始页
     */
    private long offset;

    /**
     * 总记录数
     */
    private long total;

    /**
     * 分页的数据
     */
    private List<T> datas;
    /**
     * 分页数
     */
    private long pageNumber;

    
    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public long getOffset() {
        return offset;
    }

    public void setOffset(long offset) {
        this.offset = offset;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<T> getDatas() {
        return datas;
    }

    public void setDatas(List<T> datas) {
        this.datas = datas;
    }

//    public long getPageNumber() {
//        if (size==0) {
//            return Integer.valueOf(0);
//        }else{
//           return ((total%size)==0)?(total/size):((total/size)+1);
//        }
//    }
    

    public void setPageNumber(long pageNumber) {
        this.pageNumber = pageNumber;
    }

    public long getPageNumber() {
        return pageNumber;
    }
    
}
