# Prompt: Scan JSP Before Migration

Act as a Spring Boot 3 MVC migration architect.

Analyze this JSP file and produce a migration report before converting it to Thymeleaf.

Check for:
- JSTL tags: c:if, c:choose, c:forEach, fmt, fn
- Spring form tags
- JSP includes
- Scriptlets
- Model attributes used
- Request/session attributes used
- URLs using contextPath
- Static resource links
- CSRF usage
- JavaScript dependencies on generated HTML
- Risky unescaped output

Output:
1. Page purpose
2. Model attributes required
3. JSTL/Spring tag usage summary
4. Thymeleaf conversion strategy
5. Required controller changes, if any
6. Security risks
7. Test cases
