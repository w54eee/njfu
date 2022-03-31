function ndir = anglecalculate(Aangle,Zangle)
    v1 = sin(Aangle)*cos(Zangle);
    v2 = cos(Aangle)*cos(Zangle);
    v3 = sin(Zangle);
    v1 = v1/sqrt(v1^2+v2^2+v3^2);
    v2 = v2/sqrt(v1^2+v2^2+v3^2);
    v3 = v3/sqrt(v1^2+v2^2+v3^2);
    ndir = [v1,v2,v3];
end