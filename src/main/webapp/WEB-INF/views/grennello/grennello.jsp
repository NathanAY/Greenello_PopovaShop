<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${contextPath}/resources/css/product.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/greenello/greenello.css" rel="stylesheet">

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <%--<script src="${contextPath}/resources/js/jquery-3.3.1.min.js"></script>--%>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
          integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ=="
          crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw=="
          crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
            integrity="sha256-KXn5puMvxCw+dAYznun+drMdG1IFl3agK0p/pqT9KAo= sha512-2e8qq0ETcfWRI4HJBzQiA3UoyFk6tbNyG+qSaIBZLyW9Xf3sWZHN/lxe9fTh1U45DpPf07yj94KsUHHWe4Yk1A=="
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-2.2.0.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>

    <script src="${contextPath}/resources/js/greenello/greenello_main.js"></script>
    <script src="${contextPath}/resources/js/main.js"></script>
</head>

<body>

<div class="topnav">
    <a class="active trn" data-trn-key="Create new card" onclick="openModal()" href="#home">Create new card</a>
    <%--<a href="basket?search=${pageContext.request.userPrincipal.name}">Basket</a>--%>
    <a href="/SpringSecurityApp_war_exploded/userList" class="trn" data-trn-key="Users">Users</a>
    <a href="/SpringSecurityApp_war_exploded/account" class="trn" data-trn-key="Account">Account</a>
    <a href="/SpringSecurityApp_war_exploded/login?logout" class="trn" data-trn-key="Log out">Log out</a>
    <button class="w3-button w3-teal w3-xlarge" onclick="w3_open()">☰</button>
    <div class="search-container">
        <form action="/search">
            <input type="text" class="trn" data-trn-key="Search..." placeholder="" name="search">
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
    </div>
</div>

<!-- Sidebar -->
<div class="w3-sidebar w3-bar-block w3-border-right" style="display:none" id="mySidebar">
    <button onclick="w3_close()" class="w3-bar-item w3-large trn" data-trn-key="Activity &times;">Activity &times;</button>
    <div class="panel-group">
        <c:forEach items="${activities}" var="activiti">
            <div class="panel panel-warning">
                <div class="panel-heading">${activiti.creator_name}<p>${activiti.event_date}</div>
                <div class="panel-body">${activiti.text}</div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- The Modal -->
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <form id="new-card">
            <div class="modal-header">
                <span class="close">&times;</span>
                <div class="form-group">
                    <label for="inputSummary" class="trn" data-trn-key="Summary"><h2>Summary</h2></label>
                    <label style="font-size: 20px; color: red;">*</label>
                    <input type="text" class="form-control" id="inputSummary" placeholder="Short task descr.">
                </div>
            </div>
            <div class="modal-body">
                <label class="trn" data-trn-key="Description">Description</label>
                <div class="input-group description-area">
                    <textarea id="description" class="form-control" aria-label="With textarea"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <label for="inputState" class="trn" data-trn-key="Assignee">Assignee</label>
                <select id="inputState" class="form-control">
                    <option selected class="trn" data-trn-key="Choose...">Choose...</option>
                    <c:forEach items="${users}" var="user">
                        <option>${user.name}</option>
                    </c:forEach>
                </select>
                <br>
                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="gridCheck">
                        <label class="form-check-label trn" data-trn-key="Max priority" for="gridCheck">
                            Max priority
                        </label>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary trn" data-trn-key="Create">Create</button>
            </div>
        </form>
    </div>
</div>

<div class="board">
    <div class="container" style="background: rgba(100, 0, 0, 0.4);">
        <div class="panel panel-danger">
            <div class="panel-heading trn" data-trn-key="Queue">Queue</div>
        </div>
        <ul id="draggablePanelList" class="list-unstyled">
            <c:forEach items="${cards}" var="card">
                <c:if test="${card.status == 'Queue'}">
                    <li class="panel panel-info">
                        <div class="panel-heading">${card.summary}</div>
                        <div class="panel-body" onclick="openCard(${card.id})">${card.description}</div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
    <div class="container" style="background: rgba(100, 100, 0, 0.4);">
        <div class="panel panel-danger">
            <div class="panel-heading trn" data-trn-key="In progress">In progress</div>
        </div>
        <ul id="draggablePanelList2" class="list-unstyled">
            <c:forEach items="${cards}" var="card">
                <c:if test="${card.status == 'In progress'}">
                    <li class="panel panel-info">
                        <div class="panel-heading">${card.summary}</div>
                        <div class="panel-body" onclick="openCard(${card.id})">${card.description}</div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
    <div class="container" style="background: rgba(0, 0, 100, 0.4);">
        <div class="panel panel-danger">
            <div class="panel-heading trn" data-trn-key="Review">Review</div>
        </div>
        <ul id="draggablePanelLis3" class="list-unstyled">
            <c:forEach items="${cards}" var="card">
                <c:if test="${card.status == 'Review'}">
                    <li class="panel panel-info">
                        <div class="panel-heading">${card.summary}</div>
                        <div class="panel-body" onclick="openCard(${card.id})">${card.description}</div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
    <div class="container" style="background: rgba(0, 100, 0, 0.4);">
        <div class="panel panel-danger">
            <div class="panel-heading trn" data-trn-key="Done">Done</div>
        </div>
        <ul id="draggablePanelList4" class="list-unstyled">
            <c:forEach items="${cards}" var="card">
                <c:if test="${card.status == 'Done'}">
                    <li class="panel panel-info">
                        <div class="panel-heading">${card.summary}</div>
                        <div class="panel-body" onclick="openCard(${card.id})">${card.description}</div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</div>
<c:forEach items="${cards}" var="card">
    <div id="card-${card.id}" class="card-modal-content">
        <div class="modal-header">
            <span class="close" onclick="closeCard(${card.id})">&times;</span>
            <button type="button" class="btn btn-danger btn-arrow-left" onclick="backStatus(${card.id})">Back</button>
            <button type="button" class="btn btn-link">Workflow</button>
            <button type="button" class="btn btn-warning btn-arrow-right" onclick="nextStatus(${card.id})">
                Next status
            </button>
            <div class="form-group">
                <label for="inputSummary"><h2>${card.summary}</h2></label>
            </div>
        </div>
        <div class="modal-body">
            <label>${card.description}</label>
        </div>
        <div class="modal-footer">
            <label for="inputState">Assignee: ${card.assignee_id}</label>
            <p>
                <label for="inputState">Reporter: ${card.creatorId}</label>
            <p>
                <label for="inputState">Created: ${card.create_date}</label>
        </div>
    </div>
</c:forEach>
<script>
    $(function ($) {
        $("#new-card").submit(function (event) {
            var summary = document.getElementById("inputSummary").value;
            var description = document.getElementById("description").value;
            var assignee = document.getElementById("inputState").value;
            $.post("greenello/createCard?${_csrf.parameterName}=${_csrf.token}",
                {
                    creator: "${pageContext.request.userPrincipal.name}",
                    summary: summary,
                    description: description,
                    assignee: assignee
                },
                function (data) {
                    alert("Data: " + data); //TODO всплывающее окно
                });
            <%--alert("'${pageContext.request.userPrincipal.name}' added to your basket.");--%>
            console.warn(event);
            var modal = document.getElementById('myModal');
            modal.style.display = "none";
        });
    });

    function workflow(id, next) {
        $.post("greenello/cardWorkflow?${_csrf.parameterName}=${_csrf.token}",
            {
                cardId: id,
                next: next
            },
            function (data) {
                alert("Data: " + data); //TODO всплывающее окно
            });
        <%--alert("'${pageContext.request.userPrincipal.name}' added to your basket.");--%>
        console.warn(event);
    };




    var LANGUAGE;
    $.redrawLanguage = function (lang) {
        $.ajax({
            url : 'language/' + lang + '.json', //тянем файл с языком
            dataType : 'json',
            success : function (response) {
                LANGUAGE = response; //записываем в глобальную переменную, а вдруг пригодиться
                $('body').find("[lng]").each(function () //ищем все элементы с атрибутом
                {
                    var lng = LANGUAGE[ $(this).attr('lng') ]; //берем нужное значение по атрибуту lng
                    var tag = $(this)[0].tagName.toLowerCase();
                    switch (tag) //узнаем название тега
                    {
                        case "input":
                            $(this).val(lng);
                            break;
                        default:
                            $(this).html(lng);
                            break;
                    }
                });
            }
        });
    };

    $.getLanguage = function (key) {
        if (typeof(LANGUAGE[key]) != 'undefined') //если есть переменная
        {
            return LANGUAGE[key]; //возвращаем значение
        }
        return key; //если нет, тогда ключ
    };

    // $('#ru').on('click', function(e){
    //     e.preventDefault();
    //     var $this = $(this);
    //     $.redrawLanguage('eng');
    //     console.log($.getLanguage('hello_world') );
    //     console.log($.getLanguage('some_text') );
    // });
    //
    // $('#en').on('click', function(e){
    //     e.preventDefault();
    //     var $this = $(this);
    //     $.redrawLanguage('rus');
    //     console.log($.getLanguage('hello_world') );
    //     console.log($.getLanguage('some_text') );
    // });


    (function($){
        $.fn.translate = function(options) {
            var that = this; //a reference to ourselves
            var settings = {
                css: "trn",
                lang: "en"/*,
      t: {
        "translate": {
          pt: "tradução",
          br: "tradução"
        }
      }*/
            };
            settings = $.extend(settings, options || {});
            if (settings.css.lastIndexOf(".", 0) !== 0)   //doesn't start with '.'
                settings.css = "." + settings.css;

            var t = settings.t;
            //public methods
            this.lang = function(l) {
                if (l) {
                    settings.lang = l;
                    this.translate(settings);  //translate everything
                }
                return settings.lang;
            };


            this.get = function(index) {
                var res = index;
                try {
                    res = t[index][settings.lang];
                }
                catch (err) {
                    //not found, return index
                    return index;
                }
                if (res)
                    return res;
                else
                    return index;
            };
            this.g = this.get;


            //main
            this.find(settings.css).each(function(i) {
                var $this = $(this);
                var trn_key = $this.attr("data-trn-key");
                if (!trn_key) {
                    trn_key = $this.html();
                    $this.attr("data-trn-key", trn_key);   //store key for next time
                }
                $this.html(that.get(trn_key));
            });
            return this;
        };
    })(jQuery);

    var dict = {
        "Home": {
            pt: "Início"
        },
        "Download plugin": {
            pt: "Descarregar plugin",
            en: "Download plugin"
        }
    };
    var translator = $('body').translate({lang: "en", t: dict}); //use English
    translator.lang("pt"); //change to Portuguese
    var translation = translator.get("Home"); //returns "Início"

    $('#ru').on('click', function(e){
        e.preventDefault();
        var $this = $(this);
        $.redrawLanguage('eng');
        console.log($.getLanguage('hello_world') );
        console.log($.getLanguage('some_text') );
    });

    $( document ).ready(function() {
        jQuery('.ru-lang').click();
    });
</script>
<p style="bottom: 5px;
    position: absolute;
    left: 50%;">
    <span class="ru-lang btn lang_selector" role="button" data-value="pt"><img src="https://web.poecdn.com/image/lang/RU.png"></span>
    <span class="en-lang btn lang_selector" role="button" data-value="en"><img src="https://web.poecdn.com/image/lang/GB.png"></span>
</p>
</body>
</html>