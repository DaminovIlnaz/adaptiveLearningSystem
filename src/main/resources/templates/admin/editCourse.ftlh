<#import "../parts/main.ftlh" as c>

<@c.page>

    <a class="btn btn-primary mb-3" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new guide
    </a>

    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" action="/addGuide/${course.id}">
                <div class="form-group mb-3">
                    <input type="text" class="form-control" name="name" placeholder="название урока" />
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <div class="form-group mb-3">
                    <button type="submit" class="btn btn-primary">Добавить</button>
                </div>
            </form>
        </div>
    </div>

    <#if course??>


        <div class="row justify-content-evenly p-4">
            <#list course.guides as c>
                <div class="col-5 m-3">
                    <div class="card ">
                        <div class="card-body">
                            <blockquote class="blockquote mb-0">
                                <p>${c.name}</p>
                            </blockquote>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </#if>
</@c.page>