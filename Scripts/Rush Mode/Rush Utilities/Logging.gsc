am_log(str)
{
#ifdef _SUPPORTS_BUILTINS
    compiler::nprintln(str); // changes to shieldlog now
#else
    if (!isdefined(level.am_messages)) 
    {
        level.am_messages = [];
    }
    array::add(level.am_messages, str, true);
#endif
}

LogInject()
{
#ifdef _INJECT_CLIENT
    am_log("inject client");
#endif
}