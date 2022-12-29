//tonychang1069 @ 2022-12-30

void _strwrite(char* string)
{
    char* p_strdst = (char*)(0xb8000);
    while (*string)
    {
        *p_strdst = *string++;
        p_strdst += 2;
    }
    return;
}

void printf(char* fmt, ...)
{
    _strwrite(fmt);
    return;
}
