  function Key_Down(src,event)
global vel_angular;
global vel_lineal;
global incAngular;
global incLineal;
global vel_angular_max;
global vel_lineal_max;
global stop

  if(strcmp(event.Key,'rightarrow'))
     vel_angular= max(vel_angular - incAngular, -vel_angular_max);
  end
  if(strcmp(event.Key,'leftarrow'))
     vel_angular= min(vel_angular + incAngular, vel_angular_max);
  end
    if(strcmp(event.Key,'downarrow'))
     vel_lineal= max(vel_lineal - incLineal, -vel_lineal_max);
  end
  if(strcmp(event.Key,'uparrow'))
     vel_lineal= min(vel_lineal + incLineal, vel_lineal_max);
  end
  if(strcmp(event.Key,'space'))
     stop = 1;
  end
  
  
  if (abs(vel_angular)<1e-12)
  vel_angular = 0.0;
  end
    if (abs(vel_lineal)<1e-12)
  vel_lineal = 0.0;
    end
  
  disp(sprintf('Vel lineal %g m/s | Vel angular %g rad/s', vel_lineal, vel_angular)) 
  clf
  t = text(0.1,0.9,'Manten el foco en esta ventana','HorizontalAlignment','left');
  t.FontSize = 16;
  
  t = text(0.1,0.8,'- Pulsa Flechas ARRIBA/ABAJO para modificar V en 0.1 m/s','HorizontalAlignment','left');
  t.FontSize = 13;
  t = text(0.1,0.7,'- Pulsa Flechas IZQUIERDA/DERECHA para modificar W en 0.1 rad/s','HorizontalAlignment','left');
  t.FontSize = 13;
  t = text(0.1,0.6,'- Pulsa ESPACIO para finalizar','HorizontalAlignment','left');
  t.FontSize = 13;

  t = text(0.1,0.4,sprintf('Vel lineal actual %g m/s | Vel angular actual %g rad/s', vel_lineal, vel_angular),'HorizontalAlignment','left');
  t.FontSize = 14;
  end