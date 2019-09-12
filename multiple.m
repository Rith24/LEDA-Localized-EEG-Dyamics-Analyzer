

%patientList = {};
%controlList = {};
%mixedList = {};

function varargout = multiple(varargin)
% MULTIPLE MATLAB code for multiple.fig
%      MULTIPLE, by itself, creates a new MULTIPLE or raises the existing
%      singleton*.
%
%      H = MULTIPLE returns the handle to a new MULTIPLE or the handle to
%      the existing singleton*.
%
%      MULTIPLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MULTIPLE.M with the given input arguments.
%
%      MULTIPLE('Property','Value',...) creates a new MULTIPLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before multiple_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to multiple_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help multiple

% Last Modified by GUIDE v2.5 24-Aug-2019 17:44:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @multiple_OpeningFcn, ...
                   'gui_OutputFcn',  @multiple_OutputFcn, ...
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


% --- Executes just before multiple is made visible.
function multiple_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to multiple (see VARARGIN)

% Choose default command line output for multiple
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes multiple wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = multiple_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1

patientList = get(handles.listbox1,'String');

category = "patient";
number = 1;

if length(patientList) > 1
    for i=2:length(patientList)
        disp(patientList);
        disp(patientList(i, 1));
        name = char(patientList(i,1));
        subject = num2str(number);
        createGIF(name, category, subject);
        number = number + 1;
    
    end 
end

controlList = get(handles.listbox2,'String');

category = "control";
number = 1;

if length(controlList) > 1
    for i=2:length(controlList)
        disp(controlList);
        disp(controlList(i, 1));
        name = char(controlList(i,1));
        subject = num2str(number);
        createGIF(name, category, subject);
        number = number + 1;
    
    end 
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(~, ~, ~)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
list = get(handles.listbox1,'String');
patientList = list.';
disp(patientList);

patientlsad = [];
controllsad = [];
 
for i=2:length(patientList)
    disp(patientList(1,i));
    filename = char(patientList(1, i));
    F = count_activation_duration(filename,'Frontal Lobe');
    T = count_activation_duration(filename,'Temporal Lobe');
    P = count_activation_duration(filename,'Parietal Lobe');
    O = count_activation_duration(filename,'Occipetal Lobe');
    
    
    patientlsad = [patientlsad; F T P O];
    disp(patientlsad);
    
   
end
    


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, path] = uigetfile('*.xlsx');

if ischar(filename)
    filePath = fullfile(path, filename);
    
    % get the current set of files in the listbox
    patientList = get(handles.listbox1,'String');
    
    if isempty(patientList)
        patientList = {};
    
    end
    
    patientList = [patientList; filePath];
    
    set(handles.listbox1,'String',patientList);
    

end 

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, path] = uigetfile('*.xlsx');

if ischar(filename)
    filePath = fullfile(path, filename);
    
    % get the current set of files in the listbox
    controlList = get(handles.listbox2,'String');
    
    if isempty(controlList)
        controlList = {};
    
    end
    
    controlList = [controlList; filePath];
    
    set(handles.listbox2,'String',controlList);
    
end
    


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, path] = uigetfile('*.xlsx');

if ischar(filename)
    filePath = fullfile(path, filename);
    
    % get the current set of files in the listbox
    mixedList = get(handles.listbox3,'String');
    
    if isempty(mixedList)
        mixedList = {};
    
    end
    
    mixedList = [mixedList; filePath];
    
    set(handles.listbox3,'String',mixedList);
    
end
    


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




function createGIF(name, category, subject)
%% import file data, initialize variables
% [x] = xlsread('/Users/deepagupta/Google Drive/Dr Choa PhD/05 EEG/SCHIZ proj txt files /2016_01 fresh start/shared with NG /20170630_1st1000msEEGnotERP/theta_excel/P7 1st 500 theta 4 to 8 hz.xlsx','B2:D52'); 
import_filename = name;
%'C:\Users\Rith\Downloads\SI_sample_subject_alpha_data.xlsx';
%'/Users/deepagupta/Google Drive/Dr Choa PhD/05 EEG/SCHIZ proj txt files /2016_01 fresh start/shared with NG/20170630_1st1000msEEGnotERP/theta_excel/P7 2st 500 theta  4 to 8 hz.xlsx';
xlrange = 'A2:C51';
space = "_";
type = ".gif";
subject = char(subject);
export_GIF_filename = strcat(category, space, subject, type);
[x] = xlsread(import_filename,xlrange);
% X_Theta = x(:,1); Y_Theta = x(:,2); Z_Theta = x(:,3);

z = x(:,3);
y = x(:,2);
x = x(:,1);
h = figure();
time = 0:10:600;
curve1 = animatedline('LineWidth',2);
curve2 = animatedline('LineWidth',1,'LineStyle',':');
set(gca,'XLim',[-100 100],'YLim',[-100 100],'ZLim',[-100 100]);
view(43,24);
hold on;
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');

for i=1:length(z)
    addpoints(curve1,x(i),y(i),z(i));
    addpoints(curve2,x(i),y(i),-100);
    pts = [x(i),y(i),z(i);x(i),y(i),-100];
    line(pts(:,1), pts(:,2), pts(:,3),'LineStyle','--');
    scatter3(x(i),y(i),z(i),'filled');
    text = strcat(num2str(time(i)),'ms');
    mTextBox = uicontrol('style','text');
    set(mTextBox,'String',text)
    drawnow
    pause(0.1);
    
    % Capture the plot as an image 
    frame = getframe(h);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);

    % Write to the GIF File 
    if i == 1
        imwrite(imind,cm,export_GIF_filename,'gif', 'Loopcount',inf);
    else
        imwrite(imind,cm,export_GIF_filename,'gif','WriteMode','append');
    end

    
end

    

function [linearCount, nonLinearCount, totalCount, ratio1, ratio2]= count_activation_duration(filename,lobename)
%% counts number of frontal lobe activations.
%input = filename (excel file outputted from sloreta), lobe name
% output = linearCount    = continuous/non-unique count of activated
%                           coordinates (this is the LSAD ratio)
%          nonLinearCount = unique count of activated coordinates (not used
%                           and can be discarded or removed)
%           totalCount    = time count
% all of the above output is returned for the lobe in lobename
 dataT = readtable(filename); % reads table from excel into dataT 
 [time elmts] = size(dataT); % time points and elements 
                            % (i.e. row and column size of table dataT)

 linearCount = 0;
 totalCount = 0;
 prevCoordinate = "";
 coordinateList = {};
 for i =1:1:time
     structure = dataT.Structure(i);
     if strcmp(structure, lobename)
         coordinate = strcat('(',int2str(dataT.X(i)),',',int2str(dataT.Y(i)),',',int2str(dataT.Z(i)),')');
         coordinateList{end+1} = coordinate;
         totalCount = totalCount + 1;
         if ~strcmp( coordinate, prevCoordinate )
             linearCount = linearCount + 1;
         end
            
         prevCoordinate = coordinate;
        
     end

 end
 [nonLinearCount] = size(unique( coordinateList ));
 ratio1 = linearCount / totalCount;
 ratio2 = nonLinearCount / totalCount;



  
     