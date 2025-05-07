if (room != rm_transition)
{
    mtXPrev = x
    mtYPrev = y
   
    x_subpx += frac(argument0)
    y_subpx += frac(argument1)
    xVelInteger = floor(abs(argument0))
    yVelInteger = floor(abs(argument1))
    
    if (x_subpx >= 1 || x_subpx <= -1)
    {
        xVelInteger++
        x_subpx -= sign(x_subpx)
    }
    if (y_subpx >= 1 || y_subpx <= -1)
    {
        yVelInteger++
        y_subpx -= sign(y_subpx)
    }

    xVelInteger *= sign(argument0)
    yVelInteger *= sign(argument1)

    if (xVelInteger > 0)
    {
        while (x < (mtXPrev + xVelInteger))
        {
            if isCollisionRight(1)
                break
            else
            {
                x += 1
                continue
            }
        }
    }
    if (xVelInteger < 0)
    {
        while (x > (mtXPrev + xVelInteger))
        {
            if isCollisionLeft(1)
                break
            else
            {
                x -= 1
                continue
            }
        }
    }
    if (yVelInteger > 0)
    {
        while (y < (mtYPrev + yVelInteger))
        {
            if isCollisionBottom(1)
                break
            else if (object_index == oCharacter)
            {
                if isCollisionPlatformBottom(1)
                    break
                else
                {
                    y += 1
                    continue
                }
            }
            else
            {
                y += 1
                continue
            }
        }
    }
    if (yVelInteger < 0)
    {
        while (y > (mtYPrev + yVelInteger))
        {
            if isCollisionTop(1)
                break
            else
            {
                y -= 1
                continue
            }
        }
    }
}
