

$(function() {

    var t = {
        "Toggle navigation": {
            pt: "Mostrar/esconder navegação"
        },
        "Home": {
            pt: "Início"
        },
        About: {
            pt: "Acerca"
        },
        "Language": {
            pt: "Idioma"
        },
        "Step": {
            pt: "Passo"
        },
        subtitle_key: {
            en: "translate.js is a jQuery plugin to translate text in the client side.",
            pt: "translate.js é um plugin JQuery para traduzir texto client side."
        },
        "Usage: translate entire page": {
            pt: "Uso: traduzir uma página inteira"
        },
        "Usage: translate a string": {
            pt: "Uso: traduzir uma string"
        },
        step1: {
            en: "include JQuery and translate.js in your page",
            pt: "incluir JQuery e translate.js na página"
        },
        step2: {
            en: "every text you want translated include the <code>trn</code> class",
            pt: "incluir a classe <code>trn</code> no texto a traduzir"
        },
        step3: {
            en: "create your dictionary",
            pt: "criar o dicionário"
        },
        step4: {
            en: "initialize the plugin and translate the entire page body",
            pt: "iniciar o plugin e traduzir o body da página"
        },
        step5: {
            en: "change to another language",
            pt: "mudar para outro idioma"
        },
        step6: {
            en: "try it",
            pt: "experimentar"
        },
        "translate to English": {
            pt: "traduzir para Inglês"
        },
        "Users": {
            pt: "Пользователи"
        },
        "Account": {
            pt: "Аккаунт"
        },
        "Queue": {
            pt: "Очередь выполнения"
        },
        "In progress": {
            pt: "Выпоняется"
        },
        "Review": {
            pt: "На рассмотрение"
        },
        "Done": {
            pt: "Сделаные"
        },
        "Log out": {
            pt: "Выйти"
        },
        "Create new card": {
            pt: "Создать карту"
        },
        "Activity &times;": {
            pt: "Активности &times;"
        },
        "Summary": {
            pt: "Заголовок"
        },
        "Description": {
            pt: "Описание"
        },
        "Max priority": {
            pt: "Высший приоритет"
        },
        "Search...": {
            pt: "Поиск..."
        },
        "Assignee": {
            pt: "Назначеный"
        },
        "Choose...": {
            pt: "Выберите..."
        },
        "translate to Portuguese": {
            pt: "traduzir para Português"
        },
        string_translate_key: {
            en: "After you initialize the component you can translate a string",
            pt: "Depois do componente iniciado, pode-se traduzir uma string"
        },
        "Download translate.js": {
            pt: "Descarregar translate.js"
        }
    };
    var _t = $('body').translate({lang: "en", t: t});
    var str = _t.g("translate");
    console.log(str);


    $(".lang_selector").click(function(ev) {
        var lang = $(this).attr("data-value");
        _t.lang(lang);

        console.log(lang);
        ev.preventDefault();
    });
});






