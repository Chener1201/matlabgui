function varargout = bcgk(varargin)
% BCGK MATLAB code for bcgk.fig
%      BCGK, by itself, creates a new BCGK or raises the existing
%      singleton*.
%
%      H = BCGK returns the handle to a new BCGK or the handle to
%      the existing singleton*.
%
%      BCGK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BCGK.M with the given input arguments.
%
%      BCGK('Property','Value',...) creates a new BCGK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bcgk_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bcgk_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bcgk

% Last Modified by GUIDE v2.5 31-Dec-2021 14:43:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bcgk_OpeningFcn, ...
                   'gui_OutputFcn',  @bcgk_OutputFcn, ...
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


% --- Executes just before bcgk is made visible.
function bcgk_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bcgk (see VARARGIN)

% Choose default command line output for bcgk
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global baitap;
baitap = 0;

% UIWAIT makes bcgk wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bcgk_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Runbutton.
function Runbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Runbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global baitap
switch baitap
case 8
cla (handles.axes3,'');
f = @(x) x.^2 - 10*log10(x) - 2;
a = 2;
b = 3;
ss = 0.005;
p = get(handles.popupmenu1,'value');
if (p==1)
    g = @(x) sqrt(10*log10(x) + 2);
    [x1] = lap(g,a,b,ss);
    set(handles.kq, 'string', x1);
    n = linspace(a,b,20);
    y =g(n);
    axes(handles.axes3);
    plot(n,y,'r');
    hold on;
    t=@(x) x;
    n = linspace(a,b,20);
    t =t(n);
    plot(n,t,'b');
else if (p==2)
    cla (handles.axes3,'');
    [x1]= pptt(f,a,b,ss);
    set(handles.kq, 'string', x1);
    n = linspace(a,b,20);
    y =f(n);
    axes(handles.axes3);
    plot(n,y,'r');
    else
    cla (handles.axes3,'');
    [x1] = ppdaycung(f,a,b,ss); 
    set(handles.kq, 'string', x1);
    n = linspace(a,b,30);
    y =f(n);
    axes(handles.axes3);
    plot(n,y,'r');
    end
end
case 9
    cla (handles.axes3,'');
p1 = get(handles.popupmenu2,'value');
if (p1==1)
    txt = '[5 3 1 2; 4 7 2 1; 1 3 9 2; 2 1 0 8]';
    set(handles.fx, 'string', txt);
    txt1 = '[6; 6; 10; 2]';
    set(handles.lim, 'string', txt1);
    A=[5 3 1 2; 4 7 2 1; 1 3 9 2; 2 1 0 8];
    B=[6; 6; 10; 2];
    [k] = G_J(A,B)
    %set(handles.kq, 'string', k);
    set(handles.kq,'string',[num2str(k')]); 
else if (p1==2)
    txt3 = '[7 2 0 1; 1 0 3 2; 2 1 0 3; 3 0 2 7]';
    set(handles.fx, 'string', txt3);
    txt4 = '[3; 2; 4; 7]';
    set(handles.lim, 'string', txt4);
    A=[7 2 0 1; 1 0 3 2; 2 1 0 3; 3 0 2 7];
    B=[3; 2; 4; 7];
    [k] = G_J(A,B)
    %set(handles.kq, 'string', k);
    set(handles.kq,'string',[num2str(k')]); 
else
    txt5 = '[3,5 1,1 0,1 -0,1; 1,0 -3,1 1,0 0,2; 0,1 1,0 5,7 -0,2; -0,1 0,2 -0,2 2,1]';
    set(handles.fx, 'string', txt5);
    txt6 = '[0,2; 0,8; 5,9; -2,3]';
    set(handles.lim, 'string', txt6);
    A=[3.5 1.1 0.1 -0.1; 1.0 -3.1 1.0 0.2; 0.1 1.0 5.7 -0.2; -0.1 0.2 -0.2 2.1];
    B=[0.2; 0.8; 5.9; -2.3];
    [k] = G_J(A,B)
    %set(handles.kq, 'string', k);
    set(handles.kq,'string',[num2str(k')]); 
    end
end
case 10
cla (handles.axes3,'');
c=[0.78 1.56 2.34 3.12 3.81];
d=[2.5 1.2 1.12 2.25 4.28];
xi4 = sum(c.^4);
xi3 = sum(c.^3);
xi2 = sum(c.^2);
yixi2 = sum(d.*c.^2);
yixi = sum(d.*c);
xi = sum(c);
n = 5;
yi = sum(d);
A = [xi4 xi3 xi2;xi3 xi2 xi;xi2 xi n];
B = [yixi2;yixi;yi];
[k] = G_J(A,B);
%set(handles.kq,'string',k');
set(handles.kq,'string',[num2str(k')]); 
n = -2:1:6;
h=@(x) 1.0023*x.^2-4.0139*x+5.0218;
y = h(n);
axes(handles.axes3);
plot(n,y,'r');
otherwise
cla (handles.axes3,'');
p2 = get(handles.popupmenu3,'value');
h=0.1;
N=4;
xdau = 0.1;
xcuoi=0.5;
y0=0.04;
fxy=@(x,y) y.^2 +y/x;
if (p2==1)
    axes(handles.axes3);
    [x,y] = Euler(fxy,xdau,xcuoi,y0,N);
    set(handles.c12,'string',['x= ',num2str(x)]);
    set(handles.c11,'string',['y= ',num2str(y)]);
    plot(x,y,'r');
else if (p2==2)
        axes(handles.axes3);
        [x,y] = Euler_CT(fxy,xdau,xcuoi,y0,N);
        set(handles.c12,'string',['x= ',num2str(x)]);
        set(handles.c11,'string',['y= ',num2str(y)]);
        plot(x,y,'b');
    else
        axes(handles.axes3);
        [x,y] = RK4(fxy,xdau,xcuoi,y0,N);
        set(handles.c12,'string',['x= ',num2str(x)]);
        set(handles.c11,'string',['y= ',num2str(y)]);
        plot(x,y,'g');
    end
end
end
% --- Executes on button press in BTC8.

function BTC8_Callback(hObject, eventdata, handles)
% hObject    handle to BTC8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
text1 = 'Bai 3.2 (so 3) /103';
set(handles.BTC8,'string',text1);
dulieu='x^2 - 10lgx = 2';
set(handles.fx,'string',dulieu);
dulieu1='[2,3]';
set(handles.lim,'string',dulieu1);
global baitap
baitap = 8;

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BTC9.
function BTC9_Callback(hObject, eventdata, handles)
% hObject    handle to BTC9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
text2 = '4.1 (bai so 1,2,3)/157';
set(handles.BTC9,'string',text2);
text3 = 'Ma tran A';
set(handles.text11,'string',text3);
text4 = 'Ma tran B';
set(handles.text12,'string',text4);
text5 = 'Nghiem cua Ax=b';
set(handles.text13,'string',text5);
global baitap
baitap = 9;
    
function fx_Callback(hObject, eventdata, handles)
% hObject    handle to fx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fx as text
%        str2double(get(hObject,'String')) returns contents of fx as a double


% --- Executes during object creation, after setting all properties.
function fx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lim_Callback(hObject, eventdata, handles)
% hObject    handle to lim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lim as text
%        str2double(get(hObject,'String')) returns contents of lim as a double


% --- Executes during object creation, after setting all properties.
function lim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kq_Callback(hObject, eventdata, handles)
% hObject    handle to kq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kq as text
%        str2double(get(hObject,'String')) returns contents of kq as a double


% --- Executes during object creation, after setting all properties.
function kq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function logotruong_CreateFcn(hObject, eventdata, handles)
axis off
img = imread('D:\Data_Learning\Nhi\matlab\dhkhtn.jpeg');
imshow(img);
% hObject    handle to logotruong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate logotruong


% --- Executes during object creation, after setting all properties.
function hinhanhcanhan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hinhanhcanhan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate hinhanhcanhan
axis off
img1 = imread('D:\Data_Learning\Nhi\matlab\nhi413.jpg');
imshow(img1);


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tex2 = '5.14 (bai so 2)';
set(handles.pushbutton4,'string',tex2);
tex3 = 'x';
set(handles.text11,'string',tex3);
tex6 = '[0,78  1,56  2,34  3,12  3,81]';
set(handles.fx, 'string', tex6);
tex4 = 'y';
set(handles.text12,'string',tex4);
tex7 = '[2,5  1,2  1,12  2,25  4,28]';
set(handles.lim, 'string', tex7);
tex5 = 'Nghiem cua a0 a1 a2';
set(handles.text13,'string',tex5);
global baitap
baitap = 10;

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
te = '6.7 (bai so 3)';
set(handles.pushbutton5,'string',te);
te1 = 'phuong trinh dy/dx';
set(handles.text11,'string',te1);
te2 = 'y^2 + y/x';
set(handles.fx, 'string', te2);
te3 = 'khoang nghiem và h';
set(handles.text12,'string',te3);
te4 = '[0;0,5] và h=0.1';
set(handles.lim, 'string', te4);
te5 = 'y(2)';
set(handles.text13,'string',te5);
te6 = '4';
set(handles.kq, 'string', te6);
global baitap
baitap = 11;

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c12_Callback(hObject, eventdata, handles)
% hObject    handle to c12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c12 as text
%        str2double(get(hObject,'String')) returns contents of c12 as a double


% --- Executes during object creation, after setting all properties.
function c12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c11_Callback(hObject, eventdata, handles)
% hObject    handle to c11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c11 as text
%        str2double(get(hObject,'String')) returns contents of c11 as a double


% --- Executes during object creation, after setting all properties.
function c11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
