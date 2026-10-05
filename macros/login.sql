{% macro learnlogin() %}
    {{log("Today is session 8.")}}
    {{log("We are practicing macros.")}}
    {{log("Our instructor is Ravi G.", info = true)}} -- prints in terminal
    {# log("Today is Wednesday.") #}


{% endmacro %}