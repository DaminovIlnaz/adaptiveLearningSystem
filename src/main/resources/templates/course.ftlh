<#import "parts/main.ftlh" as c>
<#include "parts/security.ftlh">
<#import "parts/main.ftlh" as c>

<@c.page>

    <div class="mb-5" style="max-width: 100%;">
        <div class="row g-0">
            <div class="col-md-4">
                <img class="img img-dark d-inline" style="max-width: 80%" src="https://spring.io/images/guides-7983d4cd334dbbf39734aebf3de91a4e.svg">

            </div>
            <div class="col-md-8">
                <div class="card-body text-center mt-5">
                    <h1 class="card-title text-start p-3">Courses</h1>
                    <p class="card-text">Whatever you're building, these guides are designed to get you productive as quickly as possible – using the latest Spring project releases and techniques as recommended by the Spring team.</p>
                </div>
            </div>
        </div>
    </div>

    <#if isAdmin>

        <div class="form-row mt-3">
            <div class="form-group col-md-6">
                <form method="post" action="/deleteCourse" class="form-inline">
                    <div class="input-group mb-3">
                        <input type="text" name="name" class="form-control" placeholder="Delete by name">
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                        <button type="submit" class="btn btn-outline-secondary">Delete course</button>
                    </div>
                </form>
            </div>
        </div>

        <a class="btn btn-primary mb-3" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            Add new guide
        </a>

        <div class="collapse" id="collapseExample">
            <div class="form-group mt-3">
                <form method="post" action="/addNewCourse">
                    <div class="form-group mb-3">
                        <input type="text" class="form-control" name="name" placeholder="название курса" />
                    </div>
                    <div class="form-group mb-3">
                        <input type="text" class="form-control" name="description" placeholder="описание курса">
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <div class="form-group mb-3">
                        <button type="submit" class="btn btn-primary">Добавить</button>
                    </div>
                </form>
            </div>
        </div>
    </#if>

    <div class="row row-cols-1 row-cols-md-3 g-4 pb-3">
    <#if courses??>
        <#list courses as course>
            <a href="/guide?courseId=${course.id}&userId=${user.id}" style="text-decoration: none" class="text-dark">
                <div class="col">
                    <div class="card h-100">
                        <div class="card-header bg-transparent">Шапка</div>
                        <div class="card-body">
                            <h5 class="card-title">${course.name}</h5>
                            <p class="card-text">${course.description}</p>
                        </div>
                        <div class="card-footer bg-transparent">Подвал</div>
                    </div>
                </div>
            </a>
        </#list>
    <#else>
        <p class="pt-2">No message</p>
    </#if>

</@c.page>