fprintf('PROGRAMA PARA RESOLVER ECUACIONES DEL CURSO DE MEDIOS DE TRANSMISIÓN \n');
% DESARROLLADO POR stbn17
R = 0;RS=num2str(R);
L = 0;LS=num2str(L);
G = 0;GS=num2str(G);
C = 0;CS=num2str(C);
fo = 0;FOS=num2str(fo);
R = input('Inserte R : ');RS=num2str(R);
L = input('Inserte L : ');LS=num2str(L);
G = input('Inserte G : ');GS=num2str(G);
C = input('Inserte C : ');CS=num2str(C);
U = input('Inserte unidades [m-0 | Km-1] :');
fo = input('Inserte frecuencia : ');FOS=num2str(fo);
fprintf('\n \n');
w = 2*pi*fo;
flag0 = 0;
flag1 = 0;
flag2 = 0;
flag3 = 0;
flag4 = 0;
flag5 = 0;
flag6 = 0;
%FIN DE OBTENCIÓN DE DATOS

if U == 0 %SELECCIÓN DE UNIDADES DE LONGITUD
  unid = 'm';
elseif U == 1
  unid = 'Km';
endif
fprintf('================== MÉTODOS DISPONIBLES ==================\n \n');
if R/(w*L) > 1 && G/(w*C) < 1 %FÓRMULAS EN BAJA FRECUENCIA
  fprintf('MÉTODO DE BAJA FRECUENCIA DISPONIBLE\n');
  fprintf('        jwL << R  |  jwC >> G \n');
  fprintf('             _______       _______\n');
  fprintf('  gamma  = |/R*w*C/2 + j |/R*w*C/2\n');
  fprintf('          _________       _________            __________\n');
  fprintf('  Zo  = |/R/(2*w*C) - j |/(R/2*w*C)  |  Vp = |/(2*w)/(R*C)\n');
  fprintf('\n \n');
  flag0 = 1;
endif
if R/(w*L) < 1 && G/(w*C) < 1 %FÓRMULAS EN ALTA FRECUENCIA
  fprintf('MÉTODO DE ALTA FRECUENCIA DISPONIBLE\n');
  fprintf('        jwL >> R  |  jwC >> G \n');
  fprintf('                   _______\n');
  fprintf('  gamma  = 0 + j |/R*w*C/2\n');
  fprintf('          ___                ___\n');
  fprintf('  Zo  = |/L/C  |  Vp = 1 / |/L*C \n');
  fprintf('\n \n');
  flag1 = 1;
endif
if R == 0 && G == 0 %FÓRMULAS EN LÍNEAS SIN PÉRDIDAS
  fprintf('MÉTODO DE LÍNEAS SIN PÉRDIDAS DISPONIBLE\n');
  fprintf('        R = 0  |  G = 0 \n');
  fprintf('                   ________\n');
  fprintf('  gamma  = 0 + j |/R*w*C/2\n');
  fprintf('          ___                ___\n');
  fprintf('  Zo  = |/L/C  |  Vp = 1 / |/L*C \n');
  fprintf('\n \n');
  flag2 = 1;
endif
if R/(w*L) < 1 && G/(w*C) < 1 && G == 0 %FÓRMULAS EN LÍNEAS CON BAJAS PÉRDIDAS
  fprintf('MÉTODO DE LÍNEAS CON BAJAS PÉRDIDAS DISPONIBLE\n');
  fprintf('        jwL >> R  |  jwC >> G  |  G~0 \n');
  fprintf('                   ___         ___\n');
  fprintf('  gamma  = 0.5*R*|/C/L + j w*|/L*C \n');
  fprintf('          ___                                   ___\n');
  fprintf('  Zo  = |/L/C * [1 - j R/(2*w*L)] |  Vp = 1 / |/L*C \n');
  fprintf('\n \n');
  flag3 = 1;
endif
if L*G == R*C %FÓRMULAS EN LÍNEAS SIN DISTORCIÓN
  fprintf('MÉTODO DE LÍNEAS SIN DISTORCIÓN DISPONIBLE\n');
  fprintf('                L*G = R*C \n');
  fprintf('             ___         ___\n');
  fprintf('  gamma  = |/R*G + j w*|/L*C \n'); 
  fprintf('         ___________________               ___\n');
  fprintf('  Zo = |/(R + jwL)/(G + jwC)  | Vp = 1 / |/L*C \n');
  fprintf('\n \n');
  flag4 = 1;
endif
if 0.2 > R/(w*L) && 0.2 > G/(w*C) %FÓRMULAS EN LÍNEAS CON BAJA DISTORCIÓN
  fprintf('MÉTODO DE LÍNEAS CON BAJA DISTORCIÓN DISPONIBLE\n');
  fprintf('        jwL/R >> 5  |  jwC/G >> 5  |  G~0 \n');
  fprintf('                   ___           ___         ___\n');
  fprintf('  gamma  = 0.5*R*|/C/L + 0.5*G*|/L/C + j w*|/L*C \n'); 
  fprintf('          ___                ___\n');
  fprintf('  Zo  = |/L/C  |  Vp = 1 / |/L*C \n');
  fprintf('\n \n');
  flag5 = 1;
endif
if fo ~= 0 %FÓRMULAS EN MÉTODO TRADICIONAL
  fprintf('MÉTODO TRADICIONAL DISPONIBLE\n');
  fprintf('             __________________\n');
  fprintf('  gamma  = |/(R + jwL)(G + jwC)\n');
  fprintf('         ___________________\n')
  fprintf('  Zo = |/(R + jwL)/(G + jwC)  |  Vp = w/beta\n');
  fprintf('\n \n');
  flag6 = 1;
endif
select = input('SELECCIONE MÉTODO A USAR [ Baja Frec - 0 | Alta Frec - 1  | S/Pérd - 2 | Baja Pérd - 3 | S/Distor - 4 | Baja Distor - 5 | TRADICIONAL - 6] : ');
if select == 0 %VARIABLE DE IMPRESIÓN DEL MÉTODO A UTILIZAR
  method = 'DE BAJA FRECUENCIA';
  crit = 'R/(w*L) > 1 && G/(w*C) > 1';
elseif select == 1
  method = 'DE ALTA FRECUENCIA';
  crit = 'R/(w*L) < 1 && G/(w*C) < 1';
elseif select == 2
  method = 'DE LÍNEAS SIN PÉRDIDAS';
  crit = 'R = 0 && G = 0';
elseif select == 3
  method = 'DE LÍNEAS CON BAJAS PÉRDIDAS';
  crit = 'R/(w*L) < 1 && G/(w*C) < 1 && G = 0';
elseif select == 4
  method = 'DE LÍNEAS SIN DISTORCIÓN';
  crit = 'L*G = R*C';
elseif select == 5
  method = 'DE LÍNEAS CON BAJA DISTORCIÓN';
  crit = '0.2 > R/(w*L) && 0.2 > G/(w*C)';
elseif select == 6
  method = 'TRADICIONAL';
else
  fprintf('••••••••NO EXISTE EL MÉTODO SELECCIONADO•••••••• \n \n');
  return
endif
fprintf('\n---------DATOS INGRESADOS---------\n');
fprintf('R : '),printf(RS);fprintf('\n');
fprintf('L : '),printf(LS);fprintf('\n');
fprintf('G : '),printf(GS);fprintf('\n');
fprintf('C : '),printf(CS);fprintf('\n');
fprintf('fo : '),printf(FOS);fprintf('\n');
fprintf('MÉTODO '),printf(method);fprintf('\n');
fprintf('----------------------------------\n\n');
if select == 0 && flag0 == 1 %BAJA FRECUENCIA
  method = 'UD HA SELECCIONADO - MÉTODO DE BAJA FRECUENCIA\n';
  fprintf('          _______        _______\n');
  fprintf('gamma = |/R*w*C/2  + j |/R*w*C/2 \n');
  fprintf('gamma = sqrt(0.5*'),printf(RS),printf('*'),printf(num2str(w)),printf('*'),printf(CS),printf(') + j sqrt(0.5*'),printf(RS),printf('*'),printf(num2str(w)),printf('*'),printf(CS),,printf(') \n');
  fprintf('gamma = sqrt('),printf(num2str(R*w*C*0.5),8),printf(') + j sqrt('),printf(num2str(R*w*C*0.5),8),printf(') \n');
  fprintf('gamma = '),printf(num2str((sqrt(R*w*C*0.5))+(sqrt(R*w*C*0.5))*i)),printf(' \n')
  fprintf('          _______     ______________________\n');
  fprintf('alpha = |/R*w*C/2 = |/0.5*'),printf(RS),printf('*'),printf(num2str(w)),printf('*'),printf(CS),printf(' \n');
  fprintf('alpha = sqrt('),printf(num2str(R*w*C*0.5),8),printf(') \n');
  fprintf('alpha = '),printf(num2str(sqrt(R*w*C*0.5))),printf(' N/'),printf(unid),printf(' \n');
  fprintf('         _______     ______________________\n');
  fprintf('beta = |/R*w*C/2 = |/0.5*'), printf(RS),printf('*'),printf(num2str(w)),printf('*'),printf(CS),printf(' \n');
  fprintf('beta = sqrt('),printf(num2str(R*w*C*0.5),8),printf(') \n');
  fprintf('beta = '),printf(num2str((sqrt(R*w*C*0.5)))),printf(' rad/'),printf(unid),printf(' \n');
  fprintf('       ___________       ___________ \n');
  fprintf('Zo = |/0.5*R/(w*C) - j |/0.5*R/(w*C) \n');
  fprintf('Zo = sqrt(0.5*'),printf(RS),printf('/('),printf(num2str(w)),printf('*'),printf(CS),printf(')) - j sqrt(0.5*'),printf(RS),printf('/('),printf(num2str(w)),printf('*'),printf(CS),printf(')) \n \n');
  fprintf('Zo = '),printf(num2str(((sqrt(0.5*R/(w*C)))-(sqrt(0.5*R/(w*C)))*i),8)),printf(' ohms/'),printf(unid),printf(' \n');
  fprintf('       _________      ______________________ \n');
  fprintf('Vp = |/2*w/(R*C)  = |/2*'),printf(num2str(w)),printf('/('),printf(RS),printf('*'),printf(CS),printf(') \n');
  fprintf('Vp = sqrt('),printf(num2str(2*w/(R*C),8)),printf(') \n');
  fprintf('Vp = '),printf(num2str(sqrt(2*w/(R*C)),8)),printf(' '),printf(unid),printf('/s \n \n');
  fprintf('Lambda = Vp/f = '),printf(num2str((sqrt(2*w/(R*C))),8)),printf('/'),printf(num2str(fo)),printf(' = '),,printf(num2str((sqrt(2*w/(R*C)))/fo,8)),printf(' '),printf(unid),printf(' \n \n');
elseif select == 1 && flag1 == 1 %ALTA FRECUENCIA
  fprintf('UD HA SELECCIONADO - MÉTODO DE ALTA FRECUENCIA\n');
  fprintf('          __________              ___\n');
  fprintf('gamma = |/(jwL)(jwC)  =  0 + j w|/L*C \n');
  fprintf('gamma = 0 + j '),printf(num2str(w)),printf('*sqrt('),printf(LS),printf('*'),printf(CS),printf(') \n');
  fprintf('gamma = 0 + j '),printf(num2str(w*sqrt(L*C),8)),printf(' \n \n');
  fprintf('alpha = 0 '),printf(' N/'),printf(unid),printf(' \n');
  fprintf('           ___\n');
  fprintf('beta = w*|/L*C  = '),printf(num2str(w)),printf('*sqrt('),printf(LS),printf('*'),printf(CS),printf(') \n'),
  fprintf('beta = '),printf(num2str(w*sqrt(L*C),8)),printf(' rad/'),printf(unid),printf(' \n');
  fprintf('       ___ \n');
  fprintf('Zo = |/L/C = sqrt('),printf(LS),printf('/'),printf(CS),printf(')\n');
  fprintf('Zo = '),printf(num2str(sqrt(L/C),8)),printf(' ohms/'),printf(unid),printf(' \n');
  fprintf('           ___ \n');
  fprintf('Vp = 1 / |/L*C  = 1 / sqrt('),printf(LS),printf('*'),printf(CS),printf(')'),printf(' \n');
  Vp = 1 / sqrt(L*C);
  fprintf('Vp = '),printf(num2str(Vp,8)),printf(' '),printf(unid),printf('/s \n \n');
  fprintf('Lambda = Vp/f = '),printf(num2str(1/sqrt(L*C),8)),printf('/'),printf(num2str(fo)),printf(' = '),printf(num2str(((1/sqrt(L*C))/fo),8)),printf(' '),printf(unid),printf(' \n \n');
elseif select == 2 && flag2 == 1 %SIN PÉRDIDAS
  fprintf('UD HA SELECCIONADO - MÉTODO DE LÍNEAS SIN PÉRDIDAS \n');
  fprintf('          __________          ___\n');
  fprintf('gamma = |/(jwL)(jwC)  =  j w|/L*C \n');
  fprintf('gamma = j '),printf(num2str(w)),printf('*sqrt('),printf(LS),printf('*'),printf(CS),printf(') \n');
  gamma = w*sqrt(L*C)*i;
  g_a_r=angle(gamma); %ÁNGULO EN RADS
  g_a_s=angle(gamma)*180/pi; %ÁNGULO EN °
  ANGLE_S=num2str(g_a_s);
  ANGLE_R=num2str(g_a_r);
  fprintf('gamma = '),printf(num2str(gamma,8)),printf(' || '),printf(num2str(abs(gamma))),fprintf('/'),printf(ANGLE_S),printf('°'),printf(' || '),fprintf(num2str(abs(gamma))),fprintf('/'),printf(ANGLE_R),printf(' \n \n');
  fprintf('alpha = 0 '),printf(' N/'),printf(unid),printf(' \n');
  fprintf('           ___ \n');
  fprintf('beta = w*|/L*C = '),printf(num2str(w)),printf('*sqrt('),printf(LS),printf('*'),printf(CS),printf(') \n');
  fprintf('beta = '),printf(num2str(w*sqrt(L*C),8)),printf(' rad/'),printf(unid),printf(' \n');
  fprintf('       ___     _________\n');
  fprintf('Zo = |/L/C = '),printf('|/'),printf(LS),printf('/'),printf(CS),printf('\n');
  fprintf('Zo = '),printf(num2str(sqrt(L/C),8)),printf(' ohms/'),printf(unid),printf(' \n');
  fprintf('           ___ \n');
  fprintf('Vp = 1 / |/L*C  = 1 / sqrt('),printf(LS),printf('*'),printf(CS),printf(')'),printf(' \n');
  Vp = 1 / sqrt(L*C);
  fprintf('Vp = '),printf(num2str(Vp,8)),printf(' '),printf(unid),printf('/s \n \n');
  fprintf('Lambda = Vp/f = '),printf(num2str(1/sqrt(L*C),8)),printf('/'),printf(num2str(fo)),printf(' = '),printf(num2str(((1/sqrt(L*C))/fo),8)),printf(' '),printf(unid),printf(' \n')
  fprintf('\n \n');
elseif select == 3 && flag3 == 1 %BAJAS PÉRDIDAS
  fprintf('UD HA SELECCIONADO - MÉTODO DE LÍNEAS CON BAJAS PÉRDIDAS\n');
  fprintf('                ___          ___ \n');
  fprintf('gamma = 0.5*R*|/C/L +  j w*|/L*C\n');
  fprintf('gamma = 0.5*'),printf(RS),printf('*sqrt('),printf(CS),printf('/'),printf(LS),printf(') + j '),printf(num2str(w)),printf('*sqrt('),printf(LS),printf('*'),printf(CS),printf(') \n');
  gamma = (0.5*R*sqrt(C/L))+(w*sqrt(L*C)*i);
  g_a_r=angle(gamma); %ÁNGULO EN RADS
  g_a_s=angle(gamma)*180/pi; %ÁNGULO EN °
  ANGLE_S=num2str(g_a_s);
  ANGLE_R=num2str(g_a_r);
  fprintf('gamma = '),printf(num2str(gamma,8)),printf(' || '),printf(num2str(abs(gamma))),fprintf('/'),printf(ANGLE_S),printf('°'),printf(' || '),fprintf(num2str(abs(gamma))),fprintf('/'),printf(ANGLE_R),printf(' \n');
  fprintf('                ___\n');
  fprintf('alpha = 0.5*R*|/C/L = 0.5*'),printf(RS),printf('*sqrt('),printf(CS),printf('/'),printf(LS),printf(') \n');
  fprintf('alpha = '),printf(num2str(0.5*R*sqrt(C/L),8)),printf(' N/'),printf(unid),printf(' \n');
  fprintf('           ___ \n');
  fprintf('beta = w*|/L*C = '),printf(num2str(w)),printf('*sqrt('),printf(LS),printf('*'),printf(CS),printf(') \n');
  fprintf('beta = '),printf(num2str(w*sqrt(L*C),8)),printf(' rad/'),printf(unid),printf(' \n');
  fprintf('       ___\n')
  fprintf('Zo = |/L/C * [1 - j R/(2*w*L)] = sqrt('),printf(LS),printf('/'),printf(CS),printf(') * [1 - j '),printf(RS),printf('/(2*'),printf(num2str(w)),printf('*'),printf(LS),printf(')] \n'),
  fprintf('Zo = '),printf(num2str(sqrt(L/C)*(1 - R*i/(2*w*L)),8)),printf(' ohms/'),printf(unid),printf(' \n');
  fprintf('           ___ \n');
  fprintf('Vp = 1 / |/L*C  = 1 / sqrt('),printf(LS),printf('*'),printf(CS),printf(')'),printf(' \n');
  fprintf('Vp = '),printf(num2str(1 / sqrt(L*C),8)),printf(' '),printf(unid),printf('/s \n \n');
  fprintf('Lambda = Vp/f = '),printf(num2str(1/sqrt(L*C),8)),printf('/'),printf(num2str(fo)),printf(' = '),printf(num2str(((1/sqrt(L*C))/fo),8)),printf(' '),printf(unid),printf(' \n')
  fprintf('\n \n');
elseif select == 4 && flag4 == 1 %SIN DISTORCIÓN
  fprintf('UD HA SELECCIONADO - MÉTODO DE LÍNEAS SIN DISTORCIÓN\n');
  fprintf('          ___         ___\n');
  fprintf('gamma = |/R*G + j w*|/L*C  = sqrt('),printf(RS),printf('*'),printf(GS),printf(') + j '),printf(num2str(w)),printf('*sqrt('),printf(LS),printf('*'),printf(CS),printf(') \n');
  gamma = (sqrt(R*G))+(w*sqrt(L*C))*i;
  g_a_r=angle(gamma); %ÁNGULO EN RADS
  g_a_s=angle(gamma)*180/pi; %ÁNGULO EN °
  ANGLE_S=num2str(g_a_s);
  ANGLE_R=num2str(g_a_r);
  fprintf('gamma = '),printf(num2str(gamma,8)),printf(' || '),printf(num2str(abs(gamma))),fprintf('/'),printf(ANGLE_S),printf('°'),printf(' || '),fprintf(num2str(abs(gamma))),fprintf('/'),printf(ANGLE_R),printf(' \n');
  fprintf('          ___ \n');
  fprintf('alpha = |/R*G = sqrt('),printf(RS),printf('*'),printf(GS),printf(') \n');
  fprintf('alpha = '),printf(num2str(sqrt(R*G),8)),printf(' N/'),printf(unid),printf(' \n');
  fprintf('           ___\n');
  fprintf('beta = w*|/L*C  = '),printf(num2str(w)),printf('*sqrt('),printf(LS),printf('*'),printf(CS),printf(') \n');
  fprintf('beta = '),printf(num2str(w*sqrt(L*C),8)),printf(' rad/'),printf(unid),printf(' \n');
  m1=(R+(j*w*L));
  m2=(G+(j*w*C));
  MS1=num2str(m1);
  MS2=num2str(m2);
  Zo = sqrt(m1/m2);
  fprintf('       ___________________     __________________________\n')
  fprintf('Zo = |/(R + jwL)/(G + jwC) = |/('),printf(RS),printf(' + j '),printf(num2str(w)),printf('*'),printf(LS),printf(')/('),printf(GS),printf(' + j '),printf(num2str(w)),printf('*'),printf(CS),printf(')\n');
  fprintf('        ____________________________\n')
  fprintf('Zo = |/('),printf(MS1),printf(')/('),printf(MS2),printf(')\n');
  fprintf('Zo = '),printf(num2str(Zo,8)),printf(' ohms/'),printf(unid),printf(' \n');
  fprintf('           ___ \n');
  fprintf('Vp = 1 / |/L*C  = 1 / sqrt('),printf(LS),printf('*'),printf(CS),printf(')'),printf(' \n');
  fprintf('Vp = '),printf(num2str(1 / sqrt(L*C),8)),printf(' '),printf(unid),printf('/s \n \n');
  fprintf('Lambda = Vp/f = '),printf(num2str((1/sqrt(L*C)),8)),printf('/'),printf(num2str(fo)),printf(' = '),printf(num2str(((1/sqrt(L*C))/fo),8)),printf(' '),printf(unid),printf(' \n \n');
elseif select == 5 && flag5 == 1 %BAJA DISTORCIÓN
  fprintf('UD HA SELECCIONADO - MÉTODO DE LÍNEAS CON BAJA DISTORCIÓN\n');
  fprintf('                ___           ___         ____\n');
  fprintf('gamma = 0.5*R*|/C/L + 0.5*G*|/L/C + j w*|/L*C\n'); 
  fprintf('gamma = 0.5*'),printf(RS),printf('*sqrt('),printf(CS),printf('/'),printf(LS),printf(') + 0.5*'),printf(GS),printf('*sqrt('),printf(LS),printf('/'),printf(CS),printf(') + j '),printf(num2str(w)),printf('*sqrt('),printf(LS),printf('*'),printf(CS),printf(') \n');
  gamma = (0.5*R*sqrt(C/L))+(0.5*G*sqrt(L/C))+(w*sqrt(L*C)*i);
  g_a_r=angle(gamma); %ÁNGULO EN RADS
  g_a_s=angle(gamma)*180/pi; %ÁNGULO EN °
  ANGLE_S=num2str(g_a_s);
  ANGLE_R=num2str(g_a_r);
  fprintf('gamma = '),printf(num2str(gamma,8)),printf(' || '),printf(num2str(abs(gamma))),fprintf('/'),printf(ANGLE_S),printf('°'),printf(' || '),fprintf(num2str(abs(gamma))),fprintf('/'),printf(ANGLE_R),printf(' \n');
  fprintf('                 ___           ___\n');
  fprintf('alpha  = 0.5*R*|/C/L + 0.5*G*|/L/C\n');
  fprintf('alpha  = 0.5*'),printf(RS),printf('*sqrt('),printf(CS),printf('/'),printf(LS),printf(') + 0.5*'),printf(GS),printf('*sqrt('),printf(LS),printf('/'),printf(CS),printf(')\n')
  fprintf('alpha  = '),printf(num2str(real(gamma))),printf(' N/'),printf(unid),printf(' \n');
  fprintf('           ____\n');  
  fprintf('beta = w*|/L*C\n');
  fprintf('beta = '),printf(num2str(w)),printf('*sqrt('),printf(LS),printf('*'),printf(CS),printf(') \n');
  fprintf('beta = '),printf(num2str(w*sqrt(L*C),8)),printf(' rad/'),printf(unid),printf(' \n');
  fprintf('       ____\n');
  fprintf('Zo = |/L/C \n');
  fprintf('Zo = sqrt('),printf(LS),printf('/'),printf(CS),fprintf(') \n');
  Zo = sqrt(L/C);
  fprintf('Zo = '),printf(num2str(Zo,8)),printf(' ohms/'),printf(unid),printf(' || '),printf(num2str(abs(Zo))),fprintf('/'),printf(num2str(angle(Zo)*180/pi)),printf('° || '),printf(num2str(abs(Zo))),fprintf('/'),printf(num2str(angle(Zo))),printf(' rads \n \n');
  fprintf('           ___ \n');
  fprintf('Vp = 1 / |/L*C \n');
  fprintf('Vp = 1 / sqrt('),printf(LS),printf('*'),printf(CS),printf(') \n');
  fprintf('Vp = '),printf(num2str(1 / sqrt(L*C),8)),printf(' '),printf(unid),printf('/s \n \n');
  fprintf('Lambda = Vp/f = '),printf(num2str((1/sqrt(L*C)),8)),printf('/'),printf(num2str(fo)),printf(' = '),printf(num2str(((1/sqrt(L*C))/fo),8)),printf(' '),printf(unid),printf(' \n');
  fprintf('\n \n');
elseif select == 6 && flag6 == 1 %MÉTODO TRADICIONAL
  fprintf('UD HA SELECCIONADO - MÉTODO TRADICIONAL\n');
  format long
  fprintf('          __________________       _____________________________________\n');
  fprintf('gamma = |/(R + jwL)(G + jwC)  =  |/('),printf(RS),printf(' + j '),printf(num2str(w)),printf('*'),printf(LS),printf(')*('),printf(GS),printf(' + j '),printf(num2str(w)),printf('*'),printf(CS),printf(')\n');
  m1=(R+(j*w*L));
  m2=(G+(j*w*C));
  m=m1*m2;
  MS1=num2str(m1);
  MS2=num2str(m2);
  MS=num2str(m,8);
  fprintf('gamma = sqrt('),printf(MS),printf(') \n');
  gamma=sqrt(m);
  g_a_r=angle(gamma); %ÁNGULO EN RADS
  g_a_s=angle(gamma)*180/pi; %ÁNGULO EN °
  ANGLE_S=num2str(g_a_s);
  ANGLE_R=num2str(g_a_r);
  Zo=sqrt(m1/m2);
  GAMS=num2str(gamma,8);
  fprintf('gamma = '),printf(GAMS),printf(' || '),printf(num2str(abs(gamma))),fprintf('/'),printf(ANGLE_S),printf('°'),printf(' || '),fprintf(num2str(abs(gamma))),fprintf('/'),printf(ANGLE_R),printf('\n \n');
  fprintf('alpha = Re(gamma) => '),fprintf(num2str(real(gamma))),printf(' N/'),printf(unid),printf(' \n \n');
  fprintf('beta = Im(gamma) => '),fprintf(num2str(imag(gamma))),printf(' rad/'),printf(unid),printf(' \n \n');
  fprintf('       ___________________     _______________________________\n')
  fprintf('Zo = |/(R + jwL)/(G + jwC) = |/('),printf(MS1),printf(')/('),printf(MS2),printf(')\n');
  fprintf('Zo = sqrt('),printf(num2str(m1/m2,8)),printf(') \n');
  fprintf('Zo = '),printf(num2str(Zo,8)),printf(' || '),printf(num2str(abs(Zo))),fprintf('/'),printf(num2str(angle(Zo)*180/pi)),printf('°'),printf(' || '),printf(num2str(abs(Zo))),fprintf('/'),printf(num2str(angle(Zo))),printf(' rads'),printf(' ohms/'),printf(unid),printf(' \n \n');
  fprintf('Vp = w/beta = '),printf(num2str(w)),printf('/'),printf(num2str(imag(gamma))),printf(' = '),printf(num2str(w/(imag(gamma)))),printf(' '),printf(unid),fprintf('/s \n \n');
  fprintf('Lambda = Vp/f = '),printf(num2str(w/(imag(gamma)))),printf('/'),printf(num2str(fo)),printf(' = '),printf(num2str((w/(imag(gamma)))/fo,8)),printf(' '),printf(unid),fprintf(' \n \n');
  fprintf('\n \n');
else
  fprintf('NO PUEDE UTILIZAR EL MÉTODO '),printf(method),printf(', PORQUE NO CUMPLE EL CRITERIO : '),printf(crit),printf('\n \n');
  return;
endif

%Datos de prueba
%53.45
% 0.00068
%G : 0
%C : 3.853e-08
%fo : 10000