<#macro login
path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row mb-2">
            <label class="col-sm-2 col-form-label">User Name :</label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" placeholder="User name" />
            </div>
        </div>
        <div class="form-group row mb-2">
            <label class="col-sm-2 col-form-label">Password:</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Password" />
            </div>
        </div>

        <div class="form-group row mb-2">
            <label class="col-sm-2 col-form-label"><#if !isRegisterForm><a href="/reg">Add new user</a></#if></label>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="col-sm-6">
                <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
            </div>
        </div>
    </form>
</#macro>

<#macro logout>
    <form class="pull-right" action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Sign Out</button>
    </form>
</#macro>
