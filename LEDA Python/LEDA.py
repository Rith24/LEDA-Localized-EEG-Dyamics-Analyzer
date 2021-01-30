#LEDA (Localized EEG-Dynamics Analyzer): Python version
#Author/Developer: Amrithya Balasubramanian (abalasu1@umbc.edu), UMBC CS undergraduate

#This tkinter based GUI recreates the MATLAB version of LEDA. The aim is to make the python version more simpler 
#and easier to run and also without having to rely on a large software like MATLAB. 
# 
#Refer to documentation for more details on LEDA. 


#import sys

try:
    #imports here if user running python2
    import Tkinter as tk

except ImportError:
    #imports here if user is running python3
    import tkinter as tk

try:
    #again, this import if python2 is being run
    import ttk
    py3 = False
except ImportError:
    #this import is for python3 environments
    import tkinter.ttk as ttk
    py3 = True

from tkinter import filedialog as fd
import backend
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#import matlab.engine 



def vp_start_gui():
    '''Starting point when module is the main routine.'''
    global val, w, root
    root = tk.Tk()
    backend.set_Tk_var()
    top = Toplevel1 (root)
    backend.init(root, top)
    root.mainloop()

w = None
def create_Toplevel1(root, *args, **kwargs):
    '''Starting point when module is imported by another program.'''
    global w, w_win, rt
    rt = root
    w = tk.Toplevel (root)
    backend.set_Tk_var()
    top = Toplevel1 (w)
    backend.init(w, top, *args, **kwargs)
    return (w, top)

def destroy_Toplevel1():
    global w
    w.destroy()
    w = None

class Toplevel1:

    def __init__(self, top=None):
        '''This class configures and populates the toplevel window.
           top is the toplevel containing window.'''
        _bgcolor = '#d9d9d9'  # X11 color: 'gray85'
        _fgcolor = '#000000'  # X11 color: 'black'
        _compcolor = '#d9d9d9' # X11 color: 'gray85'
        _ana1color = '#d9d9d9' # X11 color: 'gray85'
        _ana2color = '#ececec' # Closest X11 color: 'gray92'

        top.geometry("1084x783+455+98")   
        top.title("LEDA")
        top.configure(background="#d9d9d9")
        top.configure(highlightbackground="#d9d9d9")
        top.configure(highlightcolor="black")

        self.Frame1 = tk.Frame(top)
        self.Frame1.place(relx=0.268, rely=0.026, relheight=0.057
                , relwidth=0.447)
        self.Frame1.configure(relief='groove')
        self.Frame1.configure(borderwidth="2")
        self.Frame1.configure(relief='groove')
        self.Frame1.configure(background="#d9d9d9")
        self.Frame1.configure(highlightbackground="#d9d9d9")
        self.Frame1.configure(highlightcolor="black")
        self.Frame1.configure(width=485)

        self.Label1 = tk.Label(self.Frame1)
        self.Label1.place(relx=0.082, rely=0.222, height=21, width=407)
        self.Label1.configure(activebackground="#f9f9f9")
        self.Label1.configure(activeforeground="black")
        self.Label1.configure(background="#d9d9d9")
        self.Label1.configure(disabledforeground="#a3a3a3")
        self.Label1.configure(foreground="#000000")
        self.Label1.configure(highlightbackground="#d9d9d9")
        self.Label1.configure(highlightcolor="black")
        self.Label1.configure(text='''Localized-EEG Dynamics Analyzer''')

        self.Label2 = tk.Label(top)
        self.Label2.place(relx=0.018, rely=0.128, height=31, width=476)
        self.Label2.configure(activebackground="#f9f9f9")
        self.Label2.configure(activeforeground="black")
        self.Label2.configure(background="#d9d9d9")
        self.Label2.configure(disabledforeground="#a3a3a3")
        self.Label2.configure(foreground="#000000")
        self.Label2.configure(highlightbackground="#d9d9d9")
        self.Label2.configure(highlightcolor="black")
        self.Label2.configure(anchor="w")
        self.Label2.configure(text='''Step 1: Select your files for each recorded condition period''')

        self.Checkbutton1 = tk.Checkbutton(top)
        self.Checkbutton1.place(relx=0.065, rely=0.179, relheight=0.047
                , relwidth=0.834)
        self.Checkbutton1.configure(activebackground="#ececec")
        self.Checkbutton1.configure(activeforeground="#000000")
        self.Checkbutton1.configure(background="#d9d9d9")
        self.Checkbutton1.configure(disabledforeground="#a3a3a3")
        self.Checkbutton1.configure(foreground="#000000")
        self.Checkbutton1.configure(highlightbackground="#d9d9d9")
        self.Checkbutton1.configure(highlightcolor="black")
        self.Checkbutton1.configure(anchor="w") #justify = "left"
        self.Checkbutton1.configure(text='''Run with conditional analysis (NOTE: Two files for conditions 1 and 2 must be selected for each subject in order)''')
        self.checkstate = tk.IntVar()
        self.Checkbutton1.configure(variable=self.checkstate)
        self.Checkbutton1.configure(width=904)

        self.Label3 = tk.Label(top)
        self.Label3.place(relx=0.065, rely=0.243, height=31, width=68)
        self.Label3.configure(activebackground="#f9f9f9")
        self.Label3.configure(activeforeground="black")
        self.Label3.configure(background="#d9d9d9")
        self.Label3.configure(disabledforeground="#a3a3a3")
        self.Label3.configure(foreground="#000000")
        self.Label3.configure(highlightbackground="#d9d9d9")
        self.Label3.configure(highlightcolor="black")
        self.Label3.configure(anchor="w")
        self.Label3.configure(text='''Patients''')

        self.Label4 = tk.Label(top)
        self.Label4.place(relx=0.637, rely=0.243, height=31, width=138)
        self.Label4.configure(activebackground="#f9f9f9")
        self.Label4.configure(activeforeground="black")
        self.Label4.configure(background="#d9d9d9")
        self.Label4.configure(disabledforeground="#a3a3a3")
        self.Label4.configure(foreground="#000000")
        self.Label4.configure(highlightbackground="#d9d9d9")
        self.Label4.configure(highlightcolor="black")
        self.Label4.configure(anchor="w")
        self.Label4.configure(text='''Healthy Controls''')
        self.Label4.configure(width=138)

        self.Button1 = tk.Button(top)
        self.Button1.place(relx=0.065, rely=0.294, height=42, width=110)
        self.Button1.configure(activebackground="#ececec")
        self.Button1.configure(activeforeground="#000000")
        self.Button1.configure(background="#d9d9d9")
        self.Button1.configure(command=self.selectPatients)
        self.Button1.configure(disabledforeground="#a3a3a3")
        self.Button1.configure(foreground="#000000")
        self.Button1.configure(highlightbackground="#d9d9d9")
        self.Button1.configure(highlightcolor="black")
        self.Button1.configure(pady="0")
        self.Button1.configure(text='''Select File(s)''')

        self.Button2 = tk.Button(top)
        self.Button2.place(relx=0.637, rely=0.294, height=42, width=110)
        self.Button2.configure(activebackground="#ececec")
        self.Button2.configure(activeforeground="#000000")
        self.Button2.configure(background="#d9d9d9")
        self.Button2.configure(command=self.selectControls)
        self.Button2.configure(disabledforeground="#a3a3a3")
        self.Button2.configure(foreground="#000000")
        self.Button2.configure(highlightbackground="#d9d9d9")
        self.Button2.configure(highlightcolor="black")
        self.Button2.configure(pady="0")
        self.Button2.configure(text='''Select File(s)''')

        self.Listbox1 = tk.Listbox(top)
        self.Listbox1.place(relx=0.065, rely=0.37, relheight=0.161
                , relwidth=0.216)
        self.Listbox1.configure(background="white")
        self.Listbox1.configure(disabledforeground="#a3a3a3")
        self.Listbox1.configure(font="TkFixedFont")
        self.Listbox1.configure(foreground="#000000")
        self.Listbox1.configure(highlightbackground="#d9d9d9")
        self.Listbox1.configure(highlightcolor="black")
        self.Listbox1.configure(selectbackground="#c4c4c4")
        self.Listbox1.configure(selectforeground="black")
        self.Listbox1.configure(width=234)

        self.Listbox2 = tk.Listbox(top)
        self.Listbox2.place(relx=0.637, rely=0.37, relheight=0.161
                , relwidth=0.216)
        self.Listbox2.configure(background="white")
        self.Listbox2.configure(disabledforeground="#a3a3a3")
        self.Listbox2.configure(font="TkFixedFont")
        self.Listbox2.configure(foreground="#000000")
        self.Listbox2.configure(highlightbackground="#d9d9d9")
        self.Listbox2.configure(highlightcolor="black")
        self.Listbox2.configure(selectbackground="#c4c4c4")
        self.Listbox2.configure(selectforeground="black")
        self.Listbox2.configure(width=234)

        self.Label5 = tk.Label(top)
        self.Label5.place(relx=0.018, rely=0.587, height=31, width=657)
        self.Label5.configure(activebackground="#f9f9f9")
        self.Label5.configure(activeforeground="black")
        self.Label5.configure(background="#d9d9d9")
        self.Label5.configure(disabledforeground="#a3a3a3")
        self.Label5.configure(foreground="#000000")
        self.Label5.configure(highlightbackground="#d9d9d9")
        self.Label5.configure(highlightcolor="black")
        self.Label5.configure(anchor="w")
        self.Label5.configure(text='''Step 2: Select features to be generates (refer to help/tutorial for more information)''')
        self.Label5.configure(width=657)

        self.Labelframe1 = tk.LabelFrame(top)
        self.Labelframe1.place(relx=0.065, rely=0.639, relheight=0.338
                , relwidth=0.59)
        self.Labelframe1.configure(relief='groove')
        self.Labelframe1.configure(foreground="black")
        self.Labelframe1.configure(text='''Generate Features''')
        self.Labelframe1.configure(background="#d9d9d9")
        self.Labelframe1.configure(highlightbackground="#d9d9d9")
        self.Labelframe1.configure(highlightcolor="black")
        self.Labelframe1.configure(width=640)

        self.Radiobutton1 = tk.Radiobutton(self.Labelframe1)
        self.Radiobutton1.place(relx=0.031, rely=0.151, relheight=0.14
                , relwidth=0.873, bordermode='ignore')
        self.Radiobutton1.configure(activebackground="#ececec")
        self.Radiobutton1.configure(activeforeground="#000000")
        self.Radiobutton1.configure(background="#d9d9d9")
        self.Radiobutton1.configure(disabledforeground="#a3a3a3")
        self.Radiobutton1.configure(foreground="#000000")
        self.Radiobutton1.configure(highlightbackground="#d9d9d9")
        self.Radiobutton1.configure(highlightcolor="black")
        self.Radiobutton1.configure(anchor="w")
        self.Radiobutton1.configure(text='''GIF activity trace animation (recommended for only 1 file at a time)''')
        self.Radiobutton1.configure(width=559)
        self.r1 = tk.IntVar()
        self.Radiobutton1.configure(variable=self.r1)
        self.Radiobutton1.configure(value = 1)

        self.Radiobutton2 = tk.Radiobutton(self.Labelframe1)
        self.Radiobutton2.place(relx=0.031, rely=0.377, relheight=0.14
                , relwidth=0.458, bordermode='ignore')
        self.Radiobutton2.configure(activebackground="#ececec")
        self.Radiobutton2.configure(activeforeground="#000000")
        self.Radiobutton2.configure(background="#d9d9d9")
        self.Radiobutton2.configure(disabledforeground="#a3a3a3")
        self.Radiobutton2.configure(foreground="#000000")
        self.Radiobutton2.configure(highlightbackground="#d9d9d9")
        self.Radiobutton2.configure(highlightcolor="black")
        self.Radiobutton2.configure(anchor="w")
        self.Radiobutton2.configure(text='''Anatomical dominance calculator''')
        self.Radiobutton2.configure(width=293)
        self.Radiobutton2.configure(variable=self.r1)
        self.Radiobutton2.configure(value = 2)

        self.Radiobutton3 = tk.Radiobutton(self.Labelframe1)
        self.Radiobutton3.place(relx=0.031, rely=0.604, relheight=0.14
                , relwidth=0.614, bordermode='ignore')
        self.Radiobutton3.configure(activebackground="#ececec")
        self.Radiobutton3.configure(activeforeground="#000000")
        self.Radiobutton3.configure(background="#d9d9d9")
        self.Radiobutton3.configure(disabledforeground="#a3a3a3")
        self.Radiobutton3.configure(foreground="#000000")
        self.Radiobutton3.configure(highlightbackground="#d9d9d9")
        self.Radiobutton3.configure(highlightcolor="black")
        self.Radiobutton3.configure(anchor="w")
        self.Radiobutton3.configure(text='''Localized Source to Activation Duration Ratio''')
        self.Radiobutton3.configure(width=393)
        #self.r3 = tk.IntVar(value = 3)
        self.Radiobutton3.configure(variable=self.r1)
        self.Radiobutton3.configure(value = 3)

        self.Button3 = tk.Button(self.Labelframe1)
        self.Button3.place(relx=0.781, rely=0.755, height=42, width=106
                , bordermode='ignore')
        self.Button3.configure(activebackground="#ececec")
        self.Button3.configure(activeforeground="#000000")
        self.Button3.configure(background="#d9d9d9")
        self.Button3.configure(command=self.run)
        self.Button3.configure(disabledforeground="#a3a3a3")
        self.Button3.configure(foreground="#000000")
        self.Button3.configure(highlightbackground="#d9d9d9")
        self.Button3.configure(highlightcolor="black")
        self.Button3.configure(pady="0")
        self.Button3.configure(text='''Run''')

        self.Button4 = tk.Button(top)
        self.Button4.place(relx=0.775, rely=0.102, height=42, width=118)
        self.Button4.configure(activebackground="#ececec")
        self.Button4.configure(activeforeground="#000000")
        self.Button4.configure(background="#d9d9d9")
        self.Button4.configure(disabledforeground="#a3a3a3")
        self.Button4.configure(foreground="#000000")
        self.Button4.configure(highlightbackground="#d9d9d9")
        self.Button4.configure(highlightcolor="black")
        self.Button4.configure(pady="0")
        self.Button4.configure(text='''Help/Tutorial''')
    
    def selectPatients(self):
        path = fd.askopenfilenames(filetypes = [('excel', '*.xlsx')])

        self.Listbox1.insert('end', path)

    def selectControls(self):
        path = fd.askopenfilenames(filetypes = [('excel', '*.xlsx')])
        self.Listbox2.insert('end', path)

    def run(self):
        #run conditional analysis 
        
        if self.checkstate.get():
            self.callConditionalAnalysis()

        
        elif self.r1.get() == 1:
            self.callGIF()
        
        elif self.r1.get() == 2:
            self.callAnatomicalDominance()
        
        elif self.r1.get() == 3:
            self.callLSAD()
        
        
        #run normal mode 
        
            
    def callConditionalAnalysis(self):
        tuples = self.Listbox1.get(0, 'end')
        patients = [str(path[0]) for path in tuples]
        tuples = self.Listbox2.get(0, 'end')
        controls = [str(path[0]) for path in tuples]

        len1 = len(patients)
        len2 = len(controls)

        print("len1 is ", len1)
        print("len2 is ", len2)

        if len1 % 2 != 0:
            print("Insufficient number of patient files: one file missing for condition 2 of last subject")
            return 

        F = 0
        P = 0
        T = 0
        O = 0

        s1p = [F, T, P, O]
        s2p = [F, T, P, O]
        s1c = [F, T, P, O]
        s2c = [F, T, P, O]

        if len1 > 1:
            for i in range(0, len1, 2):
                filename = patients[i]
                
                #F T P O denotes lsad values for each of the lobes
                F = self.count_activation_duration(filename,'Frontal Lobe');
                T = self.count_activation_duration(filename,'Temporal Lobe');
                P = self.count_activation_duration(filename,'Parietal Lobe');
                O = self.count_activation_duration(filename,'Occipital Lobe');

                s1p[0] = float((((i / 2) * s1p[0]) + F) / ((i / 2) + 1))
                s1p[1] = float((((i / 2) * s1p[1]) + T) / ((i / 2) + 1))
                s1p[2] = float((((i / 2) * s1p[2]) + P) / ((i / 2) + 1))
                s1p[3] = float((((i / 2) * s1p[3]) + O) / ((i / 2) + 1))

        
        
            for i in range(1, len1, 2):
                filename = patients[i]
                
                #F T P O denotes lsad values for each of the lobes
                F = self.count_activation_duration(filename,'Frontal Lobe');
                T = self.count_activation_duration(filename,'Temporal Lobe');
                P = self.count_activation_duration(filename,'Parietal Lobe');
                O = self.count_activation_duration(filename,'Occipetal Lobe');

                s2p[0] = float((((i // 2) * s2p[0]) + F) / ((i // 2) + 1))
                s2p[1] = float((((i // 2) * s2p[1]) + T) / ((i // 2) + 1))
                s2p[2] = float((((i // 2) * s2p[2]) + P) / ((i // 2) + 1))
                s2p[3] = float((((i // 2) * s2p[3]) + O) / ((i // 2) + 1))

        if len2 % 2 != 0:
            print("Insufficient number of control files: one file missing for condition 2 of last subject")
            return 

        
        print(s1p)
        print(s2p)
        print(s1c)
        print(s2c)
        
        if len2 > 1:
            print("its here")
            for i in range(0, len1, 2):
                filename = controls[i]
                
                #F T P O denotes lsad values for each of the lobes
                F = self.count_activation_duration(filename,'Frontal Lobe');
                T = self.count_activation_duration(filename,'Temporal Lobe');
                P = self.count_activation_duration(filename,'Parietal Lobe');
                O = self.count_activation_duration(filename,'Occipetal Lobe');

                s1c[0] = float((((i / 2) * s1c[0]) + F) / ((i / 2) + 1))
                s1c[1] = float((((i / 2) * s1c[1]) + T) / ((i / 2) + 1))
                s1c[2] = float((((i / 2) * s1c[2]) + P) / ((i / 2) + 1))
                s1c[3] = float((((i / 2) * s1c[3]) + O) / ((i / 2) + 1))

        
        
            for i in range(1, len1, 2):
                filename = controls[i]
                
                #F T P O denotes lsad values for each of the lobes
                F = self.count_activation_duration(filename,'Frontal Lobe');
                T = self.count_activation_duration(filename,'Temporal Lobe');
                P = self.count_activation_duration(filename,'Parietal Lobe');
                O = self.count_activation_duration(filename,'Occipetal Lobe');

                s2c[0] = float((((i // 2) * s2c[0]) + F) / ((i // 2) + 1))
                s2c[1] = float((((i // 2) * s2c[1]) + T) / ((i // 2) + 1))
                s2c[2] = float((((i // 2) * s2c[2]) + P) / ((i // 2) + 1))
                s2c[3] = float((((i // 2) * s2c[3]) + O) / ((i // 2) + 1))
                

        # now graph s1p, s2p, s1c, s2c
        '''
        print(s1p)
        print(s2p)
        print(s1c)
        print(s2c)
        '''

        pdata = [s1p, s2p]
        cdata = [s1c, s2c]
        
        fig, axs = plt.subplots(2, 1, constrained_layout=True)
        rng = np.arange(4)
        axs[0].bar(rng + 0.00, pdata[0], color = 'b', width = 0.25)
        axs[0].bar(rng + 0.25, pdata[1], color = 'r', width = 0.25)
        
        axs[0].set_xticks(rng+0.25)
        axs[0].set_xticklabels(('Frontal', 'Temporal', 'Parietal', 'Occipital'))
        axs[0].set_title('Patient subjects')
        #axs[0].set_xlabel('distance (m)')
        axs[0].set_ylabel('LSAD ratio')
        fig.suptitle('Average condition 1 and 2 LSAD ratio values of patient and control subjects')

        axs[1].bar(rng + 0.00, cdata[0], color = 'b', width = 0.25)
        axs[1].bar(rng + 0.25, cdata[1], color = 'r', width = 0.25)
        #axs[1].set_xlabel('time (s)')
        axs[1].set_xticks(rng+0.25)
        axs[1].set_xticklabels(('Frontal', 'Temporal', 'Parietal', 'Occipital'))
        axs[1].set_title('Control subjects')
        axs[1].set_ylabel('LSAD ratio')

        fig.legend(labels=['Condition1', 'Condition 2'])
        
        plt.show()

            

    def count_activation_duration(self, filename, lobe):
        
        df = pd.read_excel(filename)
    

        linearCount = 0
        totalCount = 0
        
        
        activations = len(df["X"].unique())
        print("activations is ", activations)

        if lobe == "Frontal Lobe":
            totalcount = len(df[df["Structure"] == "Frontal Lobe\r"])

        elif lobe == "Parietal Lobe":
            totalcount = len(df[df["Structure"] == "Parietal Lobe\r"])

        elif lobe == "Occipetal Lobe":
            totalcount = len(df[df["Structure"] == "Occipital Lobe\r"])

        else:
            totalcount = len(df[df["Structure"] == "Temporal Lobe\r"])

        print("totalcount is ", totalcount)

        ratio = float(activations / totalcount)

        return ratio


    

    def callLSAD(self):
        tuples = self.Listbox1.get(0, 'end')
        patients = [str(path[0]) for path in tuples]
        tuples = self.Listbox2.get(0, 'end')
        controls = [str(path[0]) for path in tuples]


        F = 0
        T = 0
        P = 0
        O = 0

        patientavg = [F, T, P, O]
        controlavg = [F, T, P, O]

        i = 0

        for filename in patients:
            F = self.count_activation_duration(filename,'Frontal Lobe')
            T = self.count_activation_duration(filename,'Temporal Lobe')
            P = self.count_activation_duration(filename,'Parietal Lobe')
            O = self.count_activation_duration(filename,'Occipetal Lobe')

            patientavg[0] = float(((i * patientavg[0]) + F) / (i + 1))
            patientavg[1] = float(((i * patientavg[1]) + T) / (i + 1))
            patientavg[2] = float(((i * patientavg[2]) + P) / (i + 1))
            patientavg[3] = float(((i * patientavg[3]) + O) / (i + 1))

            i = i + 1

        i = 0

        for filename in controls:
            F = self.count_activation_duration(filename,'Frontal Lobe')
            T = self.count_activation_duration(filename,'Temporal Lobe')
            P = self.count_activation_duration(filename,'Parietal Lobe')
            O = self.count_activation_duration(filename,'Occipetal Lobe')

            controlavg[0] = float(((i * controlavg[0]) + F) / (i + 1))
            controlavg[1] = float(((i * controlavg[1]) + T) / (i + 1))
            controlavg[2] = float(((i * controlavg[2]) + P) / (i + 1))
            controlavg[3] = float(((i * controlavg[3]) + O) / (i + 1))

            i = i + 1

        #now graph here
        fig, axs = plt.subplots(2, 1, constrained_layout=True)
        rng = np.arange(4)
        axs[0].bar(rng + 0.25, patientavg, color = 'b', width = 0.25)
        
        axs[0].set_xticks(rng+0.25)
        axs[0].set_xticklabels(('Frontal', 'Temporal', 'Parietal', 'Occipital'))
        axs[0].set_title('Patient subjects')
        #axs[0].set_xlabel('distance (m)')
        axs[0].set_ylabel('LSAD ratio')
        fig.suptitle('Average LSAD ratio values of patient and control subjects')

        axs[1].bar(rng + 0.25, controlavg, color = 'r', width = 0.25)
       
        #axs[1].set_xlabel('time (s)')
        axs[1].set_xticks(rng+0.25)
        axs[1].set_xticklabels(('Frontal', 'Temporal', 'Parietal', 'Occipital'))
        axs[1].set_title('Control subjects')
        axs[1].set_ylabel('LSAD ratio')

        fig.legend(labels=['Patients', 'Subjects'])
        
        plt.show()




    def callAnatomicalDominance(self):
        tuples = self.Listbox1.get(0, 'end')
        patients = [str(path[0]) for path in tuples]
        tuples = self.Listbox2.get(0, 'end')
        controls = [str(path[0]) for path in tuples]

        subjects = patients + controls
        size = len(subjects)

        negX = []
        posX = []
        negY = []
        posY = []
        negZ = []
        posZ = []

        for filename in subjects:
            pairX = self.calc_dominance(filename, 'X')
            pairY = self.calc_dominance(filename, 'Y')
            pairZ = self.calc_dominance(filename, 'Z')
            
            negX.append(pairX[0])
            posX.append(pairX[1])
            negY.append(pairY[0])
            posY.append(pairY[1])
            negZ.append(pairZ[0])
            posZ.append(pairZ[1])

        Xavg = [sum(negX)/size, sum(posX)/size]
        Yavg = [sum(negY)/size, sum(posY)/size]
        Zavg = [sum(negZ)/size, sum(posZ)/size]

        fig, axs = plt.subplots(1, 3, constrained_layout=True)
        rng = np.arange(2)
        axs[0].bar(rng + 0.25, Xavg, color = 'b', width = 0.25)
        
        axs[0].set_xticks(rng+0.25)
        axs[0].set_xticklabels(('Left Hemisphere', 'Right Hemisphere'))
        axs[0].set_ylabel('Total number of activations')
        fig.suptitle('Anatomical dominance of each lobe axis')

        axs[1].bar(rng + 0.25, Yavg, color = 'r', width = 0.25)
       
        #axs[1].set_xlabel('time (s)')
        axs[1].set_xticks(rng+0.25)
        axs[1].set_xticklabels(('Posterior', 'Anterior'))
        axs[1].set_ylabel('Total number of activations')

        axs[2].bar(rng + 0.25, Yavg, color = 'r', width = 0.25)
       
        #axs[1].set_xlabel('time (s)')
        axs[2].set_xticks(rng+0.25)
        axs[2].set_xticklabels(('Inferior', 'Superior'))
        axs[2].set_ylabel('Total number of activations')
        
        plt.show()

        


    def calc_dominance(self, filename, axis):
        df = pd.read_excel(filename)

        if axis == 'X':
            neg = len(df[df["X"] < 0])
            pos = len(df[df["X"] > 0])

        elif axis == 'Y':
            neg = len(df[df["Y"] < 0])
            pos = len(df[df["Y"] > 0])

        else:
            neg = len(df[df["Z"] < 0])
            pos = len(df[df["Z"] > 0])

        pair = [neg, pos]

        return pair

    def callGIF(self):
        tuples = self.Listbox1.get(0, 'end')
        patients = [str(path[0]) for path in tuples]
        tuples = self.Listbox2.get(0, 'end')
        controls = [str(path[0]) for path in tuples]

        category = 'patient'
        number = 1

        if len(patients) >= 1:
            for filename in patients:
                eng.generate_gif(filename, category, str(number))
                number = number + 1

        category = 'control'
        number = 1

        if len(controls) >= 1:
            for filename in controls:
                eng.generate_gif(filename, category, str(number))
                number = number + 1



if __name__ == '__main__':
    vp_start_gui()





