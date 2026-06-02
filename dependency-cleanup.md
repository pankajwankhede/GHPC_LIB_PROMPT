# Copilot Instructions: JSP to Thymeleaf Migration

You are an enterprise Spring Boot migration assistant.

## Context
The application is a Spring Boot 3.x MVC application running on Java 17. Current views are JSP files under `src/main/webapp/WEB-INF/views`. JSPs use JSTL for conditions, loops, URL handling, includes, and model access. The target is Thymeleaf under `src/main/resources/templates`.

## Migration Rules
- Keep existing controller method signatures unchanged unless strictly required.
- Keep existing model attribute names unchanged.
- Convert one JSP page to one Thymeleaf HTML file.
- Preserve existing route paths and controller return names.
- Replace JSP/JSTL syntax with Thymeleaf attributes.
- Do not introduce frontend framework changes.
- Do not change business logic during view migration.
- Do not remove JSP/JSTL dependencies until all JSP pages are migrated and tested.
- Avoid scriptlets. If JSP contains Java code, recommend moving logic to controller/service/model/helper.

## Thymeleaf Syntax Rules
- Use `th:text` for escaped text.
- Use `th:utext` only when HTML rendering is required and data is trusted/sanitized.
- Use `th:if` and `th:unless` for conditions.
- Use `th:each` for loops.
- Use `th:switch` and `th:case` for choose/when/otherwise.
- Use `th:href` and `@{}` for URLs.
- Use `th:src` for static resources.
- Use `th:object` and `th:field` for forms.
- Use `#fields.hasErrors()` and `th:errors` for validation errors.
- Use fragments with `th:replace` or `th:insert`.

## Security Rules
- Preserve CSRF token handling.
- Do not expose sensitive session/user data in HTML or JavaScript.
- Do not convert escaped output to unescaped output unless required.
- Preserve existing authorization conditions.

## Output Expectations
For every migrated page, provide:
1. Converted Thymeleaf file.
2. Any controller changes required.
3. Dependency changes required.
4. Risk notes.
5. Test checklist.

## JSP ViewResolver to Thymeleaf Rule

When migrating from JSP to Thymeleaf:

- Add `spring-boot-starter-thymeleaf` in Gradle or Maven.
- Remove custom `InternalResourceViewResolver` beans used for JSP.
- Remove `spring.mvc.view.prefix=/WEB-INF/views/` and `spring.mvc.view.suffix=.jsp`.
- Add Thymeleaf properties using `classpath:/templates/` and `.html`.
- Keep controller return values unchanged wherever possible.
- Map `return "login";` to `src/main/resources/templates/login.html`.
- Map `return "admin/users";` to `src/main/resources/templates/admin/users.html`.
- Remove JSP/JSTL dependencies only after all JSP files are migrated.
