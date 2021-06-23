<#import "parts/main.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <h4 class="mb-3">Add new user</h4>
    ${message!}
    <@l.login "/reg" true/>
</@c.page>