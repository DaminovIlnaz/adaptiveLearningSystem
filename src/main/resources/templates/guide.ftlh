<#import "parts/main.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>

    <#if isAdmin>
        <div class="d-grid gap-2 col-10 text-center mx-auto mt-2" style="margin-top: 150px">

            <div class="align-self-center">
                <a class="btn btn-primary col-sm-8" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample" style="max-width: 650px;">
                    Редактировать компетенции
                </a>

                <div class="collapse mt-5" id="collapseExample">

                    <div class="row g-3">
                        <div class="col-auto">
                            <input id="liczba" type="text" class="form-control" id="inputPassword2" placeholder="название">
                        </div>
                        <div class="col-auto">
                            <button id="myBtn" type="submit" class="btn btn-primary mb-3">Введите компетенцию</button>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table id="tbl" class="table">
                            <thead>
                            <tr id="tdh">
                                <th scope="col">#</th>
                                <th scope="col">c1</th>
                                <th scope="col">c2</th>
                                <th scope="col">c3</th>
                                <th scope="col">c4</th>
                                <th scope="col">c5</th>

                            </tr>
                            </thead>
                            <tbody id="tbd">
                                <tr>
                                    <th scope="col"><small>c1</small></th>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                                <tr>
                                    <th scope="col">c2</th>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                                <tr>
                                    <th scope="col">c3</th>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                                <tr>
                                    <th scope="col">c4</th>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                                <tr>
                                    <th scope="col">c4</th>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="col-auto">
                            <button id="competenceWidth" class="btn btn-primary col-sm-3 float-md-end mb-4" type="submit">Сохранить</button>
                        </div>
                    </div>
                </div>
            </div>

            <form method="get" action="/editTest/${state.getCourse().id}" class="form-inline">
                <button class="btn btn-primary col-sm-8" type="submit">Редактировать начальное тестирование</button>
            </form>
            <form method="get" action="/editCourse/${state.getCourse().id}" >
                <button class="btn btn-primary col-sm-8" type="submit">Редактировакть гайды</button>
            </form>
            <form method="get" action="/editTest/${state.getCourse().id}" class="form-inline">
                <button class="btn btn-primary col-sm-8" type="submit">Редактировать промежуточные тестирования</button>
            </form>
        </div>
        <script>

            document.getElementById('competenceWidth').onclick = testF

            function testF(){
                var tds = document.getElementsByTagName("td")
                var trs = document.getElementsByTagName("tr")
                var res = ''
                for (let i = 0; i < tds.length; i++) {
                    res += tds[i].innerHTML + " "
                }

                console.log(res)


                $.ajax({
                    type: "get",
                    url: "http://localhost:8080/addCompetence",
                    data: {'res': res, 'count': trs.length},
                    success: function(msg){
                        alert( "Прибыли данные: " + msg );
                    }
                });

            }




            document.getElementById("myBtn").onclick = dodajWiersz;

            function dodajWiersz() {
                var wiersz1 = document.createElement("tr");
                var tdNumer = document.createElement("th");
                var thNumer = document.createElement("th");
                var val1 = document.getElementById("liczba").value;
                tdNumer.innerHTML = val1;
                thNumer.innerHTML = val1;

                wiersz1.appendChild(tdNumer);
                var dodac1 = document.getElementById("tbd");
                var dodac2 = document.getElementById("tdh");
                dodac1.appendChild(wiersz1);
                dodac2.appendChild(thNumer);

                var allTr = document.getElementsByTagName("tr")
                for (let i = 1; i < allTr[0].childElementCount-1; i++) {
                    var tdNumer = document.createElement("td");
                    tdNumer.innerHTML = 0;
                    allTr[allTr.length-1].appendChild(tdNumer)
                }
                for (let i = 1; i < allTr.length; i++) {
                    var tdNumer = document.createElement("td");
                    tdNumer.innerHTML = 0;
                    allTr[i].appendChild(tdNumer)
                }
            }

        </script>
    <#else>
        <#if state.state == -1>
            <h3 class="text-center">Пройдите тестирование, если вы имеете знания по данной теме или начните изучение курса с нуля.</h3>
            <div class="d-grid gap-2 col-10 text-center mx-auto mt-5">
                <form method="get" action="/startGuide/${state.id}" >
                    <button class="btn btn-primary col-sm-8" type="submit">Начать с начала</button>
                </form>
                <form method="get" action="/startFirstTest/${state.id}" class="form-inline">
                        <button class="btn btn-primary col-sm-8" type="submit">Пройти тестирование</button>
                </form>
            </div>
        </#if>
        <#if state.state == 2>

                <div class="container col-10 mb-5" role="alert">
                    <h5 class="alert-heading">Вопрос 1</h5>
                    <p>Что такое ООП?</p>
                    <hr class="m-1">
                    <div class="form-check fw-lighter lh-sm">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <label class="form-check-label " for="flexRadioDefault1">
                            Объектно-ориентированное программирование — методология программирования, основанная на представлении программы в виде совокупности объектов, каждый из которых является экземпляром определенного класса, а классы образуют иерархию наследования.
                        </label>
                    </div>
                    <div class="form-check fw-lighter lh-sm">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <label class="form-check-label" for="flexRadioDefault1">
                            Объектно-ориентированное программирование — так называют любой тип программирования, в котором используются понятия высокого уровня и, в отличие от Assembler, в котором не работают напрямую с ячейками памяти ПК.
                        </label>
                    </div>
                    <div class="form-check fw-lighter lh-sm fs-10">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <label class="form-check-label" for="flexRadioDefault1">
                            Объектно-ориентированное программирование — просто красивое понятие. Если вдуматься, оно не несет дополнительной смысловой нагрузки, просто программисты любят аббревиатуры, так области их знаний выглядят сложнее.
                        </label>
                    </div>
                </div>
            <div class="container col-10 mb-5" role="alert">
                <h5 class="alert-heading">Вопрос 1</h5>
                <p>Что такое класс в Java?</p>
                <hr class="m-1">
                <div class="form-check fw-lighter lh-sm">
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                    <label class="form-check-label " for="flexRadioDefault1">
                        Уровень сложности программы. Все операторы делятся на классы в зависимости от сложности их использования.
                    </label></label>
                </div>
                <div class="form-check fw-lighter lh-sm">
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                    <label class="form-check-label" for="flexRadioDefault1">
                        Базовый элемент объектно-ориентирован­ного программирования в языке Java.
                    </label>
                </div>
                <div class="form-check fw-lighter lh-sm fs-10">
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                    <label class="form-check-label" for="flexRadioDefault1">
                        Такое понятие есть только в C++, в Java такого понятия нет.
                    </label>
                </div>
            </div>
            <div class="container col-10 mb-5" role="alert">
                <h5 class="alert-heading">Вопрос 1</h5>
                <p>Что выведется в результате этого кода?</p>
                <img src="https://thumb.tildacdn.com/tild3539-6637-4038-a532-303236643832/-/format/webp/q_4.png">
                <hr class="m-1">
                <div class="form-check fw-lighter lh-sm">
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                    <label class="form-check-label " for="flexRadioDefault1">
                        Вы успешно прочитали это важное сообщение. Это пример текста немного длиннее, так что вы увидите, как работают отступы в сообщениях уведомлений.
                    </label>
                </div>
                <div class="form-check fw-lighter lh-sm">
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                    <label class="form-check-label" for="flexRadioDefault1">
                        Вы успешно прочитали это важное сообщение. Это пример текста немного длиннее, так что вы увидите, как работают отступы в сообщениях уведомлений.                </label>
                </div>
                <div class="form-check fw-lighter lh-sm fs-10">
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                    <label class="form-check-label" for="flexRadioDefault1">
                        Вы успешно прочитали это важное сообщение. Это пример текста немного длиннее, так что вы увидите, как работают отступы в сообщениях уведомлений.                </label>
                </div>
            </div>
            <div class="container col-10 mb-5" role="alert">
                <h5 class="alert-heading">Вопрос 1</h5>
                <p>Вы успешно прочитали это важное сообщение. Это пример текста немного длиннее, так что вы увидите, как работают отступы в сообщениях уведомлений.</p>
                <hr class="m-1">
                <div class="form-check fw-lighter lh-sm">
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                    <label class="form-check-label " for="flexRadioDefault1">
                        Вы успешно прочитали это важное сообщение. Это пример текста немного длиннее, так что вы увидите, как работают отступы в сообщениях уведомлений.
                    </label>
                </div>
                <div class="form-check fw-lighter lh-sm">
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                    <label class="form-check-label" for="flexRadioDefault1">
                        Вы успешно прочитали это важное сообщение. Это пример текста немного длиннее, так что вы увидите, как работают отступы в сообщениях уведомлений.                </label>
                </div>
                <div class="form-check fw-lighter lh-sm fs-10">
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                    <label class="form-check-label" for="flexRadioDefault1">
                        Вы успешно прочитали это важное сообщение. Это пример текста немного длиннее, так что вы увидите, как работают отступы в сообщениях уведомлений.                </label>
                </div>
            </div>
            <div class="container col-10 mb-5" role="alert">
                <h5 class="alert-heading">Вопрос 1</h5>
                <p>Вы успешно прочитали это важное сообщение. Это пример текста немного длиннее, так что вы увидите, как работают отступы в сообщениях уведомлений.</p>
                <hr class="m-1">
                <div class="form-check fw-lighter lh-sm">
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                    <label class="form-check-label " for="flexRadioDefault1">
                        Вы успешно прочитали это важное сообщение. Это пример текста немного длиннее, так что вы увидите, как работают отступы в сообщениях уведомлений.
                    </label>
                </div>
                <div class="form-check fw-lighter lh-sm">
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                    <label class="form-check-label" for="flexRadioDefault1">
                        Вы успешно прочитали это важное сообщение. Это пример текста немного длиннее, так что вы увидите, как работают отступы в сообщениях уведомлений.                </label>
                </div>
                <div class="form-check fw-lighter lh-sm fs-10">
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                    <label class="form-check-label" for="flexRadioDefault1">
                        Вы успешно прочитали это важное сообщение. Это пример текста немного длиннее, так что вы увидите, как работают отступы в сообщениях уведомлений.                </label>
                </div>
            </div>
            <div class="d-grid gap-2 col-10 text-center mx-auto pb-5">
                <form method="get" action="/startFirstTest/${state.id}" class="form-inline">
                    <button class="btn btn-primary col-sm-8" type="submit">Перейти к следующим вопросам <i class="bi bi-chevron-right"></i></button>

                </form>
            </div>

        </#if>
        <#if state.state == 0>
            <div class="container pb-5">
                <h1 class="title">Типы данных</h1>
                <div>
                    <p>
                        Одной из основных особенностей Java является то, что данный язык является строго типизированным. А это значит, что каждая переменная и константа представляет определенный тип и данный тип строго определен. Тип данных определяет диапазон значений, которые может хранить переменная или константа.

                        Итак, рассмотрим систему встроенных базовых типов данных, которая используется для создания переменных в Java. А она представлена следующими типами.                </p>


                    <div class="col-8">
                        <table class="table col-3">
                            <thead>
                            <tr>
                                <th colspan="2">boolean: хранит значение true или false</th>
                            </tr>
                            </thead>
                            <tr>
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                    <div>2</div>
                                </td>
                                <td class="code">
                                    <div class="container">
                                        <div>
                                            <code>boolean isActive = false;</code>
                                        </div>
                                        <div>
                                            <code>boolean isAlive = true;</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="table col-3">
                            <thead>
                            <tr>
                                <th colspan="2">byte: хранит целое число от -128 до 127 и занимает 1 байт</th>
                            </tr>
                            </thead>
                            <tr class="">
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                    <div>2</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>byte a = 3;</code>
                                        </div>
                                        <div>
                                            <code>byte b = 8;</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="table col-3">
                            <thead>
                            <tr>
                                <th colspan="2">short: хранит целое число от -32768 до 32767 и занимает 2 байта</th>
                            </tr>
                            </thead>
                            <tr class="">
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                    <div>2</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>short a = 3;</code>
                                        </div>
                                        <div>
                                            <code>short b = 8;</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="table col-3">
                            <thead>
                            <tr>
                                <th colspan="2">int: хранит целое число от -2147483648 до 2147483647 и занимает 4 байта</th>
                            </tr>
                            </thead>
                            <tr class="">
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                    <div>2</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>int a = 4;</code>
                                        </div>
                                        <div>
                                            <code>int b = 9;</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="table col-3">
                            <thead>
                            <tr>
                                <th colspan="2">long: хранит целое число от –9 223 372 036 854 775 808 до 9 223 372 036 854 775 807 и занимает 8 байт</th>
                            </tr>
                            </thead>
                            <tr class="">
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                    <div>2</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>long a = 5;</code>
                                        </div>
                                        <div>
                                            <code>long b = 10;</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="table col-3">
                            <thead>
                            <tr>
                                <th colspan="2">double: хранит число с плавающей точкой от ±4.9*10-324 до ±1.8*10308 и занимает 8 байт</th>
                            </tr>
                            </thead>
                            <tr class="">
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                    <div>2</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>double x = 8.5;</code>
                                        </div>
                                        <div>
                                            <code>double y = 2.7;</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="table col-3">
                            <thead>
                            <tr>
                                <th colspan="2">float: хранит число с плавающей точкой от -3.4*1038 до 3.4*1038 и занимает 4 байта</th>
                            </tr>
                            </thead>
                            <tr class="">
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                    <div>2</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>float x = 8.5F;</code>
                                        </div>
                                        <div>
                                            <code>float y = 2.7F;</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                    <p>При этом переменная может принимать только те значения, которые соответствуют ее типу. Если переменная представляет целочисленный тип, то она не может хранить дробные числа.</p>
                    <h4>
                        Целые числа
                    </h4>
                    <p>Все целочисленные литералы, например, числа 10, 4, -5, воспринимаются как значения типа int, однако мы можем присваивать целочисленные литералы другим целочисленным типам: byte, long, short. В этом случае Java автоматически осуществляет соответствующие преобразования:</p>
                    <div class="col-8">
                        <table class="table col-3">
                            <tr class="">
                                <thead>
                                <tr>
                                    <th colspan="2"></th>
                                </tr>
                                </thead>
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                    <div>2</div>
                                    <div>3</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>byte a = 1;</code>
                                        </div>
                                        <div>
                                            <code>short b = 2;</code>
                                        </div>
                                        <div>
                                            <code>long c = 2121;</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p>Однако если мы захотим присвоить переменной типа long очень большое число, которое выходит за пределы допустимых значений для типа int, то мы столкнемся с ошибкой во время компиляции:</p>
                    <div class="col-8">
                        <table class="table col-3">
                            <tr class="">
                                <thead>
                                <tr>
                                    <th colspan="2"></th>
                                </tr>
                                </thead>
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>long num = 2147483649</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p>Здесь число 2147483649 является допустимым для типа long, но выходит за предельные значения для типа int. И так как все целочисленные значения по умолчанию расцениваются как значения типа int, то компилятор укажет нам на ошибку. Чтобы решить проблему, надо добавить к числу суффикс l или L, который указывает, что число представляет тип long:</p>
                    <div class="col-8">
                        <table class="table col-3">
                            <tr class="">
                                <thead>
                                <tr>
                                    <th colspan="2"></th>
                                </tr>
                                </thead>
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>long num = 2147483649L;</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p>Как правило, значения для целочисленных переменных задаются в десятичной системе счисления, однако мы можем применять и другие системы счисления. Например:</p>
                    <div class="col-8">
                        <table class="table col-3">
                            <tr class="">
                                <thead>
                                <tr>
                                    <th colspan="2"></th>
                                </tr>
                                </thead>
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                    <div>2</div>
                                    <div>3</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>int num111 = 0x6F; // 16-тиричная система, число 111</code>
                                        </div>
                                        <div>
                                            <code>int num8 = 010; // 8-ричная система, число 8
                                            </code>
                                        </div>
                                        <div>
                                            <code>int num13 = 0b1101; // 2-ичная система, число 13</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p>Для задания шестнадцатеричного значения после символов 0x указывается число в шестнадцатеричном формате. Таким же образом восьмеричное значение указывается после символа 0, а двоичное значение - после символов 0b.</p>
                    <p>Также целые числа поддерживают разделение разрядов числа с помощью знака подчеркивания:</p>
                    <div class="col-8">
                        <table class="table col-3">
                            <tr class="">
                                <thead>
                                <tr>
                                    <th colspan="2"></th>
                                </tr>
                                </thead>
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                    <div>2</div>
                                    <div>3</div>
                                    <div>4</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>int x = 123_456;</code>
                                        </div>
                                        <div>
                                            <code>int y = 234_567__789;</code>
                                        </div>
                                        <div>
                                            <code>System.out.println(x);  // 123456</code>
                                        </div>
                                        <div>
                                            <code>System.out.println(y);  // 234567789</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <h4>Числа с плавающей точкой</h4>
                    <p>При присвоении переменной типа float дробного литерала с плавающей точкой, например, 3.1, 4.5 и т.д., Java автоматически рассматривает этот литерал как значение типа double. И чтобы указать, что данное значение должно рассматриваться как float, нам надо использовать суффикс f:</p>
                    <div class="col-8">
                        <table class="table col-3">
                            <tr class="">
                                <thead>
                                <tr>
                                    <th colspan="2"></th>
                                </tr>
                                </thead>
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                    <div>2</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>float fl = 30.6f;</code>
                                        </div>
                                        <div>
                                            <code>double db = 30.6;</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p>И хотя в данном случае обе переменных имеют практически одно значения, но эти значения будут по-разному рассматриваться и будут занимать разное место в памяти.</p>
                    <h4>Символы и строки</h4>
                    <p>В качестве значения переменная символьного типа получает одиночный символ, заключенный в одинарные кавычки: char ch='e';. Кроме того, переменной символьного типа также можно присвоить целочисленное значение от 0 до 65535. В этом случае переменная опять же будет хранить символ, а целочисленное значение будет указывать на номер символа в таблице символов Unicode (UTF-16). Например:</p>
                    <div class="col-8">
                        <table class="table col-3">
                            <tr class="">
                                <thead>
                                <tr>
                                    <th colspan="2"></th>
                                </tr>
                                </thead>
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                    <div>2</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>char ch=102; // символ 'f' </code>
                                        </div>
                                        <div>
                                            <code>System.out.println(ch);</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p>Еще одной формой задания символьных переменных является шестнадцатеричная форма: переменная получает значение в шестнадцатеричной форме, которое следует после символов "\u". Например, char ch='\u0066'; опять же будет хранить символ 'f'.</p>
                    <p>Символьные переменные не стоит путать со строковыми, 'a' не идентично "a". Строковые переменные представляют объект String, который в отличие от char или int не является примитивным типом в Java:</p>
                    <div class="col-8">
                        <table class="table col-3">
                            <tr class="">
                                <thead>
                                <tr>
                                    <th colspan="2"></th>
                                </tr>
                                </thead>
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                    <div>2</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>String hello = "Hello...";    </code>
                                        </div>
                                        <div>
                                            <code>System.out.println(hello);</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p>Кроме собствено символов, которые представляют буквы, цифры, знаки препинания, прочие символы, есть специальные наборы символов, которые называют управляющими последовательностями. Например, самая популярная последовательность - "\n". Она выполняет перенос на следующую строку. Например:</p>
                    <div class="col-8">
                        <table class="table col-3">
                            <tr class="">
                                <thead>
                                <tr>
                                    <th colspan="2"></th>
                                </tr>
                                </thead>
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                    <div>2</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>String text = "Hello \nworld";</code>
                                        </div>
                                        <div>
                                            <code>System.out.println(text);</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p>Результат выполнения данного кода:</p>
                    <div class="col-8">
                        <table class="table col-3" style="background-color: black">
                            <tr class="">
                                <td class="code ">
                                    <div class="container" >
                                        <div>
                                            <code style="color: aliceblue">Hello </code>
                                        </div>
                                        <div>
                                            <code style="color: aliceblue">world</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p>В данном случае последовательность \n будет сигналом, что необходимо сделать перевод на следующую строку.</p>
                    <p>Начиная с версии 15 Java поддерживает тестовые блоки (text blocks) - многострочный текст, облеченный в тройные кавычки. Рассмотрим, в чем их практическая польза. Например, выведем большой многострочный текст:</p>
                    <div class="col-8">
                        <table class="table col-3">
                            <tr class="">
                                <thead>
                                <tr>
                                    <th colspan="2"></th>
                                </tr>
                                </thead>
                                <td class="gutter" style="width: 20px">
                                    <div>1</div>
                                    <div>2</div>
                                    <div>3</div>
                                    <div>4</div>
                                    <div>5</div>
                                </td>
                                <td class="code ">
                                    <div class="container">
                                        <div>
                                            <code>String text = "Вот мысль, которой весь я предан,\n"+</code>
                                        </div>
                                        <div>
                                            <code>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"Итог всего, что ум скопил.\n"+</code>
                                        </div>
                                        <div>
                                            <code>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"Лишь тот, кем бой за жизнь изведан,\n"+</code>
                                        </div>
                                        <div>
                                            <code>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"Жизнь и свободу заслужил.";</code>
                                        </div>
                                        <div>
                                            <code>System.out.println(text);</code>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <p>С помощью операции + мы можем присоединить к одному тексту другой, причем продолжение текста может располагаться на следующей строке. Чтобы при выводе текста происходил перенос на следующую строку, применяется последовательность \n.</p>
                        <p>Результат выполнения данного кода:</p>
                        <div class="col-8">
                            <table class="table col-3" style="background-color: black">
                                <tr class="">
                                    <td class="code ">
                                        <div class="container" >
                                            <div>
                                                <code style="color: aliceblue">Вот мысль, которой весь я предан,</code>
                                            </div>
                                            <div>
                                                <code style="color: aliceblue">Итог всего, что ум скопил.</code>
                                            </div>
                                            <div>
                                                <code style="color: aliceblue">Лишь тот, кем бой за жизнь изведан,</code>
                                            </div>
                                            <div>
                                                <code style="color: aliceblue">Жизнь и свободу заслужил.</code>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <#--<button type="button" class="btn btn-primary float-md-center gy-10" data-bs-toggle="button">Toggle button</button>-->

            </div>
            <button class="btn btn-primary col-sm-3 float-md-end mb-4" type="submit">Завершить урок     <i class="bi bi-chevron-right"></i></button>

        </#if>
    </#if>

</@c.page>