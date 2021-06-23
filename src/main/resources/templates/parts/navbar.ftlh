<#include "security.ftlh">
<#import "main.ftlh" as c>
<#import "login.ftlh" as l>

<nav class="navbar navbar-expand-lg navbar-light bg-light px-5" >
    <a class="navbar-brand" href="/">Adaptive it</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Main</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/courses">Сourses</a>
            </li>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">Edit</a>
                </li>
            </#if>
        </ul>

    </div>
    <div class="navbar-text p-3 pull-right">
        ${name}
    </div>
    <#if user??>
        <@l.logout />
    </#if>
</nav>