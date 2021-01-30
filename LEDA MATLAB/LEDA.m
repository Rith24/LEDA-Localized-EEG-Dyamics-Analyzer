function varargout = multiple_copy(varargin)
%MULTIPLE_COPY MATLAB code file for multiple_copy.fig
%      MULTIPLE_COPY, by itself, creates a new MULTIPLE_COPY or raises the existing
%      singleton*.
%
%      H = MULTIPLE_COPY returns the handle to a new MULTIPLE_COPY or the handle to
%      the existing singleton*.
%
%      MULTIPLE_COPY('Property','Value',...) creates a new MULTIPLE_COPY using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to multiple_copy_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MULTIPLE_COPY('CALLBACK') and MULTIPLE_COPY('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MULTIPLE_COPY.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help multiple_copy

% Last Modified by GUIDE v2.5 22-Dec-2019 13:19:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @multiple_copy_OpeningFcn, ...
                   'gui_OutputFcn',  @multiple_copy_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before multiple_copy is made visible.
function multiple_copy_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for multiple_copy
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes multiple_copy wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = multiple_copy_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Run Button; calls all feature functions based on button toggle states
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(handles.checkbox7, 'Value') == 1
    callConditionalAnalysis(hObject, eventdata, handles);
    
else
    if get(handles.radiobutton1, 'Value') == 1
        callGIF(hObject, eventdata, handles);
    end
    
    if get(handles.radiobutton2, 'Value') == 1
        callAnatomicalDominance(hObject, eventdata, handles);
    end
    
    if get(handles.radiobutton3, 'Value') == 1
        callLSAD(hObject, eventdata, handles);
    end
    
end


% --- checkbox to run with conditional analysis
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7











function callGIF(hObject, eventdata, handles)
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
function callAnatomicalDominance(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
size = 0;

list = get(handles.listbox1,'String');
patientList = list.';
size = size + length(patientList) - 1;

list = get(handles.listbox2,'String');
controlList = list.';
size = size + length(controlList) - 1;

X = [];
Y = [];
Z = [];

Xavg = [];
Yavg = [];
Zavg = [];

for i = 2:length(patientList)
    filename = char(patientList(1, i));
    pairX = calc_dominance(filename, 'X');
    pairY = calc_dominance(filename, 'Y');
    pairZ = calc_dominance(filename, 'Z');
    
    X = [X; pairX];
    Y = [Y; pairY];
    Z = [Z; pairZ];

    disp(X);
end

for i = 2:length(controlList)
    filename = char(controlList(1, i));
    pairX = calc_dominance(filename, 'X');
    pairY = calc_dominance(filename, 'Y');
    pairZ = calc_dominance(filename, 'Z');
    
    X = [X; pairX];
    Y = [Y; pairY];
    Z = [Z; pairZ];

end


disp(size);
negX = 0;
posX = 0;
negY = 0;
posY = 0;
negZ = 0;
posZ = 0;

for i = 1:size
    negX = negX + X(i, 1);
    posX = posX + X(i, 2);
    
    negY = negY + Y(i, 1);
    posY = posY + Y(i, 2);
    
    negZ = negZ + Z(i, 1);
    posZ = posZ + Z(i, 2);
    
end

Xavg = [negX/size, posX/size];
Yavg = [negY/size, posY/size];
Zavg = [negZ/size, posZ/size];  


figure(1);
subplot(1,3,1);
x = categorical({'Left Hemisphere', 'Right Hemisphere'});
x = reordercats(x, {'Left Hemisphere', 'Right Hemisphere'});
y = Xavg;
bar(x, y);
ylabel('Total number of activations');
subplot(1,3,2);
a = categorical({'Posterior', 'Anterior'});
a = reordercats(a, {'Posterior', 'Anterior'});
b = Yavg;
bar(a, b);
xlabel('Lobe axes');
title('Anatomical dominance of each lobe axis'); 
subplot(1,3,3);
c = categorical({'Inferior', 'Superior'});
c = reordercats(c, {'Inferior', 'Superior'});
d = Zavg;
bar(c, d);



% --- Executes on button press in checkbox3.
function callLSAD(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
list = get(handles.listbox1,'String');
patientList = list.';

patientlsad = [];
controllsad = [];
 
for i=2:length(patientList)
    filename = char(patientList(1, i));
    %F T P O denotes lsad values for each of the lobes
    F = count_activation_duration(filename,'Frontal Lobe');
    T = count_activation_duration(filename,'Temporal Lobe');
    P = count_activation_duration(filename,'Parietal Lobe');
    O = count_activation_duration(filename,'Occipetal Lobe');
    
    
    patientlsad = [patientlsad; F T P O];
    disp(patientlsad);
    
   
end

%need to implement writing individual subject data into a file

averagelsad = [];   %mean values are entered in the lobe order 'F T P O'

for i=1:4
    lobeValues = patientlsad(:, i);    
    average = mean(lobeValues);
    averagelsad = [averagelsad, average];
    
    
end

disp("average: ");
disp(averagelsad);

% creates bar graph of average lsad of all patient subjects in separate
% window
figure(2);    
x = categorical({'Frontal', 'Temporal', 'Parietal', 'Occipetal'});
x = reordercats(x, {'Frontal', 'Temporal', 'Parietal', 'Occipetal'});
y = averagelsad;
bar(x, y);                       
title('Average LSAD Ratio values of patient subjects');

    
% --- Executes on button press in checkbox6.
function callConditionalAnalysis(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6

list1 = get(handles.listbox1,'String');
patientList = list1.';

list2 = get(handles.listbox2,'String');
controlList = list2.';




s1patientlsad = [];
s2patientlsad = [];
s1controllsad = [];
s2controllsad = [];
disp(length(patientList));

if length(patientList) > 1
    for i=2:2:length(patientList)
        filename = char(patientList(1, i));
        %F T P O denotes lsad values for each of the lobes
        F = count_activation_duration(filename,'Frontal Lobe');
        T = count_activation_duration(filename,'Temporal Lobe');
        P = count_activation_duration(filename,'Parietal Lobe');
        O = count_activation_duration(filename,'Occipetal Lobe');
    
    
        s1patientlsad = [s1patientlsad; F T P O];
    end
end

if length(controlList) > 1
    for i=2:2:length(controlList)
        filename = char(controlList(1, i));
        %F T P O denotes lsad values for each of the lobes
        F = count_activation_duration(filename,'Frontal Lobe');
        T = count_activation_duration(filename,'Temporal Lobe');
        P = count_activation_duration(filename,'Parietal Lobe');
        O = count_activation_duration(filename,'Occipetal Lobe');


        s1controllsad = [s1controllsad; F T P O];
    end
    
end


if length(patientList) > 2
    for i=3:2:length(patientList)
        filename = char(patientList(1, i));
        %F T P O denotes lsad values for each of the lobes
        F = count_activation_duration(filename,'Frontal Lobe');
        T = count_activation_duration(filename,'Temporal Lobe');
        P = count_activation_duration(filename,'Parietal Lobe');
        O = count_activation_duration(filename,'Occipetal Lobe');


        s2patientlsad = [s2patientlsad; F T P O];
    end
    
end


if length(controlList) > 2
    for i=3:2:length(controlList)
        filename = char(controlList(1, i));
        %F T P O denotes lsad values for each of the lobes
        F = count_activation_duration(filename,'Frontal Lobe');
        T = count_activation_duration(filename,'Temporal Lobe');
        P = count_activation_duration(filename,'Parietal Lobe');
        O = count_activation_duration(filename,'Occipetal Lobe');


        s2controllsad = [s2controllsad; F T P O];

    end
    
end
   

%need to implement writing individual subject data into a file

s1p_averagelsad = [];   %mean values are entered in the lobe order 'F T P O'
s2p_averagelsad = [];
s1c_averagelsad = [];
s2c_averagelsad = [];

if length(patientList) > 2 && length(controlList) > 2
    for i=1:4
        s1lobeValues = s1patientlsad(:, i);
        s2lobeValues = s2patientlsad(:, i); 

        s1average = mean(s1lobeValues);
        s2average = mean(s2lobeValues);
        s1p_averagelsad = [s1p_averagelsad, s1average];
        s2p_averagelsad = [s2p_averagelsad, s2average];

        s1lobeValues = s1controllsad(:, i);
        s2lobeValues = s2controllsad(:, i); 

        s1average = mean(s1lobeValues);
        s2average = mean(s2lobeValues);
        s1c_averagelsad = [s1c_averagelsad, s1average];
        s2c_averagelsad = [s2c_averagelsad, s2average];


    end
    disp(s1c_averagelsad);

    figure(3);
    sgtitle('Average condition 1 and 2 LSAD Ratio values of patient and control subjects');
    subplot(1, 2, 1);

    y = [s1p_averagelsad(:), s2p_averagelsad(:)];

    x = categorical({'Frontal', 'Temporal', 'Parietal', 'Occipetal'});
    x = reordercats(x, {'Frontal', 'Temporal', 'Parietal', 'Occipetal'});
    patient_plot = bar(x, y);
    title('Patient subjects');

    subplot(1, 2, 2);

    y = [s1c_averagelsad(:), s2c_averagelsad(:)];

    x = categorical({'Frontal', 'Temporal', 'Parietal', 'Occipetal'});
    x = reordercats(x, {'Frontal', 'Temporal', 'Parietal', 'Occipetal'});
    control_plot = bar(x, y);
    title('Control subjects');

    labels = {'Condition 1 (S1)', 'Condition 2 (S2)'};
    legend(patient_plot, labels);
    legend(control_plot, labels);
    
end



function [linearCount, nonLinearCount, totalCount, ratio1, ratio2]= count_activation_duration(filename,lobename)
%% counts number of frontal lobe activations.
% input = filename (excel file outputted from sloreta), lobe name
% output = linearCount = continuous/non-unique count of activated
% coordinates (this is the LSAD ratio)
% nonLinearCount = unique count of activated coordinates (not used
% and can be discarded or removed)
% totalcount = time count
% all of the above output is returned for the lobe in lobename
 dataT = readtable(filename); % reads table from excel into dataT�
 [time elmts] = size(dataT); % time points and elements�
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



function createGIF(name, category, subject)
%% import file data, initialize variables
% [x] = xlsread('/Users/deepagupta/Google Drive/Dr Choa PhD/05 EEG/SCHIZ proj txt files /2016_01 fresh start/shared with NG /20170630_1st1000msEEGnotERP/theta_excel/P7 1st 500 theta 4 to 8 hz.xlsx','B2:D52');�
import_filename = name;
%'C:\Users\Rith\Downloads\SI_sample_subject_alpha_data.xlsx';
%'/Users/deepagupta/Google Drive/Dr Choa PhD/05 EEG/SCHIZ proj txt files /2016_01 fresh start/shared with NG/20170630_1st1000msEEGnotERP/theta_excel/P7 2st 500 theta� 4 to 8 hz.xlsx';
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

  
     
function[pair] = calc_dominance(filename, axis)
dataT = readtable(filename);
[time elmts] = size(dataT);

negative = 0;
positive = 0;

for i = 1:1:time
    if axis == 'X'
        coordinateVal = dataT.X(i);
    end
    
    if axis == 'Y'
        coordinateVal = dataT.Y(i);
    end
    
    if axis == 'Z'
        coordinateVal = dataT.Z(i);
    end
    
    if coordinateVal > 0
        positive = positive + 1;
    
    end 
    
    if coordinateVal < 0
        negative = negative + 1;
    end
    
end
   
pair = [negative positive]; 



% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
