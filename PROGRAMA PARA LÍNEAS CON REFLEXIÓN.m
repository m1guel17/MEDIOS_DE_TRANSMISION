fprintf('PROGRAMA PARA LÍNEAS CON REFLEXIÓN \n \n');
% DESARROLLADO POR stbn17
fprintf('IMPEDANCIA DE ENTRADA \n');
fprintf(' ---------|--ZA----------| \n');
fprintf('          |              | \n');
fprintf('          |              - \n');
fprintf('          |             | |ZC \n');
fprintf('          |              - \n');
fprintf('          |              | \n');
fprintf(' ---------|--------------| \n');
fprintf('    x     |    l-x=d     | \n');
fprintf('/---------l--------------/ \n');
fprintf('x=0                     x=l \n');
fprintf('d=l                     d=0 \n \n');
Zo = 0;ZOS=num2str(Zo);
Zc = 0;ZCS=num2str(Zc);
Zo = input('Inserte Zo : ');ZOS=num2str(Zo);
ang = 0;
FLAGZC = input('Zc es considerado infinito? [y-0 / n-1] : ');
if FLAGZC == 0
  fprintf(' ------------------------------ \n \n');
  fprintf('rho = (Zc - Zo)/(Zc + Zo) \n');
  fprintf('rho = (Zc)/(Zc) \n');
  rho = 1;
  RHOAS = angle(rho)*180/pi;
  fprintf('rho = 1 + 0i'),printf(' || '),printf(num2str(abs(rho))),printf('/'),printf(num2str(angle(rho))),printf(' RADS || '),printf(num2str(abs(rho))),printf('/'),printf(num2str(RHOAS)),printf('° \n \n');
  k = input('Inserte l(en función de lambda) : lambda * ');
  ang = 2*pi*k;
  angs = ang*180/pi;
  fprintf(' \n');
  fprintf('beta = 2*pi*'),printf(num2str(k)),printf('RADS || '),printf('beta = '),printf(num2str(angs)),printf('° \n \n');
  fprintf('ZA| = -j*Zo*ctg(beta*l) = ZCA\n');
  problem = cot(ang);
  if problem > -2*10^(-15) && problem < 2*10^(-15)
    problem = 0;
  endif
  ZA = -i*Zo*problem;
  fprintf('ZA| = ZCA = -j*'),printf(ZOS),printf(' * '),printf(num2str(problem)),printf(' \n')
  fprintf('ZA| = ZCA = -j*'),printf(num2str(Zo*problem)),printf(' \n');
  ZAAS=angle(ZA)*180/pi;
  fprintf('ZA| = ZCA = '),printf(num2str(ZA)),printf(' || '),printf(num2str(abs(ZA))),printf('/'),printf(num2str(angle(ZA))),printf(' RADS || '),printf(num2str(abs(ZA))),printf('/'),printf(num2str(ZAAS)),printf('° \n \n');
endif
if FLAGZC == 1
  Zc = input('Inserte Zc : ');ZCS=num2str(Zc);
  if Zc == 0
    fprintf(' ------------------------------ \n \n');
    fprintf('rho = (Zc - Zo)/(Zc + Zo) \n');
    fprintf('rho = (0 - Zo)/(0 + Zo) \n');
    fprintf('rho = (-Zo)/(Zo) \n');
    rho = -1;
    RHOAS = angle(rho)*180/pi;
    fprintf('rho = -1 + 0i'),printf(' || '),printf(num2str(abs(rho))),printf('/'),printf(num2str(angle(rho))),printf(' RADS || '),printf(num2str(abs(rho))),printf('/'),printf(num2str(RHOAS)),printf('° \n \n');
    k = input('Inserte l : lambda * ');
    ang = 2*pi*k;
    angs = ang*180/pi;
    fprintf(' \n');
    fprintf('beta = 2*pi*'),printf(num2str(k)),printf(' RADS || '),printf('beta = '),printf(num2str(angs)),printf('° \n \n');
    fprintf('ZA| = j*Zo*tg(beta*l) = ZCC\n');
    fprintf('ZA| = j*Zo*tg('),printf(num2str(angs)),printf(') = ZCC \n');
    problem = tan(ang);
    if problem > -2*10^(-15) && problem < 2*10^(-15)
      problem = 0;
    endif
    ZA = j*Zo*problem;
    fprintf('ZA| = ZCC = j*'),printf(ZOS),printf(' * '),printf(num2str(problem)),printf(' \n')
    fprintf('ZA| = ZCC = j*'),printf(num2str(Zo*problem)),printf(' \n');
    fprintf('ZA| = ZCC = '),printf(num2str(Zo*problem*i)),printf(' \n \n');
    endif
  if Zc ~= 0
    fprintf(' ------------------------------ \n \n');
    x = Zc - Zo;
    y = Zc + Zo;
    rho = x/y;
    RHOAS = angle(rho)*180/pi;
    fprintf('rho = (Zc - Zo)/(Zc + Zo) \n');
    fprintf('rho = ('),printf(ZCS),printf(' - '),printf(ZOS),printf(') / ('),printf(ZCS),printf(' + '),printf(ZOS),printf(') \n');
    fprintf('rho = ('),printf(num2str(x)),printf(') / ('),printf(num2str(y)),printf(') \n');
    fprintf('rho = '),printf(num2str(rho)),printf(' || '),printf(num2str(abs(rho))),printf('/'),printf(num2str(angle(rho))),printf(' RADS || '),printf(num2str(abs(rho))),printf('/'),printf(num2str(RHOAS)),printf('° \n \n');
    k = input('Inserte l : lambda * ');
    ang = 2*pi*k;
    angs = ang*180/pi;
    fprintf(' \n');
    fprintf('beta = 2*pi*'),printf(num2str(k)),printf('RADS || '),printf('beta = '),printf(num2str(angs)),printf('° \n \n');
    fprintf('ZA| = Zo* (Zc + (j Zo*tg(beta*l)))/(Zo + (j Zc*tg(beta*l)))\n');
    problem = tan(ang);
    if problem > -2*10^(-15) && problem < 2*10^(-15)
      problem = 0;
    endif
    cs = Zc + (Zo*problem)*i;
    ci = Zo + (Zc*problem)*i;
    ZA = Zo * cs/ci;
    fprintf('ZA| = '),printf(ZOS),printf(' * ('),printf(ZCS),printf(' + (j*('),printf(ZOS),printf(')*tg('),printf(num2str(angs)),printf('°))) / ('),printf(ZOS),printf(' + (j*('),printf(ZCS),printf(')*tg('),printf(num2str(angs)),printf('°))) \n')
    fprintf('ZA| = '),printf(ZOS),printf(' * ('),printf(num2str(cs)),printf(') / ('),printf(num2str(ci)),printf(') \n');
    fprintf('ZA| = '),printf(ZOS),printf(' * ('),printf(num2str(cs/ci)),printf(') \n');
    ZASD = angle(ZA)*180/pi;
    fprintf('ZA| = '),printf(num2str(ZA)),printf(' || '),printf(num2str(abs(ZA))),printf('/'),printf(num2str(angle(ZA))),printf('RADS || '),printf(num2str(abs(ZA))),printf('/'),printf(num2str(ZASD)),printf('° \n \n');
  endif
endif
fprintf('ZCC*ZCA = (j*Zo*tg(beta*l))*(-j*Zo*ctg(beta*l)) \n');
fprintf('       ____________ \n');
fprintf('Zo = |/ ZCC * ZCA  \n \n');
fprintf('ZCC/ZCA = (j*Zo*tg(beta*l))/(-j*Zo*ctg(beta*l)) \n');
fprintf('               ____________ \n');
fprintf('tg(beta*l) = |/ -ZCC / ZCA  \n \n');

fprintf('RELACIÓN DE ONDA ESTACIONARIA (ROE | SWR) \n')
fprintf('SWR = ROE = (1 + |rho|)/(1 - |rho|) \n');
value_rho = abs(rho);
if rho == 0
  fprintf('SWR = ROE = 1 \n \n');
endif
if value_rho == 1
  fprintf('SWR = ROE = inf \n \n');
endif
if rho ~= 0 && value_rho ~= 1
  ROE = (1+abs(rho))/(1-abs(rho));
  fprintf('SWR = ROE = '),fprintf(num2str(ROE)),printf(' \n \n');
endif
fprintf('PATRÓN DE ONDA ESTACIONARIA (POE | SWP) \n')
fprintf('SWP = POE = |V(a)| \n');
fprintf('SWP = POE(ZCA) = 2*V1*|Cos(beta*d)| \n');
fprintf('SWP = POE(ZCC) = 2*V1*|Sen(beta*d)| \n \n');

fprintf('dmax = ((varphi +- 2*n*pi) * lambda)/(4*pi) \n');
s_angle = angle(rho);
fprintf('dmax = (('),printf(num2str(s_angle)),printf(' +- 2*n*pi) * lambda)/(4*pi) \n');
fprintf('dmax = ('),printf(num2str(s_angle)),printf(' * lambda)/(4*pi) \n');
dmax = s_angle /(4*pi);
fprintf('dmax = '),printf(num2str(dmax)),printf(' * lambda \n \n');

fprintf('dmin = ((varphi +- (2*n + 1)*pi) * lambda)/(4*pi) \n');
s_angle_min = angle(rho) + pi;
fprintf('dmin = (('),printf(num2str(angle(rho))),printf(' +- pi) * lambda)/(4*pi) \n');
fprintf('dmin = ('),printf(num2str(s_angle_min)),printf(' * lambda)/(4*pi) \n');
dmin = s_angle_min /(4*pi);
fprintf('dmin = '),printf(num2str(dmin)),printf(' * lambda \n \n');