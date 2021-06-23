<#--
<#import "parts/course.ftlh" as c>

<@c.page>
    List of users

    <div class="table-responsive">
        <table class="table table-hover">
            <thead class="active">
            <th>Id</th>
            <th>Name</th>
            <th>Role</th>
            <th></th>
            </thead>
            <tbody>
            <#list users as user>
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td><#list user.roles as role>${role}<#sep>, </#list></td>
                    <td><a href="/user/${user.id}">edit</a></td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</@c.page>-->
