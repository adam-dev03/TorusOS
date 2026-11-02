#ifndef BUFFER_H
#define BUFFER_H

extern void buffer_char(char text, int x, int y, char color);
extern void clr_screen(void);


void buffer_text(char text[], int x, int y, char color)
{
    char *video = (char *)0xB8000;
    int i = 0;
    while (text[i] != '\0')
    {
        *(video + ((160 * y) + (i * 2 + x))) = text[i];
        *(video + ((160 * y) + (i * 2 + x) + 1)) = color;
        i++;
    }
}

void buffer_char(char text, int x, int y, char color)
{
    char *video = (char *)0xB8000;

    *(video + ((160 * y) + x)) = text;
    *(video + ((160 * y) + x) + 1) = color;
}

void clr_screen()
{
    for (int y = 0; y < 50; y++)
    {
        for (int x = 0; x < 160; x++)
        {
            buffer_text(" ", x, y, 0x8F);
        }
    }
}

#endif