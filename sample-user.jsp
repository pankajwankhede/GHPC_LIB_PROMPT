# Page Migration Checklist

## Before Migration
- [ ] Identify JSP path
- [ ] Identify controller method
- [ ] Identify model attributes
- [ ] Identify includes/fragments
- [ ] Identify forms and POST actions
- [ ] Identify validation errors
- [ ] Identify JavaScript dependencies

## Conversion
- [ ] JSP moved to templates as `.html`
- [ ] JSTL conditions converted
- [ ] JSTL loops converted
- [ ] URLs converted to `@{}`
- [ ] Static files converted to `@{/css/...}` or `@{/js/...}`
- [ ] Forms converted to `th:object` / `th:field`
- [ ] CSRF preserved
- [ ] Fragments converted

## Testing
- [ ] GET page renders
- [ ] POST form submits
- [ ] Validation errors display
- [ ] Empty/null list behavior works
- [ ] Browser console has no JS errors
- [ ] Security scan has no new issues
