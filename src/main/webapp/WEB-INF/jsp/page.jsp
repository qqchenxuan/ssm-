<%@page pageEncoding="UTF-8"%> 
<div style="float:right; " >
	<span style="background: white;color: black;text-align: center;font-size: larger;">当前第${pd.page+1}页&nbsp;&nbsp;共${pd.count}页 </span>
		&nbsp;&nbsp;
	<c:if test="${pd.page==0}">
	<a href="${pd.url}?page=0&pageSize=${pd.pageSize}" onclick="return false" class="btn btn-small btn-success" >第一页</a>
	</c:if>
	<c:if test="${pd.page!=0}">
	<a href="${pd.url}?page=0&pageSize=${pd.pageSize}" class="btn btn-small btn-success">第一页</a>
	</c:if>
	&nbsp;&nbsp;
	<c:if test="${pd.page<=0}">
	<a href="${pd.url}?page=0&pageSize=${pd.pageSize}" onclick="return false" class="btn btn-small btn-success" >上一页</a>
	</c:if>
	<c:if test="${pd.page>0}">
	<a href="${pd.url}?page=${pd.page-1}&pageSize=${pd.pageSize}" class="btn btn-small btn-success" >上一页</a>
	</c:if>
	&nbsp;&nbsp;
	<c:if test="${pd.page>=pd.count-1}">
	<a href="${pd.url}?page=${pd.count-1}&pageSize=${pd.pageSize}" onclick="return false" class="btn btn-small btn-success">下一页</a>
	</c:if>
	<c:if test="${pd.page<pd.count-1}">
	<a href="${pd.url}?page=${pd.page+1}&pageSize=${pd.pageSize}" class="btn btn-small btn-success" >下一页</a>
	</c:if>
	&nbsp;&nbsp;
	<c:if test="${pd.page==pd.count-1||pd.count==0}">
	<a href="${pd.url}?page=${pd.count-1}&pageSize=${pd.pageSize}" onclick="return false" class="btn btn-small btn-success" >末一页</a>
	</c:if>
	<c:if test="${pd.page!=pd.count-1&&pd.count!=0}">
	<a href="${pd.url}?page=${pd.count-1}&pageSize=${pd.pageSize}" class="btn btn-small btn-success">末一页</a>
	</c:if>
	</div>