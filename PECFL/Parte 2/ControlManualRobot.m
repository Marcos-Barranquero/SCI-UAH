
clear all;
close all;
rosshutdown
global vel_angular;
global vel_lineal;
global incAngular;
global incLineal;
global vel_angular_max;
global vel_lineal_max;
global stop
ROS_MASTER_IP = '192.168.1.189';
ROS_IP = '192.168.1.89';

rosinit(['http://', ROS_MASTER_IP, ':11311'], 'NodeHost', ROS_IP)

%DECLARACION DE PUBLISHERS
%Velocidad
pub_vel=rospublisher('/robot0/cmd_vel','geometry_msgs/Twist');
%%DECLARACIÓN DE SUBSCRIBERS
odom = rossubscriber('/robot0/odom'); % Subscripcion a la odometria
% Subscripcion a los sensores
sonar_0 = rossubscriber('/robot0/sonar_0', rostype.sensor_msgs_Range);
sonar_1 = rossubscriber('/robot0/sonar_1', rostype.sensor_msgs_Range);
sonar_2 = rossubscriber('/robot0/sonar_2', rostype.sensor_msgs_Range);
sonar_3 = rossubscriber('/robot0/sonar_3', rostype.sensor_msgs_Range);
sonar_4 = rossubscriber('/robot0/sonar_4', rostype.sensor_msgs_Range);
sonar_5 = rossubscriber('/robot0/sonar_5', rostype.sensor_msgs_Range);
sonar_6 = rossubscriber('/robot0/sonar_6', rostype.sensor_msgs_Range);
sonar_7 = rossubscriber('/robot0/sonar_7', rostype.sensor_msgs_Range);
%GENERACION DE MENSAJES
msg_vel=rosmessage(pub_vel);

vel_angular=0;
vel_lineal = 0;
incAngular = 0.1;
incLineal = 0.1;
vel_angular_max = 1;
vel_lineal_max = 1;
fig = figure('KeyPressFcn',@Key_Down);
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

  training=[];

stop = 0;
while (stop==0)
    pos=odom.LatestMessage.Pose.Pose.Position;
    x=pos.X;
    y=pos.Y;
    ori=odom.LatestMessage.Pose.Pose.Orientation;    
    theta=quat2eul([ori.W ori.X ori.Y ori.Z]);
    theta=theta(1);       
    s0= sonar_0.LatestMessage.Range_;
    s1= sonar_1.LatestMessage.Range_;
    s2= sonar_2.LatestMessage.Range_;
    s3= sonar_3.LatestMessage.Range_;
    s4= sonar_4.LatestMessage.Range_;
    s5= sonar_5.LatestMessage.Range_;
    s6= sonar_6.LatestMessage.Range_;
    s7= sonar_7.LatestMessage.Range_;
   training=[training;[s0,s1,s2,s3,s4,s5,s6,s7,x,y,theta,vel_angular,vel_lineal]];
   msg_vel.Linear.X = vel_lineal;
   msg_vel.Angular.Z = vel_angular;
   send(pub_vel,msg_vel);
   pause(0.1);
end
vel_lineal =0;
vel_angular =0;
msg_vel.Linear.X = vel_lineal;
msg_vel.Angular.Z = vel_angular;
send(pub_vel,msg_vel);
save datos_entrenamiento_con_obs training


