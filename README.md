# JSTL to Thymeleaf Rule Mapping

## Output
JSP:
```jsp
${user.name}
```
Thymeleaf:
```html
<span th:text="${user.name}"></span>
```

## If
JSP:
```jsp
<c:if test="${user.active}">Active</c:if>
```
Thymeleaf:
```html
<span th:if="${user.active}">Active</span>
```

## For each
JSP:
```jsp
<c:forEach var="role" items="${roles}">
  ${role.name}
</c:forEach>
```
Thymeleaf:
```html
<span th:each="role : ${roles}" th:text="${role.name}"></span>
```

## Choose
JSP:
```jsp
<c:choose>
  <c:when test="${user.role == 'ADMIN'}">Admin</c:when>
  <c:otherwise>User</c:otherwise>
</c:choose>
```
Thymeleaf:
```html
<div th:switch="${user.role}">
  <span th:case="'ADMIN'">Admin</span>
  <span th:case="*">User</span>
</div>
```

## URL
JSP:
```jsp
${pageContext.request.contextPath}/user/list
```
Thymeleaf:
```html
<a th:href="@{/user/list}">Users</a>
```
