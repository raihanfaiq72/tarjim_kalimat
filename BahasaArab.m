    function varargout = Tarjim(varargin)
%   faiq coba github
% Tarjim MATLAB code for Tarjim.fig
%      Tarjim, by itself, creates a new Tarjim or raises the existing
%      singleton*.
%
%      H = Tarjim returns the handle to a new Tarjim or the handle to
%      the existing singleton*.
%
%      Tarjim('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Tarjim.M with the given input arguments.
%
%      Tarjim('Property','Value',...) creates a new Tarjim or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tarjim_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tarjim_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tarjim

% Last Modified by GUIDE v2.5 11-Oct-2022 21:45:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tarjim_OpeningFcn, ...
                   'gui_OutputFcn',  @Tarjim_OutputFcn, ...
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


% --- Executes just before Tarjim is made visible.
function Tarjim_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Tarjim (see VARARGIN)

% Choose default command line output for Tarjim
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Tarjim wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%wallpaper
[back map] = imread('UDINUS.png');


% --- Outputs from this function are returned to the command line.
function varargout = Tarjim_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, ~, handles)

%Proses RGB to Grayscale
open=guidata(gcbo);
g=get(open.axes1,'Userdata');
Igray=rgb2gray(g);
set(open.figure1,'CurrentAxes',open.axes2);
set(imshow(Igray));
set(open.figure1,'Userdata',Igray);
set(open.axes2,'Userdata',Igray);

%Proses Grayscale to Threeshold
open=guidata(gcbo);
Igray=get(open.axes2,'Userdata');
Ibw=im2bw(Igray);
set(open.figure1,'CurrentAxes',open.axes3);
set(imshow(Ibw));
set(open.figure1,'Userdata',Ibw);
set(open.axes3,'Userdata',Ibw);

%Proses Treeshold to Garis Tepi
open=guidata(gcbo);
tepi=get(open.axes3,'Userdata');
Itepi=tepibiner(tepi);
set(open.figure1,'CurrentAxes',open.axes4);
set(imshow(Itepi));
set(open.figure1,'Userdata',Itepi);
set(open.axes4,'Userdata',Itepi);

%Proses Mencari txt_hasil Objek
L=luas(Itepi);
handles.luas=L;
guidata(hObject,handles);
set(handles.txt_luas,'string',L);

% Histogram
set(open.figure1,'CurrentAxes',open.axes97);
imhist(g)
set(open.figure1,'Userdata',g);
set(open.axes97,'Userdata',g);

set(open.figure1,'CurrentAxes',open.axes98);
imhist(Igray)
set(open.figure1,'Userdata',Igray);
set(open.axes98,'Userdata',Igray);


set(open.figure1,'CurrentAxes',open.axes99);
imhist(Ibw)
set(open.figure1,'Userdata',Ibw);
set(open.axes99,'Userdata',Ibw);


set(open.figure1,'CurrentAxes',open.axes100);
imhist(Itepi)
set(open.figure1,'Userdata',Itepi);
set(open.axes100,'Userdata',Itepi);


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton6.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Melakukan Testing
Y = get(handles.txt_luas,'string')

if (Y=='1819')
 set(handles.hasil,'string','ngunjuk')
 set(handles.latin,'string','syaroba')
 
elseif (Y=='2071')
 set(handles.hasil,'string','duduk')
 set(handles.latin,'string','jalasa')
 elseif (Y=='2356')
 set(handles.hasil,'string','nutuk')
 set(handles.latin,'string','dhoroba')

elseif (Y=='2524')
 set(handles.hasil,'string','guru')
 set(handles.latin,'string','mudarrasun')

elseif (Y=='1850')
 set(handles.hasil,'string','bulan')
 set(handles.latin,'string','syahrun')

elseif (Y=='1180')
 set(handles.hasil,'string','gigi')
 set(handles.latin,'string','sinun')

elseif (Y=='2652')
 set(handles.hasil,'string','hidung')
 set(handles.latin,'string','al`anf')

elseif (Y=='1758')
 set(handles.hasil,'string','kepala')
 set(handles.latin,'string','ra`sun')

elseif (Y=='1535')
 set(handles.hasil,'string','mata')
 set(handles.latin,'string','ainun')

elseif (Y=='1652')
 set(handles.hasil,'string','membaca')
 set(handles.latin,'string','qara`a')

elseif (Y=='1807')
 set(handles.hasil,'string','membunuh')
 set(handles.latin,'string','qatala')

elseif (Y=='2324')
 set(handles.hasil,'string','makan')
 set(handles.latin,'string','akala')
 set(handles.latin,'string','ta`akul')
 

elseif (Y=='2226')
 set(handles.hasil,'string','berjalan')
 set(handles.latin,'string','masya')

elseif (Y=='1717')
 set(handles.hasil,'string','melihat')
 set(handles.latin,'string','nadara')
 set(handles.latin,'string','nara`a')

elseif (Y=='1963')
 set(handles.hasil,'string','komputer')
 set(handles.latin,'string','alhasub')

elseif (Y=='1001')
 set(handles.hasil,'string','gambar')
 set(handles.latin,'string','surotun')

elseif (Y=='1345')
 set(handles.hasil,'string','televisi')
 set(handles.latin,'string','tilifiziun')

elseif (Y=='1220')
 set(handles.hasil,'string','buku')
 set(handles.latin,'string','kitabun')

elseif (Y=='2022')
 set(handles.hasil,'string','bolpen')
 set(handles.latin,'string','qalam')

elseif (Y=='2116')
 set(handles.hasil,'string','matahari')
 set(handles.latin,'string','syamsun')

elseif (Y=='1426')
 set(handles.hasil,'string','rumah')
 set(handles.latin,'string','bayt')

elseif (Y=='2091')
 set(handles.hasil,'string','sekolah')
 set(handles.latin,'string','madrasah')

elseif (Y=='2154')
 set(handles.hasil,'string','bunga')
 set(handles.latin,'string','zahra')

elseif (Y=='1896')
 set(handles.hasil,'string','kabel')
 set(handles.latin,'string','kabil')
 
 elseif (Y=='1771')
 set(handles.hasil,'string','telinga')
 set(handles.latin,'string','udzunun')
 
%deklarasi anggota tubuh
 elseif (Y=='2540')
 set(handles.hasil,'string','dada')
 set(handles.latin,'string',' adzh dhzohru')
 
 elseif (Y=='2527')
 set(handles.hasil,'string','mata')
 set(handles.latin,'string','ainun')
 
  elseif (Y=='2787')
 set(handles.hasil,'string','kepala')
 set(handles.latin,'string','rosun')
 
  elseif (Y=='2864')
 set(handles.hasil,'string','Hidung')
 set(handles.latin,'string','anfun')
 
   elseif (Y=='1919')
 set(handles.hasil,'string','pundak')
 set(handles.latin,'string','kutuf')
 
   elseif (Y=='2853')
 set(handles.hasil,'string','lidah')
 set(handles.latin,'string','lisan')
 
    elseif (Y=='2333')
 set(handles.hasil,'string','kaki')
 set(handles.latin,'string','qodamu')
 
    elseif (Y=='3024')
 set(handles.hasil,'string','Telinga')
 set(handles.latin,'string','udzunun')
 
    elseif (Y=='1833')
 set(handles.hasil,'string','Tangan')
 set(handles.latin,'string','Al-yaddu')

 
 %deklarasi sayuran
 
 elseif (Y=='2555')
 set(handles.hasil,'string','kentang')
 set(handles.latin,'string','Batotis')
 
  elseif (Y=='1998')
 set(handles.hasil,'string','Jagung')
 set(handles.latin,'string','Dhurroh')
 
  elseif (Y=='3266')
 set(handles.hasil,'string','Kacang panjang')
 set(handles.latin,'string','fasulia')
 
  elseif (Y=='2315')
 set(handles.hasil,'string','cabai')
 set(handles.latin,'string','fulful')
 
  elseif (Y=='2218')
 set(handles.hasil,'string','wortel')
 set(handles.latin,'string','Jarozun')
 
  elseif (Y=='2047')
 set(handles.hasil,'string','kol/kubis')
 set(handles.latin,'string','Kurnubun')
 
  elseif (Y=='3120')
 set(handles.hasil,'string','Daun bawang')
 set(handles.latin,'string','Kurrosun')
 
  elseif (Y=='2671')
 set(handles.hasil,'string','kol/kubis')
 set(handles.latin,'string','Malfufun')
 
  elseif (Y=='3338')
 set(handles.hasil,'string','Brokoli')
 set(handles.latin,'string','Qornabitu')
 
  elseif (Y=='2606')
 set(handles.hasil,'string','Bayam')
 set(handles.latin,'string','Sabanakhun')
 
 
 %deklarasi kalimat
 
   elseif (Y=='2756')
 set(handles.hasil,'string','kepasar untuk membeli bahan makanan')
 set(handles.latin,'string','-')
 
    elseif (Y=='1991')
 set(handles.hasil,'string','apakah engkau akan membeli sayur?')
 set(handles.latin,'string','-')
 
    elseif (Y=='2678')
 set(handles.hasil,'string','iyaa, apa kamu mau titip sayur?')
 set(handles.latin,'string','-')
 
    elseif (Y=='3410')
 set(handles.hasil,'string','yap! belikan wortel ya')
 set(handles.latin,'string','-')
 
    elseif (Y=='2792')
 set(handles.hasil,'string','okeee, ada yang lain?')
 set(handles.latin,'string','-')
 
    elseif (Y=='2640')
 set(handles.hasil,'string','hii mom , mo kemana?')
 set(handles.latin,'string','-')
 
else
 set(handles.hasil,'string','salah')
end


%MENAMPILKAN HURUF BAHASA ARAB

% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
x=imread('jalasa-01.jpg');
imshow(x);
set(gca,'Tag','axes5');
% hObject    handle to axes17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes5

% --- Executes during object creation, after setting all properties.
function axes6_CreateFcn(hObject, eventdata, handles)
x=imread('dhoroba-01.jpg');
imshow(x);
set(gca,'Tag','axes6');
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes6

% --- Executes during object creation, after setting all properties.
function axes7_CreateFcn(hObject, eventdata, handles)
x=imread('jalasa-01.jpg');
imshow(x);
set(gca,'Tag','axes7');
% hObject    handle to axes7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes7

% --- Executes during object creation, after setting all properties.
function axes8_CreateFcn(hObject, eventdata, handles)
x=imread('syaroba-01.jpg');
imshow(x);
set(gca,'Tag','axes8');
% hObject    handle to axes8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes8

% --- Executes during object creation, after setting all properties.
function axes9_CreateFcn(hObject, eventdata, handles)
x=imread('guru-01.jpg');
imshow(x);
set(gca,'Tag','axes9');
% hObject    handle to axes9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes9


% --- Executes during object creation, after setting all properties.
function axes10_CreateFcn(hObject, eventdata, handles)
x=imread('bulan-01.jpg');
imshow(x);
set(gca,'Tag','axes10');
% hObject    handle to axes10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes10


% --- Executes during object creation, after setting all properties.
function axes11_CreateFcn(hObject, eventdata, handles)
x=imread('gigi-01.jpg');
imshow(x);
set(gca,'Tag','axes11');
% hObject    handle to axes11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes11


% --- Executes during object creation, after setting all properties.
function axes12_CreateFcn(hObject, eventdata, handles)
x=imread('hidung-01.jpg');
imshow(x);
set(gca,'Tag','axes12');
% hObject    handle to axes12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes12


% --- Executes during object creation, after setting all properties.
function axes13_CreateFcn(hObject, eventdata, handles)
x=imread('kepala-01.jpg');
imshow(x);
set(gca,'Tag','axes13');
% hObject    handle to axes13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes13



% --- Executes during object creation, after setting all properties.
function axes14_CreateFcn(hObject, eventdata, handles)
x=imread('mata-01.jpg');
imshow(x);
set(gca,'Tag','axes14');
% hObject    handle to axes14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes14



% --- Executes during object creation, after setting all properties.
function axes15_CreateFcn(hObject, eventdata, handles)
x=imread('membaca-01.jpg');
imshow(x);
set(gca,'Tag','axes15');

% hObject    handle to axes15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes15


% --- Executes during object creation, after setting all properties.
function axes16_CreateFcn(hObject, eventdata, handles)
x=imread('membunuh-01.jpg');
imshow(x);
set(gca,'Tag','axes16');

% hObject    handle to axes16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes16


% --- Executes during object creation, after setting all properties.
function axes17_CreateFcn(hObject, eventdata, handles)
x=imread('makan.jpg');
imshow(x);
set(gca,'Tag','axes17');

% hObject    handle to axes17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes17



% --- Executes during object creation, after setting all properties.
function axes18_CreateFcn(hObject, eventdata, handles)
x=imread('berjalan.jpg');
imshow(x);
set(gca,'Tag','axes18');

% hObject    handle to axes18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes18


% --- Executes during object creation, after setting all properties.
function axes19_CreateFcn(hObject, eventdata, handles)
x=imread('melihat.jpg');
imshow(x);
set(gca,'Tag','axes19');

% hObject    handle to axes19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes19



% --- Executes during object creation, after setting all properties.
function axes20_CreateFcn(hObject, eventdata, handles)
x=imread('komputer.jpg');
imshow(x);
set(gca,'Tag','axes20');

% hObject    handle to axes20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes20


% --- Executes during object creation, after setting all properties.
function axes21_CreateFcn(hObject, eventdata, handles)
x=imread('gambar.jpeg');
imshow(x);
set(gca,'Tag','axes21');

% hObject    handle to axes21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes21


% --- Executes during object creation, after setting all properties.
function axes22_CreateFcn(hObject, eventdata, handles)
x=imread('televisi.jpeg');
imshow(x);
set(gca,'Tag','axes22');

% hObject    handle to axes22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes22



% --- Executes during object creation, after setting all properties.
function axes23_CreateFcn(hObject, eventdata, handles)
x=imread('buku.jpeg');
imshow(x);
set(gca,'Tag','axes23');

% hObject    handle to axes23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes23



% --- Executes during object creation, after setting all properties.
function axes24_CreateFcn(hObject, eventdata, handles)
x=imread('bolpen.jpg');
imshow(x);
set(gca,'Tag','axes24');

% hObject    handle to axes25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes25



% --- Executes during object creation, after setting all properties.
function axes25_CreateFcn(hObject, eventdata, handles)
x=imread('matahari.jpg');
imshow(x);
set(gca,'Tag','axes25');

% hObject    handle to axes25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes25



% --- Executes during object creation, after setting all properties.
function axes26_CreateFcn(hObject, eventdata, handles)
x=imread('rumah.jpg');
imshow(x);
set(gca,'Tag','axes26');

% hObject    handle to axes26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes26



% --- Executes during object creation, after setting all properties.
function axes27_CreateFcn(hObject, eventdata, handles)
x=imread('sekolah.jpg');
imshow(x);
set(gca,'Tag','axes27');
% hObject    handle to axes27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes27



% --- Executes during object creation, after setting all properties.
function axes28_CreateFcn(hObject, eventdata, handles)
x=imread('bunga.jpg');
imshow(x);
set(gca,'Tag','axes28');

% hObject    handle to axes28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes28


% --- Executes during object creation, after setting all properties.
function axes29_CreateFcn(hObject, eventdata, handles)
x=imread('kabel.jpg');
imshow(x);
set(gca,'Tag','axes29');
% hObject    handle to axes29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes29



%TOMBOL PILIHAN HURUF AKSARA SUNDA


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('jalasa-01.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('dhoroba-01.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('jalasa-01.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('syaroba-01.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I=imread('guru-01.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('bulan-01.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('gigi-01.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('hidung-01.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('kepala-01.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('mata-01.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('membaca-01.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('membunuh-01.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('makan.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('berjalan.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('melihat.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('komputer.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('gambar.jpeg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('televisi.jpeg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('buku.jpeg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('bolpen.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('matahari.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('rumah.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('sekolah.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('bunga.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)

open=guidata(gcbo);
I=imread('kabel.jpg');
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
clc
close
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function txt_luas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_luas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function latin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to latin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton55.
function pushbutton55_Callback(hObject, eventdata, handles)
[nama_file,nama_path] = uigetfile({'*.jpg'},....
    'PILIH FOLDER');

if isequal (nama_file,0)
else 
    open=guidata(gcbo)
    I = imread(fullfile(nama_path,nama_file));
    set(open.figure1,'CurrentAxes',open.axes1);
    set(imagesc(I));
    set(open.axes1,'UserData',I);
    return
end
% hObject    handle to pushbutton55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton56.
function pushbutton56_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nama_file,nama_path] = uigetfile({'*.jpg'},....
    'PILIH FOLDER');

if isequal (nama_file,0)
else 
    open=guidata(gcbo)
    I = imread(fullfile(nama_path,nama_file));
    set(open.figure1,'CurrentAxes',open.axes1);
    set(imagesc(I));
    set(open.axes1,'UserData',I);
    return
end



% --- Executes during object creation, after setting all properties.
function axes97_CreateFcn(hObject, eventdata, handles)
% Histogram citra asli 

% handles    empty - handles not created until after all CreateFcns called


% Hint: place code in OpeningFcn to populate axes97


% --- Executes on button press in pushbutton57.
function pushbutton57_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
