# JSP/JSTL to Thymeleaf Migration Guide

## 1. Add Thymeleaf

Maven:
```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-thymeleaf</artifactId>
</dependency>
```

Gradle:
```gradle
implementation 'org.springframework.boot:spring-boot-starter-thymeleaf'
```

## 2. Recommended folders

Before:
```text
src/main/webapp/WEB-INF/views/user.jsp
```

After:
```text
src/main/resources/templates/user.html
```

Fragments:
```text
src/main/resources/templates/fragments/header.html
src/main/resources/templates/fragments/footer.html
```

Static files:
```text
src/main/resources/static/css/app.css
src/main/resources/static/js/app.js
src/main/resources/static/images/logo.png
```

## 3. Controller rule

Usually this remains unchanged:
```java
@GetMapping("/user")
public String user(Model model) {
    model.addAttribute("user", userService.getUser());
    return "user";
}
```

## 4. JSP to Thymeleaf mapping

| JSP/JSTL | Thymeleaf |
|---|---|
| `${user.name}` | `<span th:text="${user.name}"></span>` |
| `<c:if test="${user.active}">` | `<div th:if="${user.active}">` |
| `<c:forEach var="item" items="${items}">` | `<div th:each="item : ${items}">` |
| `<c:choose>` | `th:switch` |
| `<jsp:include page="header.jsp"/>` | `<div th:replace="~{fragments/header :: header}"></div>` |
| `${pageContext.request.contextPath}/users` | `@{/users}` |
| `<form:input path="name"/>` | `<input th:field="*{name}"/>` |

## 5. Migration checklist

- Page renders successfully.
- URLs generate correctly with context path.
- Conditions render correctly.
- Lists/tables render correctly.
- Form values bind correctly.
- Validation errors display correctly.
- CSRF token is present for POST forms.
- Existing JavaScript still finds same IDs/classes.
- No sensitive data exposed.
