#include "main.h"
#include <stdio.h>

/**
* _printf - Print formatted output to stdout.
* @format: A string containing the format specification.
*
* Return: Number of characters printed
*/
int _printf(const char *format, ...)
{
va_list args;
conver_t f_list[] = {
{"c", print_char},
{"s", print_string},
{"%", print_percent},
{"d", print_integer},
{"i", print_integer},
{"b", print_binary},
{"r", print_reversed},
{"R", rot13},
{"u", unsigned_integer},
{"o", print_octal},
{"x", print_hex},
{"X", print_heX},
{NULL, NULL}
};
int printed_chars = 0;

if (format == NULL)
return (-1);

va_start(args, format);
printed_chars = parser(format, f_list, args);
va_end(args);

return (printed_chars);
}
/**
 * print_char - Prints a single character
 *
 * @args: A va_list containing the character to be printed
 *
 * Return: The number of characters printed
 */
int print_char(va_list args)
{
    return (putchar(va_arg(args, int)));
}

/**
 * print_string - Prints a string of characters
 *
 * @args: A va_list containing the string to be printed
 *
 * Return: The number of characters printed
 */
int print_string(va_list args)
{
    int count = 0;
    char *str = va_arg(args, char *);

    if (!str)
        str = "(null)";

    while (*str)
    {
        putchar(*str);
        count++;
        str++;
    }

    return (count);
}

/**
 * print_hex - Prints a hexadecimal number
 *
 * @args: A va_list containing the hexadecimal number to be printed
 *
 * Return: The number of characters printed
 */
int print_hex(va_list args)
{
    unsigned int n = va_arg(args, unsigned int);
    int count = 0;

    if (n / 16)
        count += print_hex(va_arg(args, unsigned int));

    if (n % 16 < 10)
        putchar((n % 16) + '0');
    else
        putchar((n % 16) - 10 + 'a');

    count++;

    return (count);
}
