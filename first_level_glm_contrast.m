subs = {'Sub08','Sub12'}

for i = 1:length(subs)
    matlabbatch = generate_glm_batch(subs{i});
    spm_jobman('run', matlabbatch);
end



function matlabbatch = generate_glm_batch(sub_name)
% Input: sub_name should be a string like 'sub01'
% Output: matlabbatch ready for use in spm_jobman('run', matlabbatch)

base_dir = 'C:\Users\S_NASSAJ\Desktop\subjects';
sub_dir = fullfile(base_dir, sub_name);
bold_dir = fullfile(sub_dir, 'BOLD');
first_level_dir = fullfile(base_dir, 'derivatives', 'first_level', sub_name);

matlabbatch{1}.spm.stats.fmri_spec.dir = {first_level_dir};
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 2;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 33;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 17;

for r = 1:9
    run_name = sprintf('Run_%02d', r);
    nii_files = dir(fullfile(bold_dir, run_name, 'swrrafMR*.nii'));
    scans = cell(length(nii_files), 1);
    for i = 1:length(nii_files)
        scans{i} = fullfile(nii_files(i).folder, [nii_files(i).name ',1']);
    end
    matlabbatch{1}.spm.stats.fmri_spec.sess(r).scans = scans;
   
    matlabbatch{1}.spm.stats.fmri_spec.sess(r).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
    matlabbatch{1}.spm.stats.fmri_spec.sess(r).multi = {fullfile(bold_dir, 'Trials', sprintf('run_%02d_spmdef.mat', r))};
    matlabbatch{1}.spm.stats.fmri_spec.sess(r).regress = struct('name', {}, 'val', {});
    motion_reg_name = dir(fullfile(bold_dir, run_name, 'rp_*.txt'));
    matlabbatch{1}.spm.stats.fmri_spec.sess(r).multi_reg = {fullfile(motion_reg_name(1).folder, motion_reg_name(1).name)};
    matlabbatch{1}.spm.stats.fmri_spec.sess(r).hpf = 128;
end

matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';

matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = ...
    cfg_dep('fMRI model specification: SPM.mat File', ...
    substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), ...
    substruct('.','spmmat'));
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;

matlabbatch{3}.spm.stats.con.spmmat(1) = ...
    cfg_dep('Model estimation: SPM.mat File', ...
    substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), ...
    substruct('.','spmmat'));

matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'Famous>0';
matlabbatch{3}.spm.stats.con.consess{1}.tcon.weights = [1 0 0];
matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'repl';

matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = 'Unfamiliar>0';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.weights = [0 1 0];
matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'repl';

matlabbatch{3}.spm.stats.con.consess{3}.tcon.name = 'Faces>Unscrambled';
matlabbatch{3}.spm.stats.con.consess{3}.tcon.weights = [1 1 -2];
matlabbatch{3}.spm.stats.con.consess{3}.tcon.sessrep = 'repl';

matlabbatch{3}.spm.stats.con.delete = 1;
end