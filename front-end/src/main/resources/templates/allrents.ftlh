<#import "parts/common.ftlh" as c>

<@c.page title="Аренды">
    <h5>Аренды</h5>
    <ul class="nav nav-pills justify-content-center">
        <li class="nav-item">
            <a class="nav-link active" href="">Все</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/prerents?page=1&size=21">Неподтверждённые</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/rents?page=1&size=21">Подтверждённые</a>
        </li>
    </ul>
    <div class="card-columns">
        <#list rents as rent>
            <#if rent.confirmed>
                <div class="card border-success my-3">
            <#else>
                <div class="card border-primary my-3">
            </#if>
                <div class="m-2">
                    <#if rent.movieAccess>
                        <a href="/movie/${rent.movie.id}" style="color: #000000; ">
                            <span><b>${rent.movie.name}</b></span>
                        </a>
                        <i> (${rent.movie.year})</i>
                    <#else>
                        <span style="color: #800000; ">На данный момент название фильма недоступно</span>
                    </#if>
                    <p># ${rent.id}</p>
                </div>
                    <#if rent.confirmed>
                    <div class="card-footer text-success">
                        <p>Продолжительность аренды: ${rent.duration} д.</p>
                        <p>Стоимость аренды: $ ${rent.price}</p>
                    <#else>
                        <div class="card-footer text-primary">
                            <form action="/duration" method="post">
                                <label>Срок аренды в днях</label>
                                <div class="form-row align-items-center">
                                    <input type="hidden" name="rentId" value="${rent.id}"/>
                                    <div class="col-auto">
                                        <input type="number" name="duration" min="1" max="1000" value="${rent.duration}" class="form-control" aria-describedby="days">
                                    </div>
                                    <div class="col-auto">
                                        <button type="submit" class="btn btn-primary">Изменить</button>
                                    </div>
                                </div>
                            </form>
                            <p>Стоимость аренды: $ ${rent.price}</p>
                            <div class="form-row align-items-center">
                                <form action="/confirm" method="post">
                                    <input type="hidden" name="rentId" value="${rent.id}"/>
                                    <div class="col-auto">
                                        <button type="submit" class="btn btn-success">Подтвердить</button>
                                    </div>
                                </form>
                                <form action="/delete" method="post">
                                    <input type="hidden" name="rentId" value="${rent.id}"/>
                                    <div class="col-auto">
                                        <button type="submit" class="btn btn-danger">Удалить</button>
                                    </div>
                                </form>
                            </div>
                    </#if>
                </div>
            </div>
        <#else>
            <div class="container mt-5">
                Список пуст
            </div>
        </#list>
    </div>
    <#if realsize != 0>
        <div class="container mt-5"/>
        <#assign path="/allrents">
        <#include "parts/pagination.ftlh">
    </#if>
</@c.page>