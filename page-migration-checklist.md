# Prompt: Convert JSP to Thymeleaf

Convert the provided JSP file to Thymeleaf HTML for Spring Boot 3.x and Java 17.

Rules:
- Keep model attribute names unchanged.
- Keep HTML IDs/classes unchanged unless impossible.
- Preserve JavaScript compatibility.
- Replace JSTL with Thymeleaf.
- Replace JSP includes with Thymeleaf fragments.
- Replace contextPath URLs with `@{}` syntax.
- Replace Spring form tags with `th:object` and `th:field`.
- Preserve CSRF tokens.
- Do not change controller business logic.
- Avoid `th:utext` unless absolutely required.

Output:
1. Full Thymeleaf HTML file.
2. Fragment files if needed.
3. Controller changes only if needed.
4. Dependency changes.
5. Test checklist.
