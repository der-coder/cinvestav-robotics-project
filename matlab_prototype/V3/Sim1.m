function varargout = Sim1(varargin)
% SIM1 MATLAB code for Sim1.fig
%      SIM1, by itself, creates a new SIM1 or raises the existing
%      singleton*.
%
%      H = SIM1 returns the handle to a new SIM1 or the handle to
%      the existing singleton*.
%
%      SIM1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIM1.M with the given input arguments.
%
%      SIM1('Property','Value',...) creates a new SIM1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sim1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sim1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sim1

% Last Modified by GUIDE v2.5 07-Oct-2019 16:04:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sim1_OpeningFcn, ...
                   'gui_OutputFcn',  @Sim1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Sim1 is made visible.
function Sim1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sim1 (see VARARGIN)

% Choose default command line output for Sim1
handles.output = hObject;

% Update handles structure
M=[0 0; 0 0; 1 0];
guidata(hObject, handles);
set(handles.edit1,'String',num2str(1));
set(handles.edit2,'String',num2str(1/1.618));
set(handles.edit3,'String',num2str(1));
set(handles.edit4,'String',num2str(15));
set(handles.edit5,'String',num2str(0.3));
set(handles.edit6,'String',num2str(0.2));
set(handles.edit7,'String',num2str(30));
set(handles.radiobutton1,'Value',1);
set(handles.uitable1,'data',M);
set(handles.uitable1,'ColumnName',{'posicion [m]' 'orientación [°]'});
set(handles.uitable1,'RowName',{'î' '^j' '^k'});
handles.axes1
view(45,45);
%-----------------------------------------------------lectura
R1= str2num(get(handles.edit1,'String'));
R2= str2num(get(handles.edit2,'String'));
Lmin= str2num(get(handles.edit3,'String'));
M=get(handles.uitable1,'data');
B=[0 0 0];
rho=3*1.618;
P=M(:,1);
or=M(:,2);
j=1;
STWRT_snapshot(R1,R2,Lmin,B,rho,P,or);
xlim([-R1*1.5 R1*1.5]);
ylim([-R1*1.5 R1*1.5]);
zlim([0 Lmin*2]);


% UIWAIT makes Sim1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Sim1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
R1= str2num(get(handles.edit1,'String'));
R2= str2num(get(handles.edit2,'String'));
Lmin= str2num(get(handles.edit3,'String'));
M=get(handles.uitable1,'data');
B=[0 0 0];
rho=3*1.618;
P=M(:,1);
or=M(:,2);
j=1;
handles.axes1;
cla;
R=max(R1,R2);
xlim([-R*1.5 R*1.5]);
ylim([-R*1.5 R*1.5]);
zlim([0 Lmin*2.5]);
STWRT_snapshot(R1,R2,Lmin,B,rho,P,or);


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton3,'Value',0);
% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
% Hint: get(hObject,'Value') returns toggle state of radiobutton3



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nPuntos=40;
%alerta=0;
%pelicula(nPuntos)=getframe(gca);
R1= str2num(get(handles.edit1,'String'));
R2= str2num(get(handles.edit2,'String'));
Lmin= str2num(get(handles.edit3,'String'));
if get(handles.radiobutton1,'Value')==1%------------------------cadereo
   amp= str2num(get(handles.edit4,'String'));
   figure(1);
xlim([-R1*1.5 R1*1.5]);
ylim([-R1*1.5 R1*1.5]);
zlim([0 Lmin*2]);
   grafico=gcf;
   [alerta,pelicula] = cadereo1(R1,R2,Lmin,amp,nPuntos,grafico);
   close(grafico);
elseif get(handles.radiobutton2,'Value')==1%--------------------balanceo    
   r= str2num(get(handles.edit5,'String'));
   figure(1);
xlim([-R1*1.5 R1*1.5]);
ylim([-R1*1.5 R1*1.5]);
zlim([0 Lmin*2]);
   grafico=gcf;
   [alerta,pelicula] = balanceo1(R1,R2,Lmin,r,nPuntos,grafico);
   close(grafico);
   %set(0, 'CurrentFigure', sim1);
elseif get(handles.radiobutton3,'Value')==1%--------------------tornillo
   h= str2num(get(handles.edit6,'String'));
   angulo= str2num(get(handles.edit7,'String'));
   figure(1);
xlim([-R1*1.5 R1*1.5]);
ylim([-R1*1.5 R1*1.5]);
zlim([0 Lmin*2]);
   grafico=gcf;
   [alerta,pelicula] = screw1(R1,R2,Lmin,h,angulo,nPuntos,grafico);
   close(grafico);
end
    if alerta==1
        uiwait(warndlg('la trayectoria deseada no es factible (hiper-extensión)','Advertencia'));
    elseif alerta==-1
        uiwait(warndlg('la trayectoria deseada no es factible (hiper-compresión)','Advertencia'));
    end
    figure('name','animación','NumberTitle','off','position',[400 0 600 600]);
    for m=1:3;
    for n=1:nPuntos
    imshow(pelicula(n).cdata);
    pause(0.01);
    end
    end
    handles.pelicula=pelicula;
guidata(hObject,handles)
handles.nPuntos=nPuntos;
guidata(hObject,handles)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pelicula=handles.pelicula;
nPuntos=handles.nPuntos;
figure('name','animación','NumberTitle','off','position',[400 0 600 600]);
    for m=1:3;
    for n=1:nPuntos
    imshow(pelicula(n).cdata);
    pause(0.01);
    end
    end
