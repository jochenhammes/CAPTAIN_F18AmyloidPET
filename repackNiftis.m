%Batch repack niftis

pathData = '/Users/hammesj/Downloads/CapTAINS/AdditionalFiles/';
pathOutput = '/Users/hammesj/Downloads/CapTAINS/repackedFiles/';



%Find alls folders in pathData, then remove . and .. (first two entries)
subjectFiles = dir([pathData '*.nii']);


for i = 1:length(subjectFiles)
    
    A = load_nii([pathData subjectFiles(i).name]);
    B = make_nii(A.img, [2 2 2]);
    save_nii(B, [pathOutput 'rp_' subjectFiles(i).name]);
   
end
    
    