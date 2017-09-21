%Batch import dicom


pathData = '/Volumes/Untitled/BrainPET_CT/TAU/';
%pathData = '/Users/hammesj/Downloads/CapTAINS/FBB/';

pathOutput = '/Volumes/Untitled/BrainPET_CT/TAU/Nifitis/';



%Find alls folders in pathData, then remove . and .. (first two entries)
subjectFolders = dir(pathData);
subjectFolders(not([subjectFolders(:).isdir])) = [];
subjectFolders(1:2) = [];




% Run Through Patient Folders and do the analysis
for i = 1:length(subjectFolders)
    
    % Loop through subfolders to find the final folder containing the
    % all the images
    pathPETDICOM = findFilepathDICOMSlices([pathData subjectFolders(i).name])
    
    %Make output Folders 
    currentOutputFolderpath = [pathOutput subjectFolders(i).name];
    mkdir( currentOutputFolderpath );
    
    %DICOM import 
    dicm2nii(pathPETDICOM, currentOutputFolderpath, 'nii');
    
    currentNiiPath = dir([currentOutputFolderpath filesep '*.nii']);
    currentNiiPath = [currentOutputFolderpath filesep currentNiiPath(1).name];
    movefile(currentNiiPath, [currentOutputFolderpath filesep subjectFolders(i).name '.nii']);
end
    
    