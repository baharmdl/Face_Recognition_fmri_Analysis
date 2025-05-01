%-----------------------------------------------------------------------
% Job saved on 30-Apr-2025 16:06:36 by cfg_util (rev $Rev: 8183 $)
% spm SPM - SPM25 (25.01.02)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
spm('defaults', 'FMRI');
spm_jobman('initcfg')
matlabbatch{1}.spm.stats.factorial_design.dir = {'D:\Study\CON 1\Bio Signals\Project\derivatives\second_level\unfamiliar'};
%%
matlabbatch{1}.spm.stats.factorial_design.des.t1.scans = {
                                                          'D:\Study\CON 1\Bio Signals\Project\derivatives\first_level\Sub01\con_0002.nii,1'
                                                          'D:\Study\CON 1\Bio Signals\Project\derivatives\first_level\Sub02\con_0002.nii,1'
                                                          'D:\Study\CON 1\Bio Signals\Project\derivatives\first_level\Sub03\con_0002.nii,1'
                                                          'D:\Study\CON 1\Bio Signals\Project\derivatives\first_level\Sub04\con_0002.nii,1'
                                                          'D:\Study\CON 1\Bio Signals\Project\derivatives\first_level\Sub05\con_0002.nii,1'
                                                          'D:\Study\CON 1\Bio Signals\Project\derivatives\first_level\Sub06\con_0002.nii,1'
                                                          'D:\Study\CON 1\Bio Signals\Project\derivatives\first_level\Sub07\con_0002.nii,1'
                                                          'D:\Study\CON 1\Bio Signals\Project\derivatives\first_level\Sub08\con_0002.nii,1'
                                                          'D:\Study\CON 1\Bio Signals\Project\derivatives\first_level\Sub09\con_0002.nii,1'
                                                          'D:\Study\CON 1\Bio Signals\Project\derivatives\first_level\Sub11\con_0002.nii,1'
                                                          'D:\Study\CON 1\Bio Signals\Project\derivatives\first_level\Sub12\con_0002.nii,1'
                                                          'D:\Study\CON 1\Bio Signals\Project\derivatives\first_level\Sub13\con_0002.nii,1'
                                                          'D:\Study\CON 1\Bio Signals\Project\derivatives\first_level\Sub14\con_0002.nii,1'
                                                          'D:\Study\CON 1\Bio Signals\Project\derivatives\first_level\Sub15\con_0002.nii,1'
                                                          'D:\Study\CON 1\Bio Signals\Project\derivatives\first_level\Sub16\con_0002.nii,1'
                                                          };
%%
matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;
matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'Faces>';
matlabbatch{3}.spm.stats.con.consess{1}.tcon.weights = 1;
matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.delete = 0;
spm_jobman('serial', matlabbatch);

