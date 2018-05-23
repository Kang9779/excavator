package bean;
import java.io.Serializable;
import java.util.List;

/**
 * 分页实体类
 * @param <E>
 */
public class PageBean<E> implements Serializable {
    private List<E> list;//结果集
    private Integer currPage;//当前页
    private Integer pageSize;//每页显示数量
    private Integer totalPage;//总页数
    private Integer totalCount;//总记录数

//    private Integer startpage;
//    private Integer endpage;
//    private Integer startsize;
//    private final Integer SHOWPAGE = 6;

    public List<E> getList() {
        return list;
    }

    public void setList(List<E> list) {
        this.list = list;
    }

    public Integer getCurrPage() {
        return currPage;
    }

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalPage() {
        return (int)Math.ceil(totalCount*1.0/pageSize);
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = (int)Math.ceil(totalCount*1.0/pageSize);
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public PageBean(){}

    public PageBean(List<E> list, Integer currPage, Integer pageSize, Integer totalCount) {
        super();
        this.list = list;
        this.currPage = currPage;
        this.pageSize = pageSize;
        this.totalCount = totalCount;
    }
}
