<#import "parts/main.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <h4 class="mb-3">Login page</h4>
    <@l.login "/login" false/>
</@c.page>