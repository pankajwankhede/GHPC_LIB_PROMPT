# JSP ViewResolver Removal and Thymeleaf Dependency Setup

## Purpose
This guide helps migrate Spring Boot 3.x + Java 17 MVC applications from JSP/JSTL rendering to Thymeleaf rendering with minimal controller changes.

## Gradle Dependency

### build.gradle
```gradle
dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-thymeleaf'
}
```

### build.gradle.kts
```kotlin
dependencies {
    implementation("org.springframework.boot:spring-boot-starter-thymeleaf")
}
```

## Maven Dependency

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-thymeleaf</artifactId>
</dependency>
```

## Remove JSP ViewResolver

Remove this bean if present:

```java
@Bean
public InternalResourceViewResolver viewResolver() {
    InternalResourceViewResolver resolver = new InternalResourceViewResolver();
    resolver.setPrefix("/WEB-INF/views/");
    resolver.setSuffix(".jsp");
    return resolver;
}
```

Remove this import:

```java
import org.springframework.web.servlet.view.InternalResourceViewResolver;
```

## Remove JSP MVC Properties

Remove:

```properties
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
```

## Add Thymeleaf Properties

```properties
spring.thymeleaf.prefix=classpath:/templates/
spring.thymeleaf.suffix=.html
spring.thymeleaf.mode=HTML
spring.thymeleaf.encoding=UTF-8
spring.thymeleaf.cache=false
```

For production:

```properties
spring.thymeleaf.cache=true
```

## Controller View Name Rule

Most controllers do not need changes.

```java
return "login";
```

resolves to:

```text
src/main/resources/templates/login.html
```

```java
return "admin/users";
```

resolves to:

```text
src/main/resources/templates/admin/users.html
```

## Remove JSP/JSTL Dependencies After Migration

Remove these only when no JSP remains:

```gradle
implementation 'jakarta.servlet.jsp.jstl:jakarta.servlet.jsp.jstl-api'
runtimeOnly 'org.glassfish.web:jakarta.servlet.jsp.jstl'
implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
```

## Validation Checklist

- [ ] Thymeleaf starter added
- [ ] JSP ViewResolver removed
- [ ] `spring.mvc.view.prefix/suffix` removed
- [ ] Thymeleaf properties added
- [ ] HTML templates placed under `src/main/resources/templates`
- [ ] Controller view names preserved
- [ ] No duplicate view resolver conflict
- [ ] No missing template error
- [ ] JSP/JSTL dependencies removed after full migration
