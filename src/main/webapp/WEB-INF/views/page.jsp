<%--
  Created by IntelliJ IDEA.
  User: FWS
  Date: 2018/3/18
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    * {
        padding: 0;
        margin: 0;
    }
    /*
      * 外面盒子样式---自己定义
      */

    .page_div {
        margin-top: 20px;
        margin-bottom: 20px;
        font-size: 15px;
        font-family: "microsoft yahei";
        color: #666666;
        margin-right: 10px;
        padding-left: 20px;
        box-sizing: border-box;
    }
    /*
     * 页数按钮样式
     */

    .page_div a {
        min-width: 30px;
        height: 28px;
        border: 1px solid #dce0e0!important;
        text-align: center;
        margin: 0 4px;
        cursor: pointer;
        line-height: 28px;
        color: #666666;
        font-size: 13px;
        display: inline-block;
    }

    #firstPage,
    #lastPage {
        width: 50px;
        color: #0073A9;
        border: 1px solid #0073A9!important;
    }

    #prePage,
    #nextPage {
        width: 70px;
        color: #0073A9;
        border: 1px solid #0073A9!important;
    }

    .page_div .current {
        background-color: #0073A9;
        border-color: #0073A9;
        color: #FFFFFF;
    }

    .totalPages {
        margin: 0 10px;
    }

    .totalPages span,
    .totalSize span {
        color: #0073A9;
        margin: 0 5px;
    }
</style>


    <div value="1 0"></div>
    <div id="page" class="page_div"></div>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<%--<script type="text/javascript" src="js/paging.js"></script>--%>
<script type="text/javascript" src="<%=path%>/resources/js/paging/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/paging/paging.js"></script>
<script>

    //分页
    $("#page").paging({
        pageNo:${pageInfo.pageNum},
        totalPage:${pageInfo.pages},
        totalSize: ${pageInfo.total},
        callback: function(num) {
//            alert(num)
            window.location.href="<%=path%> /ysCar/getCar?pageNum="+num;
        }
    })

    /*
     // 模拟ajax数据用以下方法，方便用户更好的掌握用法
     //参数为当前页
     ajaxTest(1);

     function ajaxTest(num) {
     $.ajax({
     url: "table.json",
     type: "get",
     data: {},
     dataType: "json",
     success: function(data) {
     console.log(data);
     //分页
     $("#page").paging({
     pageNo: num,
     totalPage: data.totalPage,
     totalSize: data.totalSize,
     callback: function(num) {
     ajaxTest(num)
     }
     })
     }
     })
     }
     */
</script>
