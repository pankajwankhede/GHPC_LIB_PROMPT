# Agent Workflow

Use this workflow for each JSP page.

1. Locate JSP and controller.
2. Run scan prompt.
3. Create Thymeleaf equivalent.
4. Keep model attributes unchanged.
5. Convert includes to fragments.
6. Convert URLs to Thymeleaf `@{}`.
7. Convert forms to `th:object` and `th:field`.
8. Preserve CSRF.
9. Run review prompt.
10. Add checklist result to migration report.

Recommended branch naming:
```text
feature/migrate-jsp-to-thymeleaf-<page-name>
```

Recommended commit message:
```text
Migrate <page-name> JSP view to Thymeleaf
```
